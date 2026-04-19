////
////  Integer64.h
////  foundation-framework
////
////  Created by Fang Ling on 2025/12/7.
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
//#ifndef Integer64_h
//#define Integer64_h
//
//#include <stdint.h>
//
//#include "../Miscellanies/Base.h"
//
///* MARK: - Finding the Sign and Magnitude */
///**
// * Returns the absolute value of the given number.
// *
// * The absolute value of x must be representable in the same type. In
// * particular, the absolute value of a signed, fixed-width integer type's
// * minimum cannot be represented.
// *
// * ```c
// * var x = Foundation_Integer64_MakeAbsolute(-(1LL << 63));
// * // Results in undefined behavior
// * ```
// *
// * - Parameter x: A signed number.
// *
// * - Returns: The absolute value of x.
// */
//Foundation_Integer64 Foundation_Integer64_MakeAbsolute(Foundation_Integer64 x);
//
///* MARK: - Choosing the Smallest and Largest Value */
///**
// * Returns the lesser of two comparable values.
// *
// * - Parameters:
// *   - x: A value to compare.
// *   - y: Another value to compare.
// *
// * - Returns: The lesser of x and y. If x is equal to y, returns x.
// */
//Foundation_Integer64 Foundation_Integer64_FindMinimum(Foundation_Integer64 x,
//                                                      Foundation_Integer64 y);
//
///**
// * Returns the greater of two comparable values.
// *
// * - Parameters:
// *   - x: A value to compare.
// *   - y: Another value to compare.
// *
// * - Returns: The greater of x and y. If x is equal to y, returns y.
// */
//Foundation_Integer64 Foundation_Integer64_FindMaximum(Foundation_Integer64 x,
//                                                      Foundation_Integer64 y);
//
//#endif /* Integer64_h */
