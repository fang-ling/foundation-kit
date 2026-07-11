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

#import "FoundationEnumerable.h"

#import <CKit/CKit.h>
#import <ObjectiveCKit/ObjectiveCKit.h>

C_ASSUME_NONNULL_BEGIN

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
 * - ``makeArray``
 * - ``arrayWithObjects:count:``
 *
 * ### Inspecting an Array
 *
 * - ``count``
 * - ``capacity``
 *
 * ### Accessing Elements
 *
 * - ``objectAtIndexedSubscript:``
 */
@interface FoundationArray<Element>: ObjectiveCObject <
  FoundationEnumerable
>

/**
 * The number of elements in the array.
 */
@property (nonatomic, readonly) CInteger count;

+ (instancetype)makeArray;

/**
 * Creates and returns an array that includes a given number of objects from a
 * given C array.
 *
 * Elements are added to the new array in the same order they appear in objects,
 * up to but not including index `count`.
 *
 * > Note: The compiler calls this method when using the container literal
 *   syntax. Do not use this method directly.
 *
 * - Parameters:
 *   - objects: A C array of objects.
 *   - count: The number of values from the objects C array to include in the
 *     new array. This number will be the count of the new array—it must not be
 *     negative or greater than the number of elements in objects.
 *
 * - Returns: A new array including the first `count` objects from `objects`.
 */
+ (instancetype)arrayWithObjects:(Element nillable const[nonnil])objects
                           count:(CInteger)count;

/**
 * Returns the object at the specified index.
 *
 * If `index` is beyond the end of the array (that is, if `index` is greater
 * than or equal to the value returned by ``count``), the behavior is undefined.
 *
 * You shouldn't need to call this method directly. Instead, this method is
 * called when accessing an object by index using subscripting.
 *
 *   ```objective-c
 *   let value = array[3];
 *   ```
 *
 * - Parameter index: An index within the bounds of the array.
 *
 * - Returns: The object located at index.
 */
- (Element)objectAtIndexedSubscript:(CInteger)index;

@end

@compatibility_alias NSArray FoundationArray;

C_ASSUME_NONNULL_END
