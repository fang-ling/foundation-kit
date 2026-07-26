/*
 *  FoundationSet.h
 *  foundation-kit
 *
 *  Created by Fang Ling on 2026/7/25.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and limitations under the License.
 */

#import "../FoundationArray.h"

#import <CKit/CKit.h>
#import <ObjectiveCKit/ObjectiveCKit.h>

C_ASSUME_NONNULL_BEGIN

/**
 * A static, unordered collection of unique objects.
 *
 * The ``FoundationSet``, ``FoundationMutableSet``, and ``FoundationCountedSet`` classes declare the programmatic interface to an unordered collection of objects.
 * ``FoundationSet`` declares the programmatic interface for static sets of distinct objects.
 * You establish a static set's entries when it's created, and can't modify the entries after that.
 * ``FoundationMutableSet``, on the other hand, declares a programmatic interface for dynamic sets of distinct objects.
 * A dynamic — or mutable — set allows the addition and deletion of entries at any time, automatically allocating memory as needed.
 *
 * Use sets as an alternative to arrays when the order of elements isn't important and you need to consider performance in testing whether the set contains an object.
 * With an array, testing for membership is slower than with sets.
 *
 * ### Subclassing Notes
 *
 * There should be little need of subclassing.
 * If you need to customize behavior, it's often better to consider composition instead of subclassing.
 *
 * #### Methods to Override
 *
 * In a subclass, you must override all of its primitive methods:
 *   - ``count``
 *
 * #### Alternatives to Subclassing
 *
 * Before making a custom class of ``FoundationSet``, investigate ``FoundationHashTable``.
 *
 * If the behavior you want to add supplements that of the existing class, you could write a category on ``FoundationSet``.
 * Keep in mind, however, that this category affects all instances of ``FoundationSet`` that you use, and this might have unintended consequences.
 * Alternatively, you could use composition to achieve the desired behavior.
 *
 * ## Topics
 *
 * ### Creating a Set
 *
 * - ``makeSet``
 * - ``setWithArray:``
 *
 * ### Accessing Set Members
 *
 * - ``containsObject:``
 */
@interface FoundationSet<Element>: ObjectiveCObject

/**
 * Creates and returns an empty set.
 *
 * This method is declared primarily for the use of mutable subclasses of ``FoundationSet``.
 *
 * - Returns: A new empty set.
 */
+ (instancetype)makeSet;

/**
 * Returns a Boolean value that indicates whether a given object is present in the set.
 *
 * Each element of the set is checked for equality with the `object` until a match is found or the end of the set is reached.
 * Objects are considered equal if ``isEqual:`` returns `yes`.
 *
 * - Parameter object: An object to look for in the set.
 *
 * - Returns: `yes` if the `object` is present in the set, otherwise `no`.
 */
- (CBoolean)containsObject:(Element<ObjectiveCEquatable>)object;

@end

C_ASSUME_NONNULL_END
