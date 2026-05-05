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
@interface FoundationArray<Element>: ObjectiveCObject

/**
 * The number of elements in the array.
 */
@property (nonatomic, readonly) CUnsignedInteger64 count;

+ (instancetype)makeArray;

- (CUnsignedInteger64)count;

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
- (Element)objectAtIndex:(CUnsignedInteger64)index;

@end

C_ASSUME_NONNULL_END
