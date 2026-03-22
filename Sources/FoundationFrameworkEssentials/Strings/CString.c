//
//  CString.c
//  foundation-framework
//
//  Created by Fang Ling on 2026/3/8.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

//
//  Portions of this file are derived from the FreeBSD libc implementation.
//
//  Original sources:
//    freebsd-src/lib/libc/locale/mbstowcs.c
//      - Commit hash: 559a218c9b257775fb249b67945fe4a05b7a6b9f
//    freebsd-src/lib/libc/locale/utf8.c
//      - Commit hash: 1d386b48a555f61cb7325543adbbb5c3f3407a66
//
//  Copyright (c) 2002-2004 Tim J. Robbins.
//  All rights reserved.
//
//  Copyright (c) 2011 The FreeBSD Foundation
//
//  Portions of this software were developed by David Chisnall
//  under sponsorship from the FreeBSD Foundation.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions
//  are met:
//  1. Redistributions of source code must retain the above copyright
//     notice, this list of conditions and the following disclaimer.
//  2. Redistributions in binary form must reproduce the above copyright
//     notice, this list of conditions and the following disclaimer in the
//     documentation and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
//  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
//  ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
//  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
//  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
//  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
//  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
//  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
//  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
//  SUCH DAMAGE.
//

#include "CString.h"

#include <stddef.h>

#include "../Numerics/Integer8.h"

Foundation_UnsignedInteger64
_Foundation_CString_ConvertUTF8CharacterToUTF32Character(
  Foundation_Integer32* destination,
  Foundation_CString source,
  Foundation_UnsignedInteger64 n,
  struct _Foundation_CString_UTF8StateMachine* stateMachine
) {
  if (stateMachine->remainingByteCount < 0 ||
      stateMachine->remainingByteCount > 6) {
    return -1;
  }

  if (source == NULL) {
    source = "";
    n = 1;
    destination = NULL;
  }

  /* Incomplete multibyte sequence */
  if (n == 0) {
    return -2;
  }

  var remainingByteCount = 0;
  var leastValidCodePoint = 0;
  var mask = 0;
  if (stateMachine->remainingByteCount == 0) {
    /*
     * Determine the number of octets that make up this character from the first
     * octet, and a mask that extracts the interesting bits of the first octet.
     * We already know the character is at least two bytes long.
     *
     * We also specify a lower bound for the character code to detect redundant,
     * non-"shortest form" encodings. For example, the sequence C0 80 is _not_ a
     * legal representation of the null character. This enforces a 1-to-1
     * mapping between character codes and their multibyte representations.
     */
    let newCharacter =
      (Foundation_Integer32)((Foundation_UnsignedInteger8)*source);
    if ((newCharacter & 0x80) == 0) {
      /* Fast path for plain ASCII characters. */
      if (destination != NULL) {
        *destination = newCharacter;
      }

      return newCharacter != '\0' ? 1 : 0;
    }

    if ((newCharacter & 0xe0) == 0xc0) {
      mask = 0x1f;
      remainingByteCount = 2;
      leastValidCodePoint = 0x80;
    } else if ((newCharacter & 0xf0) == 0xe0) {
      mask = 0x0f;
      remainingByteCount = 3;
      leastValidCodePoint = 0x800;
    } else if ((newCharacter & 0xf8) == 0xf0) {
      mask = 0x07;
      remainingByteCount = 4;
      leastValidCodePoint = 0x10000;
    } else {
      /*
       * Malformed input; input is not UTF-8.
       */
      return -1;
    }
  } else {
    remainingByteCount = stateMachine->remainingByteCount;
    leastValidCodePoint = stateMachine->leastValidCodePoint;
  }

  /*
   * Decode the octet sequence representing the character in chunks of 6 bits,
   * most significant first.
   */
  var currentCodePoint = 0;
  if (stateMachine->remainingByteCount == 0) {
    currentCodePoint = (Foundation_UnsignedInteger8)*source++ & mask;
  } else {
    currentCodePoint = stateMachine->currentCodePoint;
  }

  var i = 0;
  for (i = (stateMachine->remainingByteCount == 0) ? 1 : 0;
       i < Foundation_Integer64_FindMinimum(remainingByteCount, n);
       i += 1) {
    if ((*source & 0xc0) != 0x80) {
      /* Malformed input; bad characters in the middle of a character. */
      return -1;
    }
    currentCodePoint <<= 6;
    currentCodePoint |= *source++ & 0x3f;
  }

  if (i < remainingByteCount) {
    /* Incomplete multibyte sequence. */
    stateMachine->remainingByteCount = remainingByteCount - i;
    stateMachine->leastValidCodePoint = leastValidCodePoint;
    stateMachine->currentCodePoint = currentCodePoint;

    return -2;
  }

  if (currentCodePoint < leastValidCodePoint) {
    /* Malformed input; redundant encoding. */
    return -1;
  }

  if ((currentCodePoint >= 0xd800 && currentCodePoint <= 0xdfff) ||
      currentCodePoint > 0x10ffff) {
    /* Malformed input; invalid code points. */
    return -1;
  }

  if (destination != NULL) {
    *destination = currentCodePoint;
  }
  stateMachine->remainingByteCount = 0;

  return currentCodePoint == '\0' ? 0 : remainingByteCount;
}

Foundation_UnsignedInteger64
_Foundation_CString_ConvertUTF8StringToUTF32String(
  Foundation_Integer32* destination,
  Foundation_CString* source,
  Foundation_UnsignedInteger64 maximumAllowedSize,
  Foundation_UnsignedInteger64 destinationSize,
  struct _Foundation_CString_UTF8StateMachine* stateMachine
) {
  var string = *source;

  /*
   * The fast path in the loop below is not safe if an ASCII character appears
   * as anything but the first byte of a multibyte sequence. Check now to avoid
   * doing it in the loop.
   */
  if (maximumAllowedSize > 0 &&
      destinationSize > 0 &&
      stateMachine->remainingByteCount > 0 &&
      (Foundation_Integer8)*string > 0) {
    return -1;
  }

  Foundation_UnsignedInteger64 unicodeCharacterCount = 0;
  Foundation_UnsignedInteger64 utf8CharacterCount = 0;
  while (destinationSize-- > 0) {
    if (maximumAllowedSize > 0 && (Foundation_Integer8)*string > 0) {
      /* Fast path for plain ASCII characters excluding NULL. */
      *destination = (Foundation_Integer32)*string;
      utf8CharacterCount = 1;
    } else {
      utf8CharacterCount =
        _Foundation_CString_ConvertUTF8CharacterToUTF32Character(
          destination,
          string,
          maximumAllowedSize,
          stateMachine
        );

      if (utf8CharacterCount == -1) {
        *source = string;

        return -1;
      } else if (utf8CharacterCount == -2) {
        *source = string + maximumAllowedSize;

        return unicodeCharacterCount;
      } else if (utf8CharacterCount == 0) {
        *source = NULL;

        return unicodeCharacterCount;
      }
    }

    string += utf8CharacterCount;
    maximumAllowedSize -= utf8CharacterCount;
    unicodeCharacterCount += 1;
    destination += 1;
  }

  *source = string;

  return unicodeCharacterCount;
}
