/*
 *  FoundationCoreFoundationString.h
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

#import "FoundationString.h"

#import <CKit/CKit.h>

C_ASSUME_NONNULL_BEGIN

@interface _FoundationCoreFoundationString: FoundationString

- (nullable instancetype)initWithCString:(CString)cString;

/**
 * Returns a string object initialized by using a given format string as a
 * template into which the remaining argument values are substituted.
 *
 * This method is meant to be called from within a variadic function, where the
 * argument list will be available.
 *
 * - Parameters:
 *   - format: A format string. This value must not be `nil`.
 *   - arguments: A list of arguments to substitute into format.
 *
 * - Returns: A newly initialized object by using format as a template into
 *   which the values in `arguments` are substituted. The returned object may be
 *   different from the original receiver.
 */
- (instancetype)initWithFormat:(FoundationString*)format
                     arguments:(CVariableArgumentList)arguments;

@end

C_ASSUME_NONNULL_END
