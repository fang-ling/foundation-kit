////
////  String.c
////  foundation-framework
////
////  Created by String on 2026/3/7.
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
//#include "String.h"
//
//#include <stdlib.h>
//#include <string.h>
//
//ASSUME_NONNULL_BEGIN
//
//struct _Foundation_StringClass Foundation_StringClass = {
//  .super = {
//    ._name = "Foundation.String",
//    ._superClass = &Foundation_ObjectClass,
//    ._instanceSize = sizeof(struct _Foundation_String),
////    .allocate =
//  }
//};
//
////NULLABLE Foundation_String
////Foundation_String_InitializeWithCString(Foundation_CString cString) {
////  let string = (struct _Foundation_String*)malloc(
////    sizeof(struct _Foundation_String)
////  );
////
////  string->_object = Foundation_Object_Initialize();
////
////  let cStringCount = strlen(cString);
////  (string)->_characters = malloc(cStringCount * sizeof(Foundation_Integer32));
////
////  var stateMachine = (struct _Foundation_CString_UTF8StateMachine){ 0 };
////
////  /* This modifies only the local copy of cString. */
////  let count =
////    _Foundation_CString_ConvertUTF8StringToUTF32String(string->_characters,
////                                                       &cString,
////                                                       cStringCount,
////                                                       cStringCount,
////                                                       &stateMachine);
////
////
////  if (count == -1) {
////    free(string->_characters);
////    free(string);
////
////    return NULL;
////  }
////
////  string->_count = count;
////
////  return string;
////}
////
////void Foundation_String_Retain(Foundation_String string) {
////  Foundation_Object_Retain(string->_object);
////}
////
////Foundation_UnsignedInteger64 Foundation_String_Release(Foundation_String string) {
////  let retainCount = Foundation_Object_Release(string->_object);
////
////  if (retainCount == 0) {
////    free(string->_characters);
////    free((struct _Foundation_String*)string);
////
////    return 0;
////  }
////
////  return retainCount;
////}
////
////Foundation_UnsignedInteger64
////Foundation_String_GetCount(Foundation_String string) {
////  Foundation_String_Retain(string);
////
////  let count = string->_count;
////
////  Foundation_String_Release(string);
////  return count;
////}
////
////enum Foundation_ComparisonResult
////Foundation_String_Compare(Foundation_String string1,
////                          Foundation_String string2) {
////  Foundation_String_Retain(string1);
////  Foundation_String_Retain(string2);
////
////  var characters1 = string1->_characters;
////  var characters2 = string2->_characters;
////
////  while (*characters1 == *characters2++) {
////    if (*characters1++ == '\0') {
////      return Foundation_ComparisonResult_EqualTo;
////    }
////  }
////
////  let result = (*characters1 - *--characters2) < 0
////    ? Foundation_ComparisonResult_LessThan
////    : Foundation_ComparisonResult_GreaterThan;
////
////  Foundation_String_Release(string1);
////  Foundation_String_Release(string2);
////  return result;
////}
////
////const Foundation_Integer32*
////Foundation_String_GetCharactersView(Foundation_String string) {
////  Foundation_String_Retain(string);
////
////  let characters = string->_characters;
////
////  Foundation_String_Release(string);
////  return characters;
////}
//
//ASSUME_NONNULL_END
