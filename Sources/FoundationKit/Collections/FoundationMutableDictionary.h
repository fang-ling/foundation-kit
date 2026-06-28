/*
 *  FoundationMutableDictionary.h
 *  foundation-kit
 *
 *  Created by Fang Ling on 2026/6/28.
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

#import "FoundationDictionary.h"

#import <CKit/CKit.h>

C_ASSUME_NONNULL_BEGIN

/**
 * A dynamic collection of objects associated with unique keys.
 *
 * The ``FoundationMutableDictionary`` class declares the programmatic interface
 * to objects that manage mutable associations of keys and values. It adds
 * modification operations to the basic operations it inherits from
 * ``FoundationDictionary``.
 *
 * ### Setting Values Using Subscripting
 *
 * In addition to the provided instance methods, such as ``setObject:forKey:``,
 * you can access ``FoundationDictionary`` values by their keys using
 * _subscripting_.
 *
 *   ```objective-c
 *   let value = @"someValue";
 *   mutableDictionary[@"someKey"] = value;
 *   ```
 *
 * ### Subclassing Notes
 *
 * There should typically be little need to subclass
 * ``FoundationMutableDictionary``. If you do need to customize behavior, it is
 * often better to consider composition rather than subclassing.
 *
 * ## Topics
 *
 * ### Adding Entries to a Mutable Dictionary
 *
 * - ``setObject:forKeyedSubscript:``
 *
 * ### Removing Entries From a Mutable Dictionary``
 *
 * - ``removeObjectForKey:``
 */
@interface FoundationMutableDictionary<Key, Value>:
  FoundationDictionary<Key, Value>

/**
 * Adds a given key-value pair to the dictionary.
 *
 * You shouldn't need to call this method directly. Instead, this method is
 * called when setting an object for a key using subscripting.
 *
 *   ```objective-c
 *   let value = @"someValue";
 *   mutableDictionary[@"someKey"] = value;
 *   ```
 *
 * - Parameters:
 *   - object: The value for key. A strong reference to the object is maintained
 *     by the dictionary.
 *   - key: The key for object. The key is copied (keys must conform to the
 *     ``ObjectiveCCopyable`` protocol). If key already exists in the
 *     dictionary, `object` takes its place.
 */
- (void)setObject:(Value)object
forKeyedSubscript:(Key<ObjectiveCCopyable, FoundationComparable>)key;

/**
 * Removes a given key and its associated value from the dictionary.
 *
 * Does nothing if the key does not exist.
 *
 * - Parameter key: The key to remove.
 */
- (void)removeObjectForKey:(Key<ObjectiveCCopyable, FoundationComparable>)key;

@end

C_ASSUME_NONNULL_END
