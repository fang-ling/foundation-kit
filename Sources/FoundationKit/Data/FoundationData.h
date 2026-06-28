/*
 *  FoundationData.h
 *  foundation-kit
 *
 *  Created by Fang Ling on 2026/6/28.
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
 * A static byte buffer in memory.
 *
 * ``FoundationData`` and its mutable subclass ``FoundationMutableData`` provide
 * data objects, or object-oriented wrappers for byte buffers. Data objects let
 * simple allocated buffers (that is, data with no embedded pointers) take on
 * the behavior of FoundationKit objects.
 *
 * The size of the data is subject to a theoretical limit of about 8 exabytes
 * (1 EB = 10¹⁸ bytes; in practice, the limit should not be a factor).
 *
 * ## Topics
 *
 * ### Creating Data
 *
 * - ``makeDataWithBytes:length:``
 *
 * ### Accessing Underlying Bytes
 *
 * - ``bytes``
 *
 * ### Testing Data
 *
 * - ``count``
 */
@interface FoundationData: ObjectiveCObject

/**
 * A pointer to the data object's contents.
 *
 * If the ``count`` of the ``FoundationData`` object is `0`, this property
 * returns `null`.
 *
 * For an immutable data object, the returned pointer is valid until the data
 * object is deallocated. For a mutable data object, the returned pointer is
 * valid until the data object is deallocated or the data is mutated.
 */
@property (nonatomic, readonly) const void* bytes;

/**
 * The number of bytes contained by the data object.
 */
@property (nonatomic, readonly) CInteger count;

/**
 * Creates a data object containing a given number of bytes copied from a given
 * buffer.
 *
 * - Parameters:
 *   - bytes: A buffer containing data for the new object.
 *   - count: The number of bytes to copy from bytes. This value must not exceed
 *     the length of bytes.
 */
+ (instancetype)makeDataWithBytes:(const void*)bytes
                            count:(CInteger)count;

@end

C_ASSUME_NONNULL_END
