/*
 *  FoundationNumber.m
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

#import "FoundationNumber.h"

#import "FoundationCoreFoundationNumber.h"

C_ASSUME_NONNULL_BEGIN

@implementation FoundationNumber

+ (instancetype)makeNumberWithInteger64:(CInteger64)value {
  return
    [[FoundationCoreFoundationNumber alloc] initWithInteger64:value];
}

+ (instancetype)makeNumberWithUnsignedInteger64:(CUnsignedInteger64)value {
  return
    [[FoundationCoreFoundationNumber alloc] initWithUnsignedInteger64:value];
}

+ (instancetype)makeNumberWithFloatingPoint64:(CFloatingPoint64)value {
  return
    [[FoundationCoreFoundationNumber alloc] initWithFloatingPoint64:value];
}

- (CInteger64)integer64Value {
  CDebuggingHaltWithMessage(
    "*** ABSTRACT METHOD integer64Value IS BEING CALLED. ***"
  );
}

- (CUnsignedInteger64)unsignedInteger64Value {
  CDebuggingHaltWithMessage(
    "*** ABSTRACT METHOD unsignedInteger64Value IS BEING CALLED. ***"
  );
}

- (CFloatingPoint64)floatingPoint64 {
  CDebuggingHaltWithMessage(
    "*** ABSTRACT METHOD floatingPoint64 IS BEING CALLED. ***"
  );
}

@end

C_ASSUME_NONNULL_END
