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
    CUnsignedInteger64 unsignedInteger64;
  } _value;
}

@end

@implementation FoundationCoreFoundationNumber

- (instancetype)initWithUnsignedInteger:(CUnsignedInteger64)value {
  if (!(self = [super init])) {
    return nil;
  }

  self->_value.unsignedInteger64 = value;

  return self;
}

- (CUnsignedInteger64)unsignedIntegerValue {
  return CoreFoundationNumberGetUnsignedIntegerValue(
    (bridging CoreFoundationNumber*)self
  );
}

@end

/*
 * Exposed to CoreFoundation to ensure correct initialization of the Objective-C
 * instance.
 */
CoreFoundationAnyObject*
FoundationCoreFoundationNumberInitializeWithUnsignedInteger(
  CUnsignedInteger64 value
) {
  let number =
    [[FoundationCoreFoundationNumber alloc] initWithUnsignedInteger:value];

  return (retainedbridging CoreFoundationAnyObject*)number;
}

C_ASSUME_NONNULL_END
