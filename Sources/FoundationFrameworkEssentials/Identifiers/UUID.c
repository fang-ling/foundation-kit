//
//  UUID.c
//  foundation-framework
//
//  Created by Fang Ling on 2026/3/28.
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

#include "UUID.h"

#include <stdlib.h>
#include <stdio.h>

#include "../Numerics/Integer8.h"

#if defined(__wasm__)
#include <wasi/api.h>
#endif

/*
 * RFC 9562: Universally Unique Identifiers (UUIDs)
 *
 *  0                   1                   2                   3
 *  0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
 * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 * |                           random_a                            |
 * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 * |          random_a             |  ver  |       random_b        |
 * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 * |var|                       random_c                            |
 * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 * |                           random_c                            |
 * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 *
 * - random_a: The first 48 bits of the layout that can be filled with random
 *   data. Occupies bits 0 through 47 (octets 0-5).
 * - ver: The 4-bit version field, set to 0b0100 (4). Occupies bits 48 through
 *   51 of octet 6.
 * - random_b: 12 more bits of the layout that can be filled random data.
 *   Occupies bits 52 through 63 (octets 6-7).
 * - var: The 2-bit variant field, set to 0b10. Occupies bits 64 and 65 of octet
 *   8.
 * - random_c: The final 62 bits of the layout immediately following the var
 *   field to be filled with random data. Occupies bits 66 through 127 (octets
 *   8-15).
 */

ASSUME_NONNULL_BEGIN

Foundation_UUID Foundation_UUID_Initialize(void) {
  let uuid = (struct _Foundation_UUID*)malloc(sizeof(struct _Foundation_UUID));
  uuid->_objectBase.retainCount = 1;

#if defined(__wasm__)
  (void)__wasi_random_get(
    (void*)uuid->_uuid,
    sizeof(Foundation_UnsignedInteger64) * 2
  );
#else
  uuid->_uuid[0] = (Foundation_UnsignedInteger64)arc4random() << 32;
  uuid->_uuid[0] |= arc4random();
  uuid->_uuid[1] = (Foundation_UnsignedInteger64)arc4random() << 32;
  uuid->_uuid[1] |= arc4random();
#endif

  /* Set version = 0b0100 */
  uuid->_uuid[1] &= 0xFFFFFFFFFFFF0FFFull;
  uuid->_uuid[1] |= 0x0000000000004000ull;

  /* Set variant = RFC 4122 (0b10) */
  uuid->_uuid[0] &= 0x3FFFFFFFFFFFFFFFull;
  uuid->_uuid[0] |= 0x8000000000000000ull;

  return uuid;
}

void Foundation_UUID_Retain(Foundation_UUID uuid) {
  Foundation_ObjectBase_Retain(&uuid->_objectBase);
}

void Foundation_UUID_Release(Foundation_UUID uuid) {
  let shouldDeallocate = Foundation_ObjectBase_Release(&uuid->_objectBase);

  if (shouldDeallocate) {
    free((struct _Foundation_UUID*)uuid);
  }
}

Foundation_String Foundation_UUID_GetUUIDString(Foundation_UUID uuid) {
  Foundation_Integer8 buffer[37];
  snprintf(buffer,
           37,
           "%08X-%04X-%04X-%04X-%012llX",
           (Foundation_UnsignedInteger32)(uuid->_uuid[1] >> 32),
           (Foundation_UnsignedInteger32)((uuid->_uuid[1] >> 16) & 0xFFFF),
           (Foundation_UnsignedInteger32)(uuid->_uuid[1] & 0xFFFF),
           (Foundation_UnsignedInteger32)(uuid->_uuid[0] >> 48),
           (uuid->_uuid[0] & 0x0000FFFFFFFFFFFFull));

  return Foundation_String_InitializeWithCString(buffer);
}

ASSUME_NONNULL_END
