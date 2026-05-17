/*
 *  FoundationNumber.h
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

C_ASSUME_NONNULL_BEGIN

@interface FoundationNumber: ObjectiveCObject

/**
 * The number object's value expressed as a ``CInteger64``, converted as
 * necessary.
 */
@property (nonatomic, readonly) CInteger64 integer64Value;

/**
 * The number object's value expressed as a ``CUnsignedInteger64``, converted as
 * necessary.
 */
@property (nonatomic, readonly) CUnsignedInteger64 unsignedInteger64Value;

/**
 * The number object's value expressed as a ``CFloatingPoint64``, converted as
 * necessary.
 */
@property (nonatomic, readonly) CFloatingPoint64 floatingPoint64Value;

/**
 * Creates and returns an ``FoundationNumber`` object containing a given value,
 * treating it as a ``CInteger64``.
 *
 * - Parameter value: The value for the new number.
 *
 * - Returns: An ``FoundationNumber`` object containing value, treating it as a
 *   ``CInteger64``.
 */
+ (instancetype)makeNumberWithInteger64:(CInteger64)value;

/**
 * Creates and returns an ``FoundationNumber`` object containing a given value,
 * treating it as a ``CUnsignedInteger64``.
 *
 * - Parameter value: The value for the new number.
 *
 * - Returns: An ``FoundationNumber`` object containing value, treating it as a
 *   ``CUnsignedInteger64``.
 */
+ (instancetype)makeNumberWithUnsignedInteger64:(CUnsignedInteger64)value;

/**
 * Creates and returns an ``FoundationNumber`` object containing a given value,
 * treating it as a ``CFloatingPoint64``.
 *
 * - Parameter value: The value for the new number.
 *
 * - Returns: An ``FoundationNumber`` object containing value, treating it as a
 *   ``CFloatingPoint64``.
 */
+ (instancetype)makeNumberWithFloatingPoint64:(CFloatingPoint64)value;

@end

C_ASSUME_NONNULL_END
