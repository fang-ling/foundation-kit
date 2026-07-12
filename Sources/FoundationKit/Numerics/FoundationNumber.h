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

#import "../Sorting/FoundationComparable.h"
#import "../Values/FoundationValue.h"

#import <CKit/CKit.h>
#import <ObjectiveCKit/ObjectiveCKit.h>

C_ASSUME_NONNULL_BEGIN

@interface FoundationNumber: FoundationValue <
  ObjectiveCCopyable,
  FoundationComparable
>

/**
 * The number object's value expressed as a ``CInteger8``, converted as
 * necessary.
 */
@property (nonatomic, readonly) CInteger8 integer8Value;

/**
 * The number object's value expressed as a ``CInteger16``, converted as
 * necessary.
 */
@property (nonatomic, readonly) CInteger16 integer16Value;

/**
 * The number object's value expressed as a ``CInteger32``, converted as
 * necessary.
 */
@property (nonatomic, readonly) CInteger32 integer32Value;

/**
 * The number object's value expressed as a ``CInteger64``, converted as
 * necessary.
 */
@property (nonatomic, readonly) CInteger64 integer64Value;

/**
 * The number object's value expressed as a ``CInteger``, converted as
 * necessary.
 */
@property (nonatomic, readonly) CInteger integerValue;

/**
 * The number object's value expressed as a ``CUnsignedInteger8``, converted as
 * necessary.
 */
@property (nonatomic, readonly) CUnsignedInteger8 unsignedInteger8Value;

/**
 * The number object's value expressed as a ``CUnsignedInteger16``, converted as
 * necessary.
 */
@property (nonatomic, readonly) CUnsignedInteger16 unsignedInteger16Value;

/**
 * The number object's value expressed as a ``CUnsignedInteger32``, converted as
 * necessary.
 */
@property (nonatomic, readonly) CUnsignedInteger32 unsignedInteger32Value;

/**
 * The number object's value expressed as a ``CUnsignedInteger64``, converted as
 * necessary.
 */
@property (nonatomic, readonly) CUnsignedInteger64 unsignedInteger64Value;

/**
 * The number object's value expressed as a ``CUnsignedInteger``, converted as
 * necessary.
 */
@property (nonatomic, readonly) CUnsignedInteger unsignedIntegerValue;

/**
 * The number object's value expressed as a ``CFloatingPoint32``, converted as
 * necessary.
 */
@property (nonatomic, readonly) CFloatingPoint32 floatingPoint32Value;

/**
 * The number object's value expressed as a ``CFloatingPoint64``, converted as
 * necessary.
 */
@property (nonatomic, readonly) CFloatingPoint64 floatingPoint64Value;

/**
 * The number object's value expressed as a ``CFloatingPoint``, converted as
 * necessary.
 */
@property (nonatomic, readonly) CFloatingPoint floatingPointValue;

/**
 * Creates and returns a ``FoundationNumber`` object containing a given value,
 * treating it as a ``CInteger8``.
 *
 * - Parameter value: The value for the new number.
 *
 * - Returns: A ``FoundationNumber`` object containing value, treating it as a
 *   ``CInteger8``.
 */
+ (instancetype)makeNumberWithInteger8:(CInteger8)value;

/**
 * Creates and returns a ``FoundationNumber`` object containing a given value,
 * treating it as a ``CInteger16``.
 *
 * - Parameter value: The value for the new number.
 *
 * - Returns: A ``FoundationNumber`` object containing value, treating it as a
 *   ``CInteger16``.
 */
+ (instancetype)makeNumberWithInteger16:(CInteger16)value;

/**
 * Creates and returns a ``FoundationNumber`` object containing a given value,
 * treating it as a ``CInteger32``.
 *
 * - Parameter value: The value for the new number.
 *
 * - Returns: A ``FoundationNumber`` object containing value, treating it as a
 *   ``CInteger32``.
 */
+ (instancetype)makeNumberWithInteger32:(CInteger32)value;

/**
 * Creates and returns a ``FoundationNumber`` object containing a given value,
 * treating it as a ``CUnsignedInteger8``.
 *
 * - Parameter value: The value for the new number.
 *
 * - Returns: A ``FoundationNumber`` object containing value, treating it as a
 *   ``CUnsignedInteger8``.
 */
+ (instancetype)makeNumberWithUnsignedInteger8:(CUnsignedInteger8)value;

/**
 * Creates and returns a ``FoundationNumber`` object containing a given value,
 * treating it as a ``CUnsignedInteger16``.
 *
 * - Parameter value: The value for the new number.
 *
 * - Returns: A ``FoundationNumber`` object containing value, treating it as a
 *   ``CUnsignedInteger16``.
 */
+ (instancetype)makeNumberWithUnsignedInteger16:(CUnsignedInteger16)value;

/**
 * Creates and returns a ``FoundationNumber`` object containing a given value,
 * treating it as a ``CUnsignedInteger32``.
 *
 * - Parameter value: The value for the new number.
 *
 * - Returns: A ``FoundationNumber`` object containing value, treating it as a
 *   ``CUnsignedInteger32``.
 */
+ (instancetype)makeNumberWithUnsignedInteger32:(CUnsignedInteger32)value;

/**
 * Creates and returns a ``FoundationNumber`` object containing a given value,
 * treating it as a ``CUnsignedInteger``.
 *
 * - Parameter value: The value for the new number.
 *
 * - Returns: A ``FoundationNumber`` object containing value, treating it as a
 *   ``CUnsignedInteger``.
 */
+ (instancetype)makeNumberWithUnsignedInteger:(CUnsignedInteger)value;

/**
 * Creates and returns a ``FoundationNumber`` object containing a given value,
 * treating it as a ``CFloatingPoint32``.
 *
 * - Parameter value: The value for the new number.
 *
 * - Returns: A ``FoundationNumber`` object containing value, treating it as a
 *   ``CFloatingPoint32``.
 */
+ (instancetype)makeNumberWithFloatingPoint32:(CFloatingPoint32)value;

/**
 * Creates and returns a ``FoundationNumber`` object containing a given value,
 * treating it as a ``CFloatingPoint``.
 *
 * - Parameter value: The value for the new number.
 *
 * - Returns: A ``FoundationNumber`` object containing value, treating it as a
 *   ``CFloatingPoint``.
 */
+ (instancetype)makeNumberWithFloatingPoint:(CFloatingPoint)value;

/**
 * Creates and returns a ``FoundationNumber`` object containing a given value,
 * treating it as a `signed long`.
 *
 * > Note: The compiler calls this method when using the numeric literal
 *   syntax. Do not use this method directly.
 *
 * - Parameter value: The value for the new number.
 *
 * - Returns: A ``FoundationNumber`` object containing value, treating it as a
 *   `signed long`.
 */
+ (instancetype)numberWithLong:(CInteger)value;

/**
 * Creates and returns a ``FoundationNumber`` object containing a given value,
 * treating it as a `signed long long`.
 *
 * > Note: The compiler calls this method when using the numeric literal
 *   syntax. Do not use this method directly.
 *
 * - Parameter value: The value for the new number.
 *
 * - Returns: A ``FoundationNumber`` object containing value, treating it as a
 *   `signed long long`.
 */
+ (instancetype)numberWithLongLong:(CInteger64)value;

/**
 * Creates and returns a ``FoundationNumber`` object containing a given value,
 * treating it as an `unsigned long long`.
 *
 * > Note: The compiler calls this method when using the numeric literal
 *   syntax. Do not use this method directly.
 *
 * - Parameter value: The value for the new number.
 *
 * - Returns: A ``FoundationNumber`` object containing value, treating it as an
 *   `unsigned long long`.
 */
+ (instancetype)numberWithUnsignedLongLong:(CUnsignedInteger64)value;

/**
 * Creates and returns a ``FoundationNumber`` object containing a given value,
 * treating it as a `double`.
 *
 * > Note: The compiler calls this method when using the numeric literal
 *   syntax. Do not use this method directly.
 *
 * - Parameter value: The value for the new number.
 *
 * - Returns: A ``FoundationNumber`` object containing value, treating it as a
 *   `double`.
 */
+ (instancetype)numberWithDouble:(CFloatingPoint64)value;

@end

@compatibility_alias NSNumber FoundationNumber;

C_ASSUME_NONNULL_END
