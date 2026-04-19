/*
 *  FoundationArray.h
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

#import <ObjectiveCKit/ObjectiveCKit.h>

OBJECTIVE_C_ASSUME_NONNULL_BEGIN

/**
 * A static ordered collection of objects.
 *
 * ``FoundationArray`` and its subclass ``FoundationMutableArray`` manage
 * ordered collections of objects called arrays. ``FoundationArray`` creates
 * static arrays, and ``FoundationMutableArray`` creates dynamic arrays. You can
 * use arrays when you need an ordered collection of objects.
 *
 * ## Topics
 *
 * ### Creating an Array
 *
 * - ``init``
 * - ``initWithObjects:``
 *
 * ### Inspecting an Array
 *
 * - ``count``
 * - ``capacity``
 *
 * ### Accessing Elements
 *
 * - ``objectAtIndex:``
 */
@interface FoundationArray<Element>: ObjectiveCObject {
  @protected owning id* _objects;
}

/**
 * The number of elements in the array.
 */
@property (nonatomic, assign, readonly) ObjectiveCUnsignedInteger64 count;

/**
 * The total number of elements that the array can contain without allocating
 * new storage.
 */
@property (nonatomic, assign, readonly) ObjectiveCUnsignedInteger64 capacity;

/**
 * Initializes a newly allocated array.
 *
 * After an immutable array has been initialized in this way, it cannot be
 * modified.
 *
 * This method is a designated initializer.
 *
 * - Returns: An array.
 */
- (instancetype)init
  OBJECTIVE_C_DESIGNATED_INITIALIZER;

/**
 * Initializes a newly allocated array by placing in it the objects in the
 * argument list.
 *
 * Pass comma-separated list of trailing variadic arguments as additional
 * objects, ending with `nil`.
 *
 * After an immutable array has been initialized in this way, it can't be
 * modified.
 *
 * This method is a designated initializer.
 *
 * - Parameter firstObject: The first object for the array.
 *
 * - Returns: An array initialized to include the objects in the argument list.
 *   The returned object might be different than the original receiver.
 */
- (instancetype)initWithObjects:(Element)firstObject, ...
  OBJECTIVE_C_REQUIRES_NIL_TERMINATION
  OBJECTIVE_C_DESIGNATED_INITIALIZER;

/**
 * Returns the object located at the specified index.
 *
 * If `index` is beyond the end of the array (that is, if `index` is greater
 * than or equal to the value returned by ``count``), the behavior is undefined.
 *
 * - Parameter index: An index within the bounds of the array.
 *
 * - Returns: The object located at index.
 */
- (Element)objectAtIndex:(ObjectiveCUnsignedInteger64)index;

@end

OBJECTIVE_C_ASSUME_NONNULL_END
