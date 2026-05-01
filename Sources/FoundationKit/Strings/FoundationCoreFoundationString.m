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

@interface FoundationCoreFoundationString() {
  CInteger32* _characters;
  CUnsignedInteger64 _count;
}

@end

@implementation FoundationCoreFoundationString

- (nullable instancetype)initWithCString:(CString)cString {
  if (!(self = [super init])) {
    return nil;
  }

  let cStringCount = CStringGetCount(cString);
  self->_characters = CMemoryAllocate(cStringCount * sizeof(CInteger32));

  let count = CStringConvertUTF8CharactersToUTF32Characters(
    self->_characters,
    &cString,
    cStringCount,
    cStringCount
  );
  if (count == -1) {
    CMemoryDeallocate(self->_characters);

    return nil;
  }

  self->_count = count;

  return self;
}

- (CUnsignedInteger64)count {
  return CoreFoundationStringGetCount((bridging CoreFoundationString*)self);
}

- (void)copyCharacters:(CInteger32*)characters {
  CoreFoundationStringCopyCharacters(
    (bridging CoreFoundationString*)self,
    characters
  );
}

@end

/*
 * Exposed to CoreFoundation to ensure correct initialization of the Objective-C
 * instance.
 */
CoreFoundationAnyObject*
FoundationCoreFoundationStringInitializeWithCString(CString cString) {
  let string = [[FoundationCoreFoundationString alloc] initWithCString:cString];

  return (retained_bridging CoreFoundationAnyObject*)string;
}

C_ASSUME_NONNULL_END
