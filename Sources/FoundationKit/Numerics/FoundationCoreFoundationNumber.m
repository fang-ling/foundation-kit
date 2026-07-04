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

@interface _FoundationCoreFoundationNumber() {
  union {
    CInteger8 integer8;
    CInteger16 integer16;
    CInteger32 integer32;
    CInteger64 integer64;
    CInteger integer;
    CUnsignedInteger8 unsignedInteger8;
    CUnsignedInteger16 unsignedInteger16;
    CUnsignedInteger32 unsignedInteger32;
    CUnsignedInteger64 unsignedInteger64;
    CUnsignedInteger unsignedInteger;
    CFloatingPoint32 floatingPoint32;
    CFloatingPoint64 floatingPoint64;
    CFloatingPoint floatingPoint;
  } _value;

  CoreFoundationNumberType _type;
}

@end

@implementation _FoundationCoreFoundationNumber

- (instancetype)initWithInteger8:(CInteger8)value {
  if (!(self = [super init])) {
    return nil;
  }

  self->_value.integer8 = value;
  self->_type = kCoreFoundationNumberTypeInteger8;

  return self;
}

- (instancetype)initWithInteger16:(CInteger16)value {
  if (!(self = [super init])) {
    return nil;
  }

  self->_value.integer16 = value;
  self->_type = kCoreFoundationNumberTypeInteger16;

  return self;
}

- (instancetype)initWithInteger32:(CInteger32)value {
  if (!(self = [super init])) {
    return nil;
  }

  self->_value.integer32 = value;
  self->_type = kCoreFoundationNumberTypeInteger32;

  return self;
}

- (instancetype)initWithInteger64:(CInteger64)value {
  if (!(self = [super init])) {
    return nil;
  }

  self->_value.integer64 = value;
  self->_type = kCoreFoundationNumberTypeInteger64;

  return self;
}

- (instancetype)initWithInteger:(CInteger)value {
  if (!(self = [super init])) {
    return nil;
  }

  self->_value.integer = value;
  self->_type = kCoreFoundationNumberTypeInteger;

  return self;
}

- (instancetype)initWithUnsignedInteger8:(CUnsignedInteger8)value {
  if (!(self = [super init])) {
    return nil;
  }

  self->_value.unsignedInteger8 = value;
  self->_type = kCoreFoundationNumberTypeUnsignedInteger8;

  return self;
}

- (instancetype)initWithUnsignedInteger16:(CUnsignedInteger16)value {
  if (!(self = [super init])) {
    return nil;
  }

  self->_value.unsignedInteger16 = value;
  self->_type = kCoreFoundationNumberTypeUnsignedInteger16;

  return self;
}

- (instancetype)initWithUnsignedInteger32:(CUnsignedInteger32)value {
  if (!(self = [super init])) {
    return nil;
  }

  self->_value.unsignedInteger32 = value;
  self->_type = kCoreFoundationNumberTypeUnsignedInteger32;

  return self;
}

- (instancetype)initWithUnsignedInteger64:(CUnsignedInteger64)value {
  if (!(self = [super init])) {
    return nil;
  }

  self->_value.unsignedInteger64 = value;
  self->_type = kCoreFoundationNumberTypeUnsignedInteger64;

  return self;
}

- (instancetype)initWithUnsignedInteger:(CUnsignedInteger)value {
  if (!(self = [super init])) {
    return nil;
  }

  self->_value.unsignedInteger = value;
  self->_type = kCoreFoundationNumberTypeUnsignedInteger;

  return self;
}

- (instancetype)initWithFloatingPoint32:(CFloatingPoint32)value {
  if (!(self = [super init])) {
    return nil;
  }

  self->_value.floatingPoint32 = value;
  self->_type = kCoreFoundationNumberTypeFloatingPoint32;

  return self;
}

- (instancetype)initWithFloatingPoint64:(CFloatingPoint64)value {
  if (!(self = [super init])) {
    return nil;
  }

  self->_value.floatingPoint64 = value;
  self->_type = kCoreFoundationNumberTypeFloatingPoint64;

  return self;
}

- (instancetype)initWithFloatingPoint:(CFloatingPoint)value {
  if (!(self = [super init])) {
    return nil;
  }

  self->_value.floatingPoint = value;
  self->_type = kCoreFoundationNumberTypeFloatingPoint;

  return self;
}

- (CInteger8)integer8Value {
  let value = (CInteger8)0;
  CoreFoundationNumberGetValue((bridging CoreFoundationNumber*)self, &value);

  return value;
}

- (CInteger16)integer16Value {
  let value = (CInteger16)0;
  CoreFoundationNumberGetValue((bridging CoreFoundationNumber*)self, &value);

  return value;
}

- (CInteger32)integer32Value {
  let value = (CInteger32)0;
  CoreFoundationNumberGetValue((bridging CoreFoundationNumber*)self, &value);

  return value;
}

- (CInteger64)integer64Value {
  let value = 0ll;
  CoreFoundationNumberGetValue((bridging CoreFoundationNumber*)self, &value);

  return value;
}

- (CInteger)integerValue {
  let value = (CInteger)0;
  CoreFoundationNumberGetValue((bridging CoreFoundationNumber*)self, &value);

  return value;
}

- (CUnsignedInteger8)unsignedInteger8Value {
  let value = (CUnsignedInteger8)0;
  CoreFoundationNumberGetValue((bridging CoreFoundationNumber*)self, &value);

  return value;
}

- (CUnsignedInteger16)unsignedInteger16Value {
  let value = (CUnsignedInteger16)0;
  CoreFoundationNumberGetValue((bridging CoreFoundationNumber*)self, &value);

  return value;
}

- (CUnsignedInteger32)unsignedInteger32Value {
  let value = (CUnsignedInteger32)0;
  CoreFoundationNumberGetValue((bridging CoreFoundationNumber*)self, &value);

  return value;
}

- (CUnsignedInteger64)unsignedInteger64Value {
  let value = 0ull;
  CoreFoundationNumberGetValue((bridging CoreFoundationNumber*)self, &value);

  return value;
}

- (CUnsignedInteger)unsignedIntegerValue {
  let value = (CUnsignedInteger)0;
  CoreFoundationNumberGetValue((bridging CoreFoundationNumber*)self, &value);

  return value;
}

- (CFloatingPoint32)floatingPoint32Value {
  let value = (CFloatingPoint32)0;
  CoreFoundationNumberGetValue((bridging CoreFoundationNumber*)self, &value);

  return value;
}

- (CFloatingPoint64)floatingPoint64Value {
  let value = 0.0;
  CoreFoundationNumberGetValue((bridging CoreFoundationNumber*)self, &value);

  return value;
}

- (CFloatingPoint)floatingPointValue {
  let value = (CFloatingPoint)0;
  CoreFoundationNumberGetValue((bridging CoreFoundationNumber*)self, &value);

  return value;
}

- (CInteger)size {
  return sizeof(self->_value);
}

- (void)copyValue:(void*)value {
  CMemoryCopy(value, &self->_value, sizeof(self->_value));
}

/* MARK: - ObjectiveCCopyable Implementations */
- (ObjectiveCAnyObject)copy {
  return self;
}

/* MARK: - FoundationComparable Implementations */
- (FoundationComparisonResult)compare:(ObjectiveCAnyObject)object {
  return CoreFoundationNumberCompare(
    (bridging CoreFoundationAnyObject*)self,
    (bridging CoreFoundationAnyObject*)object
  );
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
  let number = (_FoundationCoreFoundationNumber*)nil;

  switch (type) {
    case kCoreFoundationNumberTypeInteger8: {
      let n = *(CInteger8*)valueBuffer;
      number = [[_FoundationCoreFoundationNumber alloc] initWithInteger8:n];
      break;
    }

    case kCoreFoundationNumberTypeInteger16: {
      let n = *(CInteger16*)valueBuffer;
      number = [[_FoundationCoreFoundationNumber alloc] initWithInteger16:n];
      break;
    }

    case kCoreFoundationNumberTypeInteger32: {
      let n = *(CInteger32*)valueBuffer;
      number = [[_FoundationCoreFoundationNumber alloc] initWithInteger32:n];
      break;
    }

    case kCoreFoundationNumberTypeInteger64: {
      let n = *(CInteger64*)valueBuffer;
      number = [[_FoundationCoreFoundationNumber alloc] initWithInteger64:n];
      break;
    }

    case kCoreFoundationNumberTypeInteger: {
      let n = *(CInteger*)valueBuffer;
      number = [[_FoundationCoreFoundationNumber alloc] initWithInteger:n];
      break;
    }

    case kCoreFoundationNumberTypeUnsignedInteger8: {
      let n = *(CUnsignedInteger8*)valueBuffer;
      number =
        [[_FoundationCoreFoundationNumber alloc] initWithUnsignedInteger8:n];
      break;
    }

    case kCoreFoundationNumberTypeUnsignedInteger16: {
      let n = *(CUnsignedInteger16*)valueBuffer;
      number =
        [[_FoundationCoreFoundationNumber alloc] initWithUnsignedInteger16:n];
      break;
    }

    case kCoreFoundationNumberTypeUnsignedInteger32: {
      let n = *(CUnsignedInteger32*)valueBuffer;
      number =
        [[_FoundationCoreFoundationNumber alloc] initWithUnsignedInteger32:n];
      break;
    }

    case kCoreFoundationNumberTypeUnsignedInteger64: {
      let n = *(CUnsignedInteger64*)valueBuffer;
      number =
        [[_FoundationCoreFoundationNumber alloc] initWithUnsignedInteger64:n];
      break;
    }

    case kCoreFoundationNumberTypeUnsignedInteger: {
      let n = *(CUnsignedInteger*)valueBuffer;
      number =
        [[_FoundationCoreFoundationNumber alloc] initWithUnsignedInteger:n];
      break;
    }

    case kCoreFoundationNumberTypeFloatingPoint32: {
      let n = *(CFloatingPoint32*)valueBuffer;
      number =
        [[_FoundationCoreFoundationNumber alloc] initWithFloatingPoint32:n];
      break;
    }

    case kCoreFoundationNumberTypeFloatingPoint64: {
      let n = *(CFloatingPoint64*)valueBuffer;
      number =
        [[_FoundationCoreFoundationNumber alloc] initWithFloatingPoint64:n];
      break;
    }

    case kCoreFoundationNumberTypeFloatingPoint: {
      let n = *(CFloatingPoint*)valueBuffer;
      number =
        [[_FoundationCoreFoundationNumber alloc] initWithFloatingPoint:n];
      break;
    }
  }


  return (retainedbridging CoreFoundationAnyObject*)number;
}

C_ASSUME_NONNULL_END
