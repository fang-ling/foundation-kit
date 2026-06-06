/*
 *  FoundationCoreFoundationString.m
 *  foundation-kit
 *
 *  Created by Fang Ling on 2026/5/1.
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

#import "FoundationCoreFoundationString.h"

#import <CoreFoundationKit/CoreFoundationKit.h>

C_ASSUME_NONNULL_BEGIN

@interface _FoundationCoreFoundationString() {
  CInteger32* _characters;
  CInteger _count;
}

@end

@implementation _FoundationCoreFoundationString

- (nullable instancetype)initWithCString:(CString)cString {
  if (!(self = [super init])) {
    return nil;
  }

  let cStringCount = CStringGetCount(cString);
  self->_count = CStringConvertUTF8CharactersToUTF32Characters(
    null,
    cString,
    cStringCount,
    0
  );

  self->_characters = CMemoryAllocate(self->_count * sizeof(CInteger32));
  CStringConvertUTF8CharactersToUTF32Characters(
    self->_characters,
    cString,
    cStringCount,
    self->_count
  );

  if (self->_count == -1) {
    CMemoryDeallocate(self->_characters);

    return nil;
  }

  return self;
}

- (instancetype)initWithFormat:(FoundationString*)format
                     arguments:(CVariableArgumentList)arguments {
  let formatCount = format.cStringCount;
  let formatCString = (CInteger8*)CMemoryAllocate(
    (formatCount + 1) * sizeof(CInteger8)
  );
  [format copyCString:formatCString];

  let cString = (CInteger8*)CMemoryAllocate(1 * sizeof(CInteger8));
  let cStringCapacity = 1l;
  let cStringCount = 0l;

  let i = 0l;
  for (; i < formatCount; i += 1) {
    let buffer = (CInteger8*)null;
    let bufferCount = 0l;
    let needsDeallocate = no;

    if (formatCString[i] == '%' && formatCString[i + 1] == 'd') {
      let value = CVariableArgumentListGetNextArgument(arguments, CInteger);

      buffer = (CInteger8 [32]){ 0 };
      bufferCount = CStringInitializeWithFormat(buffer, "%ld", value);

      i += 1;
      needsDeallocate = no;
    } else if (formatCString[i] == '%' && formatCString[i + 1] == 'f') {
      let value = CVariableArgumentListGetNextArgument(
        arguments,
        CFloatingPoint64
      );

      buffer = (CInteger8 [32]){ 0 };
      bufferCount = CStringInitializeWithFormat(buffer, "%lf", value);

      i += 1;
      needsDeallocate = no;
    } else if (formatCString[i] == '%' && formatCString[i + 1] == '@') {
      ObjectiveCAnyObject value = CVariableArgumentListGetNextArgument(
        arguments,
        ObjectiveCAnyObject
      );

      let descriptionString = ((ObjectiveCObject*)value).description;

      bufferCount = descriptionString.cStringCount;
      buffer = (CInteger8*)CMemoryAllocate(
        (bufferCount + 1) * sizeof(CInteger8)
      );
      [descriptionString copyCString:buffer];

      i += 1;
      needsDeallocate = yes;
    } else {
      let j = i;
      for (; j < formatCount && formatCString[j] != '%'; j += 1);

      bufferCount = j - i;
      buffer = (CInteger8*)CMemoryAllocate(bufferCount * sizeof(CInteger8));

      let k = 0l;
      for (j = i; k < bufferCount; k += 1, j += 1) {
        buffer[k] = formatCString[j];
      }

      i = j - 1;
      needsDeallocate = yes;
    }

    /* Append the buffer to cString. */
    while (cStringCapacity < cStringCount + bufferCount + 1) {
      cStringCapacity *= 2;
      cString = CMemoryResize(cString, cStringCapacity * sizeof(CInteger8));
    }
    CMemoryCopy(
      cString + cStringCount,
      buffer,
      bufferCount * sizeof(CInteger8)
    );
    cStringCount += bufferCount;

    if (needsDeallocate) {
      CMemoryDeallocate(buffer);
    }
  }

  cString[cStringCount] = '\0';
  self = [[_FoundationCoreFoundationString alloc] initWithCString:cString];

  CMemoryDeallocate(cString);

  return self;
}

- (void)dealloc {
  CMemoryDeallocate(self->_characters);
}

- (CInteger)count {
  return CoreFoundationStringGetCount((bridging CoreFoundationString*)self);
}

- (void)copyCharacters:(CInteger32*)characters {
  CoreFoundationStringCopyCharacters(
    (bridging CoreFoundationString*)self,
    characters
  );
}

@end

@implementation _FoundationCoreFoundationString (ObjectiveCEquatable)

- (CBoolean)isEqual:(nullable ObjectiveCAnyObject)object {
  if (object == self) {
    return yes;
  }

  if (![object isKindOfClass:FoundationString.class]) {
    return no;
  }

  if ([object isKindOfClass:_FoundationCoreFoundationString.class]) {
    let result = CoreFoundationStringCompare(
      (bridging CoreFoundationString*)self,
      (bridging CoreFoundationString*)object
    );

    return result == kCoreFoundationComparisonResultSameOrder ? yes : no;
  }

  let otherString = (FoundationString*)object;
  if (self.count != otherString.count) {
    return no;
  }

  let count = self.count;
  let selfCharacters = (CInteger32*)CMemoryAllocate(count * sizeof(CInteger32));
  let otherCharacters = (CInteger32*)CMemoryAllocate(
    count * sizeof(CInteger32)
  );

  [self copyCharacters:selfCharacters];
  [otherString copyCharacters:otherCharacters];

  let result = CMemoryCompare(
    selfCharacters,
    otherCharacters,
    count * sizeof(CInteger32)
  );

  CMemoryDeallocate(selfCharacters);
  CMemoryDeallocate(otherCharacters);

  return result == 0 ? yes : no;
}

@end

/*
 * Exposed to CoreFoundation to ensure correct initialization of the Objective-C
 * instance.
 */
CoreFoundationAnyObject*
FoundationCoreFoundationStringInitializeWithCString(CString cString) {
  let string =
    [[_FoundationCoreFoundationString alloc] initWithCString:cString];

  return (retainedbridging CoreFoundationAnyObject*)string;
}

C_ASSUME_NONNULL_END
