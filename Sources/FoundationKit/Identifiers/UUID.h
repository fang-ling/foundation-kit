////
////  UUID.h
////  foundation-framework
////
////  Created by Fang Ling on 2026/3/28.
////
////  Licensed under the Apache License, Version 2.0 (the "License");
////  you may not use this file except in compliance with the License.
////  You may obtain a copy of the License at
////
////    http://www.apache.org/licenses/LICENSE-2.0
////
////  Unless required by applicable law or agreed to in writing, software
////  distributed under the License is distributed on an "AS IS" BASIS,
////  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
////  See the License for the specific language governing permissions and
////  limitations under the License.
////
//
//#ifndef UUID_h
//#define UUID_h
//
//#include "../Strings/String.h"
//
//ASSUME_NONNULL_BEGIN
//
//struct _Foundation_UUID {
//  struct Foundation_ObjectBase _objectBase;
//
//  Foundation_UnsignedInteger64 _uuid[2];
//}
//SWIFT_NAME(UUID)
//SWIFT_SHARED_REFERENCE(Foundation_UUID_Retain, Foundation_UUID_Release);
//
///**
// * A universally unique value to identify types, interfaces, and other items.
// *
// * ``Foundation_UUID`` objects are used by plug-ins to uniquely identify types,
// * interfaces, and factories. When creating a new type, host developers must
// * generate UUIDs to identify the type as well as its interfaces and factories.
// *
// * UUIDs (Universally Unique Identifiers), also known as GUIDs (Globally Unique
// * Identifiers) or IIDs (Interface Identifiers), are 128-bit values designed to
// * be unique.
// *
// * The standard format for UUIDs represented in ASCII is a string punctuated by
// * hyphens, for example `68753A44-4D6F-1226-9C60-0050E4C00067`. The hex
// * representation looks, as you might expect, like a list of numerical values
// * preceded by `0x`. For example, `0x68`, `0x75`, `0x3A`, `0x44`, `0x4D`,
// * `0x6F`, `0x12`, `0x26`, `0x9C`, `0x60`, `0x00`, `0x50`, `0xE4`, `0xC0`,
// * `0x00`, `0x67` . To use a UUID, you create it and then copy the resulting
// * strings into codes.
// *
// * ## Topics
// *
// * ### Creating and Destroying a Foundation_UUID Object
// *
// * - ``Foundation_UUID_Initialize``
// * - ``Foundation_UUID_Retain``
// * - ``Foundation_UUID_Release``
// *
// * ### Getting Information about Foundation_UUID Objects
// *
// * - ``Foundation_UUID_GetUUIDString``
// */
//typedef const struct _Foundation_UUID* Foundation_UUID;
//
///* MARK: - Creating and Destroying a Foundation_UUID Object */
///**
// * Creates a UUID with RFC 4122 version 4 random bytes.
// *
// * - Returns: A new UUID object.
// */
//Foundation_UUID Foundation_UUID_Initialize(void)
//SWIFT_NAME(UUID.init())
//SWIFT_RETURNS_RETAINED;
//
///**
// * Retains a UUID object.
// *
// * - Parameter uuid: The UUID object to retain. This value must not be `NULL`.
// */
//void Foundation_UUID_Retain(Foundation_UUID uuid);
//
///**
// * Releases a UUID object.
// *
// * If the retain count of `uuid` becomes zero the memory allocated to the object
// * is deallocated and the object is destroyed.
// *
// * - Parameter uuid: A UUID object to release. This value must not be `NULL`.
// */
//void Foundation_UUID_Release(Foundation_UUID uuid);
//
///* MARK: - Getting Information about Foundation_UUID Objects */
///**
// * Returns a string created from the UUID, such as
// * "E621E1F8-C36C-495A-93FC-0C247A3E6E5F".
// *
// * - Parameter uuid: The UUID object whose string representation to obtain.
// *
// * - Returns: The string representation of `uuid`. You're responsible for
// *   releasing this type using ``Foundation_String_Release``
// */
//Foundation_String Foundation_UUID_GetUUIDString(Foundation_UUID uuid)
//SWIFT_NAME(getter:UUID.uuidString(self:))
//SWIFT_RETURNS_RETAINED;
//
//ASSUME_NONNULL_END
//
//#endif /* UUID_h */
