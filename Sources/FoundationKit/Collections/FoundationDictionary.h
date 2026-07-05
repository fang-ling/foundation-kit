/*
 *  FoundationDictionary.h
 *  foundation-kit
 *
 *  Created by Fang Ling on 2026/6/27.
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

#import "FoundationEnumerable.h"
#import "../Sorting/FoundationComparable.h"

#import <CKit/CKit.h>
#import <ObjectiveCKit/ObjectiveCKit.h>

C_ASSUME_NONNULL_BEGIN

/**
 * A static collection of objects associated with unique keys.
 *
 * The ``FoundationDictionary`` class declares the programmatic interface to
 * objects that manage immutable associations of keys and values. For example,
 * an interactive form could be represented as a dictionary, with the field
 * names as keys, corresponding to user-entered values.
 *
 * Use this class or its subclass ``FoundationMutableDictionary`` when you need
 * a convenient and efficient way to retrieve data associated with an arbitrary
 * key. ``FoundationDictionary`` creates static dictionaries, and
 * ``FoundationMutableDictionary`` creates dynamic dictionaries. (For
 * convenience, the term dictionary refers to any instance of one of these
 * classes without specifying its exact class membership.)
 *
 * A key-value pair within a dictionary is called an entry. Each entry consists
 * of one object that represents the key and a second object that is that key's
 * value. Within a dictionary, the keys are unique. That is, no two keys in a
 * single dictionary are equal. In general, a key can be any object (provided
 * that it conforms to the ``ObjectiveCCopyable`` and ``ObjectiveCComparable``
 * protocols—see below). Neither a key nor a value can be `nil`; if you need to
 * represent a `null` value in a dictionary, you should use
 * ``FoundationNaught``.
 *
 * ### Creating FoundationDictionary Objects Using Dictionary Literals
 *
 * In addition to the provided initializers, such as
 * ``makeDictionaryWithObjects:forKeys:``, you can create an
 * ``FoundationDictionary`` object using a dictionary literal.
 *
 *   ```objective-c
 *   let dictionary = @{
 *     @"anObject": someObject,
 *     @"aString": @"Hello, World!",
 *     @"magicNumber": @42
 *   };
 *   ```
 *
 * In Objective-C, the compiler generates code that makes an underlying call to
 * the ``dictionaryWithObjects:forKeys:count:`` method.
 *
 *   ```objective-c
 *   ObjectiveCAnyObject objects[] = { someObject, @"Hello, World!", @42 };
 *   ObjectiveCAnyObject keys[] = { @"anObject", @"aString", @"magicNumber" };
 *   let count = sizeof(objects) / sizeof(id);
 *   let dictionary = [FoundationDictionary dictionaryWithObjects:objects
 *                                                        forKeys:keys
 *                                                          count:count];
 *   ```
 *
 * Unlike ``dictionaryWithObjectsAndKeys:`` and other initializers, dictionary
 * literals specify entries in key-value order. You should not terminate the
 * list of objects with `nil` when using this literal syntax, and in fact `nil`
 * is an invalid value.
 *
 * ### Accessing Values Using Subscripting
 *
 * You can access ``FoundationDictionary`` values by their keys using
 * _subscripting_.
 *
 *   ```objective-c
 *   let value = dictionary[@"aString"];
 *   ```
 *
 * ### Enumerating Entries Using for-in Loops
 *
 * You can enumerate ``FoundationDictionary`` entries using for-in loops.
 *
 *   ```objective-c
 *   for (let key in dictionary) {
 *     ObjectiveCAnyObject value = dictionary[key];
 *   }
 *   ```
 *
 * ### Subclassing Notes
 *
 * You generally shouldn't need to subclass ``FoundationDictionary``. Custom
 * behavior can usually be achieved through composition rather than subclassing.
 *
 * ## Topics
 *
 * ### Creating an Empty Dictionary
 *
 * - ``makeDictionary``
 *
 * ### Creating a Dictionary from Objects and Keys
 *
 * - ``dictionaryWithObjects:forKeys:count:``
 *
 * ### Counting Entries
 *
 * - ``count``
 *
 * ### Accessing Keys and Values
 *
 * - ``objectForKeyedSubscript:``
 *
 * ### Enumerating Dictionaries
 *
 * - ``countByEnumeratingWithState:objects:count:``
 */
@interface FoundationDictionary<Key, Value>: ObjectiveCObject <
  FoundationEnumerable
>

/**
 * The number of entries in the dictionary.
 */
@property (nonatomic, readonly) CInteger count;

/**
 * Creates an empty dictionary.
 *
 * This method is declared primarily for use with mutable subclasses of
 * ``FoundationDictionary``.
 *
 * - Returns: A new empty dictionary.
 */
+ (instancetype)makeDictionary;

/**
 * Creates a dictionary containing a specified number of objects from a C array.
 *
 * This method steps through the objects and keys arrays, creating entries in
 * the new dictionary as it goes.
 *
 * > Note: The compiler calls this method when using the container literal
 *   syntax. Do not use this method directly.
 *
 * - Parameters:
 *   - objects: A C array of values for the new dictionary.
 *   - keys: A C array of keys for the new dictionary. Each key is copied (keys
 *     must conform to the ``ObjectiveCCopyable`` protocol), and the copy is
 *     added to the new dictionary.
 *   - count: The number of elements to use from the keys and objects arrays.
 *     `count` must not exceed the number of elements in objects or keys.
 */
+ (instancetype)dictionaryWithObjects:(Value nonnil const[nonnil])objects
                              forKeys:(Key nonnil const[nonnil])keys
                                count:(CInteger)count;

/**
 * Returns the value associated with a given key.
 *
 * You shouldn't need to call this method directly. Instead, this method is
 * called when accessing an object by key using subscripting.
 *
 *   ```objective-c
 *   let value = dictionary[@"key"];
 *   ```
 *
 * - Parameter key: The key for which to return the corresponding value.
 *
 * - Returns: The value associated with the key, or `nil` if no value is
 *   associated with the key.
 */
- (Value)
  objectForKeyedSubscript:(Key<ObjectiveCCopyable, FoundationComparable>)key;

/**
 * Returns by reference a C array of objects over which the sender should
 * iterate.
 *
 * You shouldn't need to call this method directly. Instead, this method is
 * called when enumerate the dictionary using for-in loops.
 *
 * - Parameters:
 *   - state: Context information that is used in the enumeration to, in
 *     addition to other possibilities, ensure that the collection has not been
 *     mutated.
 *   - buffer: A C array of objects over which the sender is to iterate.
 *   - count: The maximum number of objects to return in `buffer`.
 *
 * - Returns: The number of objects returned in buffer. Returns `0` when the
 *   iteration is finished.
 */
- (CInteger)countByEnumeratingWithState:(FoundationEnumerationState *)state
                                objects:(_FoundationEnumerationBuffer)buffer
                                  count:(CInteger)count;

@end

@compatibility_alias NSDictionary FoundationDictionary;

C_ASSUME_NONNULL_END
