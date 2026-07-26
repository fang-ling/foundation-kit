/*
 *  FoundationNumericConstants.h
 *  foundation-kit
 *
 *  Created by Fang Ling on 2026/7/19.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and limitations under the License.
 */

#import <CKit/CKit.h>

C_ASSUME_NONNULL_BEGIN

/**
 * A value indicating that a requested item couldn't be found or doesn't exist.
 *
 * ``FoundationNotFound`` is typically used by various methods and functions that search for items in serial data and return indices.
 * Such as characters in a string object or objects in an ``FoundationArray`` object.
 */
extern const CInteger FoundationNotFound;

C_ASSUME_NONNULL_END
