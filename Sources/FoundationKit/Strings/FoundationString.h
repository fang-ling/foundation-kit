/*
 *  FoundationString.h
 *  foundation-kit
 *
 *  Created by Fang Ling on 2026/5/1.
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

#import "FoundationStringConvertible.h"
#import "../Sorting/FoundationComparable.h"

#import <CKit/CKit.h>
#import <ObjectiveCKit/ObjectiveCKit.h>

C_ASSUME_NONNULL_BEGIN

#define $(format, ...) \
  [FoundationString makeStringWithFormat:format, ##__VA_ARGS__]

@interface FoundationString: ObjectiveCObject <
  ObjectiveCCopyable,
  ObjectiveCEquatable,
  FoundationComparable,
  FoundationStringConvertible
>

/**
 * The number of characters in a string.
 */
@property (nonatomic, readonly) CInteger count;

/**
 * The number of characters in the C-string representation.
 */
@property (nonatomic, readonly) CInteger cStringCount;

+ (nullable instancetype)makeStringWithCString:(CString)cString;

/**
 * Returns a string created by using a given format string as a template into
 * which the remaining argument values are substituted.
 *
 * Pass a comma-separated list of trailing variadic arguments to substitute into
 * format.
 *
 * - Parameter format: A format string. This value must not be `nil`.
 *
 * - Returns A string created by using format as a template into which the
 *   remaining argument values are substituted without any localization.
 */
+ (instancetype)makeStringWithFormat:(FoundationString*)format, ...;

/**
 * Copies all characters from the receiver into a given buffer.
 *
 * - Parameter characters: Upon return, contains the characters from the
 *   receiver. `characters` must be large enough to contain all characters in
 *   the string.
 */
- (void)copyCharacters:(CInteger32*)characters;

/**
 * Converts the string to a C-string and stores it in a buffer.
 *
 * - Parameter cString: Upon return, contains the converted C-string plus the
 *   `null` termination `cString`. buffer must be large enough to contain the
 *   resulting C-string plus a terminating `null` character.
 */
- (void)copyCString:(CInteger8*)cString;

@end

C_ASSUME_NONNULL_END
