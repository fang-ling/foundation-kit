//
//  Base.h
//  foundation-framework
//
//  Created by Fang Ling on 2026/2/10.
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

#ifndef Base_h
#define Base_h

#define var __auto_type
#define let const __auto_type

#ifndef ONLINE_JUDGE
#include <swift/bridging>
#define SWIFT_ENUM __attribute__((enum_extensibility(closed)))

#define ASSUME_NONNULL_BEGIN _Pragma("clang assume_nonnull begin")
#define ASSUME_NONNULL_END _Pragma("clang assume_nonnull end")
#define NULLABLE _Nullable
#else
/*
 * Empty defines for online-judge's compiler that don't support
 * `attribute(swift_attr)`.
 */
#define SWIFT_ENUM
#define SWIFT_SELF_CONTAINED
#define SWIFT_RETURNS_INDEPENDENT_VALUE
#define SWIFT_SHARED_REFERENCE(_retain, _release)
#define SWIFT_IMMORTAL_REFERENCE
#define SWIFT_UNSAFE_REFERENCE
#define SWIFT_NAME(_name)
#define SWIFT_CONFORMS_TO_PROTOCOL(_moduleName_protocolName)
#define SWIFT_COMPUTED_PROPERTY
#define SWIFT_MUTATING
#define SWIFT_UNCHECKED_SENDABLE
#define SWIFT_NONCOPYABLE
#define SWIDT_NONCOPYABLE_WITH_DESTROY(_destroy)
#define SWIFT_NONESCAPABLE
#define SWIFT_ESCAPABLE
#define SWIFT_ESCAPABLE_IF(...)
#define SWIFT_RETURNS_RETAINED
#define SWIFT_RETURNS_UNRETAINED
#define SWIFT_PRIVATE_FILEID(_fileID)

/*
 * Empty defines for online-judge's compiler that don't support nullability
 * checks.
 */
#define ASSUME_NONNULL_BEGIN
#define ASSUME_NONNULL_END
#define NULLABLE
#endif

#endif /* Base_h */
