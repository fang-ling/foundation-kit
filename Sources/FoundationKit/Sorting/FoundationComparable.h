/*
 *  FoundationComparable.h
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

#import "FoundationComparisonResult.h"

#import <CKit/CKit.h>
#import <ObjectiveCKit/ObjectiveCKit.h>

C_ASSUME_NONNULL_BEGIN

/**
 * A type that can be compared.
 *
 * The ``FoundationComparable`` protocol is used for types that have an inherent
 * order, such as numbers and strings. Many types in the standard library
 * already conform to the ``FoundationComparable`` protocol. Add
 * ``FoundationComparable`` conformance to your own custom types when you want
 * to be able to compare instances or use standard library methods that are
 * designed for ``FoundationComparable`` types.
 */
@protocol FoundationComparable

/**
 * Returns a ``FoundationComparisonResult`` value that indicates whether the
 * current object's value is greater than, equal to, or less than a given
 * object.
 *
 * - Parameter object: The given object to compare to the current object's
 *   value. This value must not be `nil`.
 *
 * - Returns: ``kFoundationComparisonResultAscendingOrder`` if the value of give
 *   object is greater than the current object's,
 *   ``kFoundationComparisonResultSameOrder`` if they're equal, and
 *   ``kFoundationComparisonResultDescendingOrder`` if the value of given object
 *   is less than the current object's.
 */
- (FoundationComparisonResult)compare:(ObjectiveCAnyObject)object;

@end

C_ASSUME_NONNULL_END
