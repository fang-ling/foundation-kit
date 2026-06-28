/*
 *  FoundationComparisonResult.h
 *  foundation-kit
 *
 *  Created by Fang Ling on 2026/6/27.
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

#import <CoreFoundationKit/CoreFoundationKit.h>

/**
 * Constants that indicate sort order.
 *
 * These constants are used to indicate how items in a request are ordered, from
 * the first one given in a method invocation or function call to the last
 * (that is, left to right in code).
 */
typedef CoreFoundationComparisonResult FoundationComparisonResult;

/**
 * The left operand is smaller than the right operand.
 */
#define                                         \
  kFoundationComparisonResultAscendingOrder     \
  kCoreFoundationComparisonResultAscendingOrder

/**
 * The two operands are equal.
 */
#define \
  kFoundationComparisonResultSameOrder kCoreFoundationComparisonResultSameOrder

/**
 * The left operand is greater than the right operand.
 */
#define                                          \
  kFoundationComparisonResultDescendingOrder     \
  kCoreFoundationComparisonResultDescendingOrder
