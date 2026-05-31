/*
 *  FoundationCoreFoundationNumber.h
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

#import <CKit/CKit.h>
#import <ObjectiveCKit/ObjectiveCKit.h>

#import "FoundationNumber.h"

C_ASSUME_NONNULL_BEGIN

@interface _FoundationCoreFoundationNumber: FoundationNumber

@property (nonatomic, readonly) CInteger8 integer8Value;

@property (nonatomic, readonly) CInteger16 integer16Value;

@property (nonatomic, readonly) CInteger32 integer32Value;

@property (nonatomic, readonly) CInteger64 integer64Value;

@property (nonatomic, readonly) CInteger integerValue;

@property (nonatomic, readonly) CUnsignedInteger8 unsignedInteger8Value;

@property (nonatomic, readonly) CUnsignedInteger16 unsignedInteger16Value;

@property (nonatomic, readonly) CUnsignedInteger32 unsignedInteger32Value;

@property (nonatomic, readonly) CUnsignedInteger64 unsignedInteger64Value;

@property (nonatomic, readonly) CUnsignedInteger unsignedIntegerValue;

@property (nonatomic, readonly) CFloatingPoint32 floatingPoint32Value;

@property (nonatomic, readonly) CFloatingPoint64 floatingPoint64Value;

@property (nonatomic, readonly) CFloatingPoint floatingPointValue;

- (instancetype)initWithInteger8:(CInteger8)value;

- (instancetype)initWithInteger16:(CInteger16)value;

- (instancetype)initWithInteger32:(CInteger32)value;

- (instancetype)initWithInteger64:(CInteger64)value;

- (instancetype)initWithInteger:(CInteger)value;

- (instancetype)initWithUnsignedInteger8:(CUnsignedInteger8)value;

- (instancetype)initWithUnsignedInteger16:(CUnsignedInteger16)value;

- (instancetype)initWithUnsignedInteger32:(CUnsignedInteger32)value;

- (instancetype)initWithUnsignedInteger64:(CUnsignedInteger64)value;

- (instancetype)initWithUnsignedInteger:(CUnsignedInteger)value;

- (instancetype)initWithFloatingPoint32:(CFloatingPoint32)value;

- (instancetype)initWithFloatingPoint64:(CFloatingPoint64)value;

- (instancetype)initWithFloatingPoint:(CFloatingPoint)value;

@end

C_ASSUME_NONNULL_END
