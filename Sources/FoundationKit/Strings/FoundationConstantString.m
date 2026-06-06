/*
 *  FoundationConstantString.m
 *  foundation-kit
 *
 *  Created by Fang Ling on 2026/5/23.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

#import "FoundationConstantString.h"

C_ASSUME_NONNULL_BEGIN

@interface _FoundationConstantString() {
  CString _cString;
  CUnsignedInteger32 _cStringCount;
}

@end

@implementation _FoundationConstantString

- (CInteger)count {
  return CStringConvertUTF8CharactersToUTF32Characters(
    null,
    self->_cString,
    self->_cStringCount,
    0
  );
}

- (CInteger)cStringCount {
  return self->_cStringCount;
}

- (instancetype)copy {
  return self;
}

- (void)copyCharacters:(CInteger32*)characters {
  CStringConvertUTF8CharactersToUTF32Characters(
    characters,
    self->_cString,
    self->_cStringCount,
    self->_cStringCount
  );
}

- (void)copyCString:(CInteger8*)cString {
  CMemoryCopy(cString, self->_cString, self->_cStringCount);
  cString[self->_cStringCount] = '\0';
}

@end

@implementation _FoundationConstantString (ObjectiveCEquatable)

- (CBoolean)isEqual:(nullable ObjectiveCAnyObject)object {
  if (object == self) {
    return yes;
  }

  if (![object isKindOfClass:FoundationString.class]) {
    return no;
  }

  let otherString = (FoundationString*)object;
  if (self.cStringCount != otherString.cStringCount) {
    return no;
  }

  let otherCString = (CInteger8*)CMemoryAllocate(
    (self->_cStringCount + 1) * sizeof(CInteger8)
  );
  [otherString copyCString:otherCString];

  let result = CStringCompare(self->_cString, otherCString);

  CMemoryDeallocate(otherCString);

  return result == 0 ? yes : no;
}

@end

C_ASSUME_NONNULL_END
