/*
 *  FoundationCoreFoundationNumber.m
 *  foundation-kit
 *
 *  Created by Fang Ling on 2026/4/25.
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

#import "FoundationCoreFoundationNumber.h"

#import <CoreFoundationKit/CoreFoundationKit.h>

C_ASSUME_NONNULL_BEGIN

@interface FoundationCoreFoundationNumber() {
  union {
    CInteger64 integer64;
    CUnsignedInteger64 unsignedInteger64;
    CFloatingPoint64 floatingPoint64;
  } _value;

  CoreFoundationNumberType _type;
}

@end

@implementation FoundationCoreFoundationNumber

- (instancetype)initWithInteger64:(CInteger64)value {
  if (!(self = [super init])) {
    return nil;
  }

  self->_value.integer64 = value;

  return self;
}

- (instancetype)initWithUnsignedInteger64:(CUnsignedInteger64)value {
  if (!(self = [super init])) {
    return nil;
  }

  self->_value.unsignedInteger64 = value;

  return self;
}

- (instancetype)initWithFloatingPoint64:(CFloatingPoint64)value {
  if (!(self = [super init])) {
    return nil;
  }

  self->_value.floatingPoint64 = value;

  return self;
}

- (CInteger64)integer64Value {
  let value = 0ll;
  CoreFoundationNumberGetValue((bridging CoreFoundationNumber*)self, &value);

  return value;
}

- (CUnsignedInteger64)unsignedInteger64Value {
  let value = 0ull;
  CoreFoundationNumberGetValue((bridging CoreFoundationNumber*)self, &value);

  return value;
}

- (CFloatingPoint64)floatingPoint64Value {
  let value = 0.0;
  CoreFoundationNumberGetValue((bridging CoreFoundationNumber*)self, &value);

  return value;
}

@end

/*
 * Exposed to CoreFoundation to ensure correct initialization of the Objective-C
 * instance.
 */
CoreFoundationAnyObject*
FoundationCoreFoundationNumberInitialize(
  CoreFoundationNumberType type,
  void* valueBuffer
) {
  let number = (FoundationCoreFoundationNumber*)nil;

  switch (type) {
    case kCoreFoundationNumberTypeInteger64: {
      let n = *(CInteger64*)valueBuffer;
      number = [[FoundationCoreFoundationNumber alloc] initWithInteger64:n];
      break;
    }

    case kCoreFoundationNumberTypeUnsignedInteger64: {
      let n = *(CUnsignedInteger64*)valueBuffer;
      number =
        [[FoundationCoreFoundationNumber alloc] initWithUnsignedInteger64:n];
      break;
    }

    case kCoreFoundationNumberTypeFloatingPoint64: {
      let n = *(CFloatingPoint64*)valueBuffer;
      number =
        [[FoundationCoreFoundationNumber alloc] initWithFloatingPoint64:n];
      break;
    }
  }


  return (retainedbridging CoreFoundationAnyObject*)number;
}

C_ASSUME_NONNULL_END
