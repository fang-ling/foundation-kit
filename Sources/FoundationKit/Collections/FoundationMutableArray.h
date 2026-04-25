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
 *
 * ### Removing Objects
 *
 * - ``removeLastObject``
 */
//@interface FoundationMutableArray<Element>: FoundationArray<Element>

/**
 * Inserts a given object at the end of the array.
 *
 * - Parameter object: The object to add to the end of the array's content. This
 *   value must not be `nil`.
 */
//- (void)appendObject:(Element)object;

/**
 * Removes the object with the highest-valued index in the array.
 */
//- (void)removeLastObject;

//@end

C_ASSUME_NONNULL_END
