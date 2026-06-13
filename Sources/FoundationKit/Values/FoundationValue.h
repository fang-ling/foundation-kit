/*
 *  FoundationValue.h
 *  foundation-kit
 *
 *  Created by Fang Ling on 2026/6/13.
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

#import <CKit/CKit.h>
#import <ObjectiveCKit/ObjectiveCKit.h>

C_ASSUME_NONNULL_BEGIN

/**
 * A simple container for a single C or Objective-C data item.
 *
 * A ``FoundationValue`` object can hold any of the scalar types such as
 * ``CInteger``, ``CUnsignedInteger``, and ``CFloatingPoint``, as well as
 * pointers, structures, and object `id` references. Use this class to work with
 * such data types in collections (such as ``FoundationArray`` and
 * ``FoundationDictionary``), and other APIs that require Objective-C objects.
 * ``FoundationValue`` objects are always immutable.
 *
 * ### Subclassing Notes
 *
 * The abstract ``FoundationValue`` class is the public interface of a class
 * cluster consisting mostly of private, concrete classes that create and return
 * a value object appropriate for a given situation. It is possible to subclass
 * ``FoundationValue``, but doing so requires providing storage facilities for
 * the value (which is not inherited by subclasses) and implementing two
 * primitive methods.
 *
 * #### Methods to Override
 *
 * Any subclass of ``FoundationValue`` must override the primitive instance
 * methods ``copyValue:`` and ``size``. These methods must operate on the
 * storage that you provide for the value.
 *
 * You might want to implement an initializer for your subclass that is suited
 * to the storage you provide. The ``FoundationValue`` class does not have a
 * designated initializer, so your initializer need only invoke the ``init``
 * method of `super`. The ``FoundationValue`` class adopts the
 * ``ObjectiveCCopyable`` protocol; if you want instances of your own custom
 * subclass created from copying, override the methods in this protocol.
 *
 * #### Alternatives to Subclassing
 *
 * If you need only to use ``FoundationValue`` objects for wrap a custom data
 * types or structures defined by your app, you need not create an
 * ``FoundationValue`` subclass.
 *
 * ## Topics
 *
 * ### Working with Raw Values
 *
 * - ``size``
 * - ``makeValueWithBytes:size:``
 * - ``copyValue:``
 */
@interface FoundationValue: ObjectiveCObject

/**
 * The size of the data contained in the value object.
 *
 * This property provides the same value produced by the `sizeof` compiler
 * directive.
 */
@property (nonatomic, readonly) CInteger size;

/**
 * Creates a value object containing the specified value with the specified
 * size.
 *
 * - Parameters:
 *   - bytes: A pointer to data to be stored in the new value object.
 *   - size: The size in bytes of the data, as provided by the `sizeof` compiler
 *     directive. Do not hard-code this parameter as a `CInteger`.
 *
 * - Returns: A new value object that contains value.
 */
+ (instancetype)makeValueWithBytes:(const void*)bytes size:(CInteger)size;

/**
 * Copies the value into the specified buffer.
 *
 * - Parameter value: A buffer into which to copy the value. The buffer must be
 *   large enough to hold the value.
 */
- (void)copyValue:(void*)value;

@end

C_ASSUME_NONNULL_END
