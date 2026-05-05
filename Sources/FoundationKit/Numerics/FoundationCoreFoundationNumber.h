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

@interface FoundationCoreFoundationNumber: FoundationNumber

@property (nonatomic, readonly) CUnsignedInteger64 unsignedIntegerValue;

- (instancetype)initWithUnsignedInteger:(CUnsignedInteger64)value;

- (CUnsignedInteger64)unsignedIntegerValue;

@end

C_ASSUME_NONNULL_END
