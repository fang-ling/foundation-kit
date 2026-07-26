/*
 *  FoundationMutableSet.h
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

#import "../../Sorting/FoundationComparable.h"
#import "FoundationSet.h"

#import <CKit/CKit.h>
#import <ObjectiveCKit/ObjectiveCKit.h>

C_ASSUME_NONNULL_BEGIN

/**
 * A dynamic unordered collection of unique objects.
 *
 * The ``FoundationMutableSet`` class declares the programmatic interface to a mutable, unordered collection of distinct objects.
 *
 * The ``FoundationCountedSet`` class, which is a concrete subclass of ``FoundationMutableSet``, supports mutable sets that can contain multiple instances of the same element.
 * The ``FoundationSet`` class supports creating and managing immutable sets.
 *
 * ### Subclassing Notes
 *
 * There should be little need of subclassing.
 * If you need to customize behavior, it is often better to consider composition instead of subclassing.
 *
 * #### Methods to Override
 *
 * In a subclass, you must override both of its primitive methods:
 *
 *   - ``insertObject:``
 *   - ``removeObject:``
 *
 * You must also override the primitive methods of the ``FoundationSet`` class.
 *
 * ## Topics
 *
 * ### Adding and removing entries
 *
 * - ``insertObject:``
 */
@interface FoundationMutableSet<Element>: FoundationSet <Element>

/**
 * Adds a given object to the set, if it is not already a member.
 *
 * - Parameter object: The object to add to the set.
 */
- (void)insertObject:(Element<ObjectiveCCopyable, FoundationComparable>)object;

@end

C_ASSUME_NONNULL_END
