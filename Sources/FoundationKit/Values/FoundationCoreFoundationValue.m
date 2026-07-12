/*
 *  FoundationCoreFoundationValue.m
 *  foundation-kit
 *
 *  Created by Fang Ling on 2026/6/13.
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

#import "FoundationCoreFoundationValue.h"

#import <CoreFoundationKit/CoreFoundationKit.h>

C_ASSUME_NONNULL_BEGIN

@interface _FoundationCoreFoundationValue() {
  void* _value;
  CInteger _size;
}

@end

@implementation _FoundationCoreFoundationValue

- (instancetype)initWithBytes:(const void*)bytes size:(CInteger)size {
  if (!(self = [super init])) {
    return nil;
  }

  self->_value = CMemoryAllocate(1, size);
  CMemoryCopy(self->_value, bytes, size);
  self->_size = size;

  return self;
}

- (void)dealloc {
  CMemoryDeallocate(self->_value);
}

- (CInteger)size {
  return self->_size;
}

- (void)copyValue:(void*)value {
  CMemoryCopy(value, self->_value, self->_size);
}

@end

/*
 * Exposed to CoreFoundation to ensure correct initialization of the Objective-C
 * instance.
 */
CoreFoundationAnyObject*
FoundationCoreFoundationValueInitializeWithBytesAndSize(
  const void* bytes,
  CInteger size
) {
  let value =
    [[_FoundationCoreFoundationValue alloc] initWithBytes:bytes size:size];

  return (retainedbridging CoreFoundationAnyObject*)value;
}

C_ASSUME_NONNULL_END
