/*
 *  FoundationEnumerable.h
 *  foundation-kit
 *
 *  Created by Fang Ling on 2026/7/4.
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

#define \
  _FoundationEnumerationBuffer \
  ObjectiveCAnyObject unsafeunretained nillable [nonnil]

/**
 * This defines the structure used as contextual information in the
 * ``FoundationEnumerable`` protocol.
 */
typedef struct FoundationEnumerationState {
  /**
   * Arbitrary state information used by the iterator. Typically this is set to
   * `0` at the beginning of the iteration.
   */
  CInteger state;

  /**
   * A C array of objects.
   */
  ObjectiveCAnyObject unsafeunretained nillable * nillable itemsBuffer;

  /**
   * Arbitrary state information used to detect whether the collection has been
   * mutated.
   */
  CInteger* nillable mutationsBuffer;

  /**
   * A C array that you can use to hold returned values.
   */
  CInteger extra[5];
} FoundationEnumerationState;

/**
 * A protocol that objects adopt to support fast enumeration.*
 *
 * ## Topics
 *
 * ### Enumeration
 *
 * - ``countByEnumeratingWithState:objects:count:``
 *
 * ### Constants
 *
 * - ``FoundationEnumerationState``
 */
@protocol FoundationEnumerable

/**
 * Returns by reference a C array of objects over which the sender should
 * iterate, and as the return value the number of objects in the array.
 *
 * The state structure is assumed to be of stack local memory, so you can recast
 * the passed in state structure to one more suitable for your iteration.
 *
 * - Parameters:
 *   - state: Context information that is used in the enumeration to, in
 *     addition to other possibilities, ensure that the collection has not been
 *     mutated.
 *   - buffer: A C array of objects over which the sender is to iterate.
 *   - count: The maximum number of objects to return in stack buffer.
 *
 * - Returns: The number of objects returned in stack buffer. Returns `0` when
 *   the iteration is finished.
 */
- (CInteger)countByEnumeratingWithState:(FoundationEnumerationState*)state
                                objects:(_FoundationEnumerationBuffer)buffer
                                  count:(CInteger)count;

@end

C_ASSUME_NONNULL_END
