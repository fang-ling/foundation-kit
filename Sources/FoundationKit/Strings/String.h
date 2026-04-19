////
////  String.h
////  foundation-framework
////
////  Created by Fang Ling on 2026/3/7.
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
//#ifndef String_h
//#define String_h
//
//#include "../Miscellanies/Base.h"
//#include "../Miscellanies/ComparisonResult.h"
//#include "../Miscellanies/Object.h"
//#include "../Numerics/Integer32.h"
//
//#include "CString.h"
//
//ASSUME_NONNULL_BEGIN
//
//typedef struct _Foundation_StringClass* _Foundation_StringClass;
//
//typedef const struct _Foundation_String* Foundation_String;
//
//struct _Foundation_StringClass {
//  struct _Foundation_ObjectClass super;
//
////  struct _Foundation_Object* (*initialize)(struct _Foundation_Object* self);
////
////  void (*deinitialize)(struct _Foundation_Object* self);
////
////  void (*retain)(struct _Foundation_Object* self);
////
////  void (*release)(struct _Foundation_Object* self);
//};
//typedef struct _Foundation_Class* Foundation_Class;
//
//struct _Foundation_String {
//  Foundation_Object super;
//
//  Foundation_Integer32* _characters;
//  Foundation_UnsignedInteger64 _count;
//};
////SWIFT_NAME(String)
////SWIFT_SHARED_REFERENCE(Foundation_String_Retain, Foundation_String_Release);
//
//extern struct _Foundation_StringClass Foundation_StringClass;
//
///**
// * A Unicode string value that is a collection of characters.
// *
// * ``Foundation_String`` provides a suite of efficient string-manipulation and
// * string-conversion functions. It offers seamless Unicode support and
// * facilitates the sharing of data between Foundation and C-based programs.
// * ``Foundation_String`` objects are immutable--use ``Foundation_MutableString``
// * to create and manage a string that can be changed after it has been created.
// *
// * ``Foundation_String`` has two primitive functions,
// * ``Foundation_String_GetCount`` and
// * ``Foundation_String_GetCharacterAtIndex``, that provide the basis for all
// * other functions in its interface. The ``Foundation_String_GetCount``
// * function returns the total number (in terms of UTF-32 code pairs) of
// * characters in the string. The ``Foundation_String_GetCharacterAtIndex``
// * function gives access to each character in the string by index, with index
// * values starting at 0.
// *
// * ``Foundation_String`` provides functions for finding and comparing strings.
// * It also provides functions for reading numeric values from strings, for
// * combining strings in various ways, and for converting a string to different
// * forms (such as encoding and case changes). A number of functions, for example
// * ``Foundation_String_FindSubstring``, allow you to specify a range over which
// * to operate within a string. The specified range must not exceed the length of
// * the string.
// *
// * ## Topics
// *
// * ### Creating and Destroying a Foundation_String Object
// *
// * - ``Foundation_String_InitializeWithCString``
// * - ``Foundation_String_Retain``
// * - ``Foundation_String_Release``
// *
// * ### Examining a Foundation_String Object
// *
// * - ``Foundation_String_GetCount``
// *
// * ### Accessing Foundation_String's Characters
// *
// * - ``Foundation_String_GetCharactersView``
// *
// * ### Comparing Foundation_Strings
// *
// * - ``Foundation_String_Compare``
// */
////typedef const struct _Foundation_String* Foundation_String;
//
///* MARK: - Creating and Destroying a Foundation_String Object */
///**
// * Creates an immutable string from a C string.
// *
// * - Parameter cString: The `NULL`-terminated C string to be used to create the
// *   ``Foundation_String`` object. The string must use the utf8 encoding.
// *
// * - Returns: An immutable string containing `cString` (after stripping off the
// *   `NULL` terminating character), or `NULL` if there was a problem creating
// *   the object.
// */
//NULLABLE Foundation_String
//Foundation_String_InitializeWithCString(Foundation_CString cString);
////SWIFT_NAME(String.init(cString:))
////SWIFT_RETURNS_RETAINED;
//
///**
// * Retains a string object.
// *
// * - Parameter string: The string object to retain. This value must not be
// *   `NULL`.
// */
//void Foundation_String_Retain(Foundation_String string);
//
///**
// * Releases a string object.
// *
// * If the retain count of `string` becomes zero the memory allocated to the
// * object is deallocated and the object is destroyed.
// *
// * - Parameter string: A string object to release. This value must not be
// *   `NULL`.
// */
//Foundation_UnsignedInteger64 Foundation_String_Release(Foundation_String string);
//
///* MARK: - Examining a Foundation_String Object */
///**
// * Returns the number (in terms of UTF-32 code pairs) of Unicode characters in a
// * string.
// *
// * - Parameter string: The string to examine.
// *
// * - Returns: The number (in terms of UTF-32 code pairs) of characters stored in
// * the string.
// */
//Foundation_UnsignedInteger64
//Foundation_String_GetCount(Foundation_String string)
//SWIFT_NAME(getter:String.count(self:));
//
///* MARK: - Accessing Foundation_String's Characters */
///**
// * Quickly obtains a view to the contents of a string as a buffer of Unicode
// * characters.
// *
// * This function returns the requested view pointer immediately, with no memory
// * allocations and no copying.
// *
// * - Parameter string: The string whose contents you wish to access.
// *
// * - Returns: A view pointer to a buffer of Unicode character.
// */
//const Foundation_Integer32*
//Foundation_String_GetCharactersView(Foundation_String string)
//SWIFT_NAME(getter:String.charactersView(self:));
//
///* MARK: - Comparing Foundation_Strings */
///**
// * Compares one string with another string.
// *
// * - Parameters:
// *   - string1: The first string to use in the comparison.
// *   - string2: The second string to use in the comparison.
// *
// * - Returns: A ``Foundation_ComparisonResult`` value that indicates whether
// *   the `string1` is equal to, less than, or greater than the `string2`.
// */
//enum Foundation_ComparisonResult
//Foundation_String_Compare(Foundation_String string1,
//                          Foundation_String string2)
//SWIFT_NAME(String.compare(_:_:));
//
//ASSUME_NONNULL_END
//
//#endif /* String_h */
