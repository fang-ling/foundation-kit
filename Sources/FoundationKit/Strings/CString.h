////
////  CString.h
////  foundation-framework
////
////  Created by Fang Ling on 2026/3/8.
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
//#ifndef CString_h
//#define CString_h
//
//#include "../Numerics/Integer32.h"
//#include "../Numerics/Integer64.h"
//
///**
// * A pointer to a null-terminated sequence of UTF-8 code units.
// */
//typedef const char* Foundation_CString;
//
//struct _Foundation_CString_UTF8StateMachine {
//  Foundation_Integer32 leastValidCodePoint;
//  Foundation_Integer32 currentCodePoint;
//  Foundation_Integer32 remainingByteCount;
//};
//
//Foundation_UnsignedInteger64
//_Foundation_CString_ConvertUTF8CharacterToUTF32Character(
//  Foundation_Integer32* destination,
//  Foundation_CString source,
//  Foundation_UnsignedInteger64 n,
//  struct _Foundation_CString_UTF8StateMachine* stateMachine
//);
//
//Foundation_UnsignedInteger64
//_Foundation_CString_ConvertUTF8StringToUTF32String(
//  Foundation_Integer32* destination,
//  Foundation_CString* source,
//  Foundation_UnsignedInteger64 maximumAllowedSize,
//  Foundation_UnsignedInteger64 destinationSize,
//  struct _Foundation_CString_UTF8StateMachine* stateMachine
//);
//
//#endif /* CString_h */
