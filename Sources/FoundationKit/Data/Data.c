////
////  Data.c
////  foundation-framework
////
////  Created by Fang Ling on 2026/2/9.
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
//#include "Data.h"
//
//#include <stdlib.h>
//#include <string.h>
//
//ASSUME_NONNULL_BEGIN
//
//Foundation_Data
//Foundation_Data_Initialize(const Foundation_UnsignedInteger8* bytes,
//                           Foundation_UnsignedInteger64 count) {
//  let data = (struct _Foundation_Data*)malloc(sizeof(struct _Foundation_Data));
//  data->_objectBase.retainCount = 1;
//
//  data->_count = count;
//  data->_bytes = malloc(count);
//  memcpy(data->_bytes, bytes, count);
//
//  return data;
//}
//
//void Foundation_Data_Retain(Foundation_Data data) {
//  Foundation_ObjectBase_Retain(&data->_objectBase);
//}
//
//void Foundation_Data_Release(Foundation_Data data) {
//  let shouldDeallocate = Foundation_ObjectBase_Release(&data->_objectBase);
//
//  if (shouldDeallocate) {
//    free(data->_bytes);
//    free((struct _Foundation_Data*)data);
//  }
//}
//
//Foundation_UnsignedInteger64 Foundation_Data_GetCount(Foundation_Data data) {
//  Foundation_Data_Retain(data);
//
//  let count = data->_count;
//
//  Foundation_Data_Release(data);
//  return count;
//}
//
//const Foundation_UnsignedInteger8*
//Foundation_Data_GetBytes(Foundation_Data data) {
//  Foundation_Data_Retain(data);
//
//  let bytes = data->_bytes;
//
//  Foundation_Data_Release(data);
//  return bytes;
//}
//
//ASSUME_NONNULL_END
