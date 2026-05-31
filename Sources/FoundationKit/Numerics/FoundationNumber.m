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

+ (instancetype)makeNumberWithInteger8:(CInteger8)value {
  return
    [[_FoundationCoreFoundationNumber alloc] initWithInteger8:value];
}

+ (instancetype)makeNumberWithInteger16:(CInteger16)value {
  return
    [[_FoundationCoreFoundationNumber alloc] initWithInteger16:value];
}

+ (instancetype)makeNumberWithInteger32:(CInteger32)value {
  return
    [[_FoundationCoreFoundationNumber alloc] initWithInteger32:value];
}

+ (instancetype)makeNumberWithInteger64:(CInteger64)value {
  return
    [[_FoundationCoreFoundationNumber alloc] initWithInteger64:value];
}

+ (instancetype)makeNumberWithInteger:(CInteger)value {
  return
    [[_FoundationCoreFoundationNumber alloc] initWithInteger:value];
}

+ (instancetype)makeNumberWithUnsignedInteger8:(CUnsignedInteger8)value {
  return
    [[_FoundationCoreFoundationNumber alloc] initWithUnsignedInteger8:value];
}

+ (instancetype)makeNumberWithUnsignedInteger16:(CUnsignedInteger16)value {
  return
    [[_FoundationCoreFoundationNumber alloc] initWithUnsignedInteger16:value];
}

+ (instancetype)makeNumberWithUnsignedInteger32:(CUnsignedInteger32)value {
  return
    [[_FoundationCoreFoundationNumber alloc] initWithUnsignedInteger32:value];
}

+ (instancetype)makeNumberWithUnsignedInteger64:(CUnsignedInteger64)value {
  return
    [[_FoundationCoreFoundationNumber alloc] initWithUnsignedInteger64:value];
}

+ (instancetype)makeNumberWithUnsignedInteger:(CUnsignedInteger)value {
  return
    [[_FoundationCoreFoundationNumber alloc] initWithUnsignedInteger:value];
}

+ (instancetype)makeNumberWithFloatingPoint32:(CFloatingPoint32)value {
  return
    [[_FoundationCoreFoundationNumber alloc] initWithFloatingPoint32:value];
}

+ (instancetype)makeNumberWithFloatingPoint64:(CFloatingPoint64)value {
  return
    [[_FoundationCoreFoundationNumber alloc] initWithFloatingPoint64:value];
}

+ (instancetype)makeNumberWithFloatingPoint:(CFloatingPoint)value {
  return
    [[_FoundationCoreFoundationNumber alloc] initWithFloatingPoint:value];
}

- (CInteger8)integer8Value {
  CDebuggingHaltWithMessage(
    "*** ABSTRACT METHOD integer8Value IS BEING CALLED. ***"
  );
}

- (CInteger16)integer16Value {
  CDebuggingHaltWithMessage(
    "*** ABSTRACT METHOD integer16Value IS BEING CALLED. ***"
  );
}

- (CInteger32)integer32Value {
  CDebuggingHaltWithMessage(
    "*** ABSTRACT METHOD integer32Value IS BEING CALLED. ***"
  );
}

- (CInteger64)integer64Value {
  CDebuggingHaltWithMessage(
    "*** ABSTRACT METHOD integer64Value IS BEING CALLED. ***"
  );
}

- (CInteger)integerValue {
  CDebuggingHaltWithMessage(
    "*** ABSTRACT METHOD integerValue IS BEING CALLED. ***"
  );
}

- (CUnsignedInteger8)unsignedInteger8Value {
  CDebuggingHaltWithMessage(
    "*** ABSTRACT METHOD unsignedInteger8Value IS BEING CALLED. ***"
  );
}

- (CUnsignedInteger16)unsignedInteger16Value {
  CDebuggingHaltWithMessage(
    "*** ABSTRACT METHOD unsignedInteger16Value IS BEING CALLED. ***"
  );
}

- (CUnsignedInteger32)unsignedInteger32Value {
  CDebuggingHaltWithMessage(
    "*** ABSTRACT METHOD unsignedInteger32Value IS BEING CALLED. ***"
  );
}

- (CUnsignedInteger64)unsignedInteger64Value {
  CDebuggingHaltWithMessage(
    "*** ABSTRACT METHOD unsignedInteger64Value IS BEING CALLED. ***"
  );
}

- (CUnsignedInteger)unsignedIntegerValue {
  CDebuggingHaltWithMessage(
    "*** ABSTRACT METHOD unsignedIntegerValue IS BEING CALLED. ***"
  );
}

- (CFloatingPoint32)floatingPoint32Value {
  CDebuggingHaltWithMessage(
    "*** ABSTRACT METHOD floatingPoint32Value IS BEING CALLED. ***"
  );
}

- (CFloatingPoint64)floatingPoint64Value {
  CDebuggingHaltWithMessage(
    "*** ABSTRACT METHOD floatingPoint64Value IS BEING CALLED. ***"
  );
}

- (CFloatingPoint)floatingPointValue {
  CDebuggingHaltWithMessage(
    "*** ABSTRACT METHOD floatingPointValue IS BEING CALLED. ***"
  );
}

@end

C_ASSUME_NONNULL_END
