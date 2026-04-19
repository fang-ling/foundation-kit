////
////  FloatingPoint64.h
////  foundation-framework
////
////  Created by Fang Ling on 2025/12/27.
////
////  Licensed under the Apache License, Version 2.0 (the "License");
////  you may not use this file except in compliance with the License.
////  You may obtain a copy of the License at
////
////    http://www.apache.org/licenses/LICENSE-2.0
////
////  Unless required by applicable law or agreed to in writing, software
////  distributed under the License is distributed on an "AS IS" BASIS,
////  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
////  See the License for the specific language governing permissions and
////  limitations under the License.
////
//
//#ifndef FloatingPoint64_h
//#define FloatingPoint64_h
//
//#include "BinaryLogic.h"
//
///**
// * A double-precision, floating-point value type.
// */
//typedef double Foundation_FloatingPoint64 SWIFT_NAME(FloatingPoint64);
//
///* MARK: - Numeric Constants */
/////**
//// * The mathematical constant pi (π), approximately equal to 3.14159.
//// */
////extern const Foundation_FloatingPoint64 Foundation_FloatingPoint64_Pi;
//
///* MARK: - Common Floating-Point Operations */
///**
// * Returns the square root of the value, rounded to a representable value.
// *
// * The following example calculates the length of the hypotenuse of a right
// * triangle given its two perpendicular sides.
// *
// *     Foundation_FloatingPoint64 distance =
// *       Foundation_FloatingPoint64_TakeSquareRoot(3.0 * 3.0 + 4.0 * 4.0);
// *     // distance == 5.0
// *
// * - Parameter value: A floating-point number.
// *
// * - Returns: The square root of the value.
// */
//Foundation_FloatingPoint64
//Foundation_FloatingPoint64_TakeSquareRoot(Foundation_FloatingPoint64 value);
//
///////**
////// * Returns the greater of two floating-point values.
////// *
////// * - Parameters:
////// *   - x: A value to compare.
////// *   - y: Another value to compare.
////// *
////// * - Returns: The greater of x and y. If x is equal to y, returns y.
////// */
//////Foundation_FloatingPoint64
//////Foundation_FloatingPoint64_FindMaximum(Foundation_FloatingPoint64 x,
//////                                       Foundation_FloatingPoint64 y);
//
///**
// * Returns a BinaryLogic value that indicates whether two values are equal
// * within a specified tolerance.
// *
// * - Parameters:
// *   - value: The left-hand side value.
// *   - other: The right-hand side value.
// *   - tolerance: A double-precision value that specifies the tolerance.
// *
// * - Returns: A BinaryLogic value that indicates whether two values are equal
// *   within a specified tolerance.
// */
//Foundation_BinaryLogic
//Foundation_FloatingPoint64_CheckEquality(Foundation_FloatingPoint64 value,
//                                         Foundation_FloatingPoint64 other,
//                                         Foundation_FloatingPoint64 tolerance);
//
///**
// * Returns the absolute value of the given number.
// *
// * - Parameter value: A floating-point number.
// *
// * - Returns: The absolute value of the given number.
// */
//Foundation_FloatingPoint64
//Foundation_FloatingPoint64_MakeAbsolute(Foundation_FloatingPoint64 value);
//
///////**
////// * Returns the smallest integer that is greater than or equal to the given
////// * number.
////// *
////// * - Parameter value: A floating-point number.
////// *
////// * - Returns: The smallest integer that is greater than or equal to the given
////// *   number.
////// */
//////Foundation_FloatingPoint64
//////Foundation_FloatingPoint64_TakeCeiling(Foundation_FloatingPoint64 value);
//
///* MARK: - Elementary Functions */
///**
// * Returns the cosine of the value.
// *
// * The value will be interpreted as an angle measured in radians.
// *
// * - Parameter value: A floating-point number.
// *
// * - Returns: The cosine of the value.
// */
//Foundation_FloatingPoint64
//Foundation_FloatingPoint64_CalculateCosine(Foundation_FloatingPoint64 value);
//
///**
// * Returns the sine of the value.
// *
// * The value will be interpreted as an angle measured in radians.
// *
// * - Parameter value: A floating-point number.
// *
// * - Returns: The sine of the value.
// */
//Foundation_FloatingPoint64
//Foundation_FloatingPoint64_CalculateSine(Foundation_FloatingPoint64 value);
//
//#endif /* FloatingPoint64_h */
