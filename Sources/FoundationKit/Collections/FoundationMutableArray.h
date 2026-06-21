/*
 *  FoundationMutableArray.h
 *  foundation-kit
 *
 *  Created by Fang Ling on 2026/4/19.
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

#import "FoundationArray.h"

C_ASSUME_NONNULL_BEGIN

/**
 * A dynamic ordered collection of objects.
 *
 * The ``FoundationMutableArray`` class declares the programmatic interface to
 * objects that manage a modifiable array of objects. This class adds insertion
 * and deletion operations to the basic array-handling behavior inherited from
 * ``FoundationArray``.
 *
 * ## Topics
 *
 * ### Adding Objects
 *
 * - ``appendObject:``
 * - ``insertObject:atIndex:``
 *
 * ### Removing Objects
 *
 * - ``removeLastObject``
 * - ``removeObjectAtIndex:``
 * - ``removeAllObjectsWhere:``
 */
@interface FoundationMutableArray<Element>: FoundationArray<Element>

/**
 * Inserts a given object at the end of the array.
 *
 * - Parameter object: The object to add to the end of the array's content. This
 *   value must not be `nil`.
 */
- (void)appendObject:(Element)object;

/**
 * Inserts a given object into the array's contents at a given index.
 *
 * If `index` is already occupied, the objects at index and beyond are shifted
 * by adding `1` to their indices to make room.
 *
 * Note that ``FoundationArray`` objects are not like C arrays. That is, even
 * though you specify a size when you create an array, the specified size is
 * regarded as a "hint"; the actual size of the array is still `0`. This means
 * that you cannot insert an object at an index greater than the current count
 * of an array. For example, if an array contains two objects, its size is `2`,
 * so you can add objects at indices `0`, `1`, or `2`. Index `3` is illegal and
 * out of bounds; if you try to add an object at index `3` (when the size of the
 * array is `2`), the program is likely to crash.
 *
 * - Parameters:
 *   - object: The object to add to the array's content. This value must not be
 *     `nil`.
 *   - index: The index in the array at which to insert `object`. This value
 *     must not be greater than the count of elements in the array.
 */
- (void)insertObject:(Element)object atIndex:(CInteger)index;

/**
 * Removes the object with the highest-valued index in the array.
 */
- (void)removeLastObject;

/**
 * Removes the object at `index`.
 *
 * To fill the gap, all elements beyond `index` are moved by subtracting `1`
 * from their index.
 *
 * - Parameter index: The index from which to remove the object in the array.
 *   The value must not exceed the bounds of the array.
 */
- (void)removeObjectAtIndex:(CInteger)index;

/**
 * Removes all the elements that satisfy the given predicate.
 *
 * Use this method to remove every element in a collection that meets particular
 * criteria. The order of the remaining elements is preserved.
 *
 * - Parameter shouldBeRemoved: A closure that takes an element of the sequence
 *   as its argument and returns a Boolean value indicating whether the element
 *   should be removed from the collection.
 */
- (void)removeAllObjectsWhere:(CBoolean (^)(ObjectiveCAnyObject object))
                                shouldBeRemoved;

@end

C_ASSUME_NONNULL_END
