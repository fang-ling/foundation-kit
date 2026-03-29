//
//  Data.h
//  foundation-framework
//
//  Created by Fang Ling on 2026/2/9.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#ifndef Data_h
#define Data_h

#include "../Miscellanies/ObjectBase.h"
#include "../Numerics/Integer8.h"
#include "../Numerics/Integer64.h"

ASSUME_NONNULL_BEGIN

struct _Foundation_Data {
  struct Foundation_ObjectBase _objectBase;

  Foundation_UnsignedInteger8* _bytes;
  Foundation_UnsignedInteger64 _count;
}
SWIFT_NAME(Data)
SWIFT_SHARED_REFERENCE(Foundation_Data_Retain, Foundation_Data_Release);

/**
 * A static byte buffer in memory.
 *
 * ``Foundation_Data`` and its derived mutable type, ``Foundation_MutableData``,
 * provide support for data objects, object-oriented wrappers for byte buffers.
 * These data objects let simple allocated buffers (that is, data with no
 * embedded pointers) take on the behavior of objects. ``Foundation_Data``
 * creates static data objects, and ``Foundation_MutableData`` creates dynamic
 * data objects. These data objects are typically used for raw data storage.
 *
 * You use the ``Foundation_Data_Initialize`` and ``Foundation_Data_Copy``
 * functions to create static data objects. These functions make a new copy of
 * the supplied data. To create a data object that uses the supplied buffer
 * instead of making a separate copy, use the
 * ``Foundation_Data_InitializeWithoutCopy`` function. You use the
 * ``Foundation_Data_GetBytes`` function to retrieve the bytes and the
 * ``Foundation_Data_GetCount`` function to get the length of the bytes.
 *
 * ## Topics
 *
 * ### Creating and Destroying a Foundation_Data Object
 *
 * - ``Foundation_Data_Initialize``
 * - ``Foundation_Data_Retain``
 * - ``Foundation_Data_Release``
 *
 * ### Examining a Foundation_Data Object
 *
 * - ``Foundation_Data_GetCount``
 * - ``Foundation_Data_GetBytes``
 */
typedef const struct _Foundation_Data* Foundation_Data;

/* MARK: - Creating and Destroying a Foundation_Data Object */
/**
 * Creates an immutable data object using data copied from a specified byte
 * buffer.
 *
 * - Parameters:
 *   - bytes: A pointer to the byte buffer that contains the raw data to be
 *     copied into the data object.
 *   - count: The number of bytes in the buffer (bytes).
 *
 * - Returns: A new data object.
 */
Foundation_Data
Foundation_Data_Initialize(const Foundation_UnsignedInteger8* bytes,
                           Foundation_UnsignedInteger64 count)
SWIFT_NAME(Data.init(bytes:count:))
SWIFT_RETURNS_RETAINED;

/**
 * Retains a data object.
 *
 * - Parameter data: The data object to retain. This value must not be `NULL`.
 */
void Foundation_Data_Retain(Foundation_Data data);

/**
 * Releases a data object.
 *
 * If the retain count of `data` becomes zero the memory allocated to the object
 * is deallocated and the object is destroyed.
 *
 * - Parameter data: A data object to release. This value must not be `NULL`.
 */
void Foundation_Data_Release(Foundation_Data data);

/* MARK: - Examining a Foundation_Data Object */
/**
 * Returns the number of bytes contained by a data object.
 *
 * - Parameter data: The data object to examine.
 *
 * - Returns: An integer that specifies the number of bytes in the data.
 */
Foundation_UnsignedInteger64 Foundation_Data_GetCount(Foundation_Data data)
SWIFT_NAME(getter:Data.count(self:));

/**
 * Returns a read-only pointer to the bytes of a data object.
 *
 * - Parameter data: The data object to examine.
 *
 * - Returns: A read-only pointer to the bytes associated with the data.
 */
const Foundation_UnsignedInteger8*
Foundation_Data_GetBytes(Foundation_Data data)
SWIFT_NAME(getter:Data.bytes(self:));

ASSUME_NONNULL_END

#endif /* Data_h */
