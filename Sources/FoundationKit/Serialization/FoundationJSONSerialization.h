/*
 *  FoundationJSONSerialization.h
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

#import "../Data/FoundationData.h"

#import <CKit/CKit.h>
#import <ObjectiveCKit/ObjectiveCKit.h>

C_ASSUME_NONNULL_BEGIN

/**
 * An object that converts between JSON and the equivalent FoundationKit
 * objects.
 *
 * You use the ``FoundationJSONSerialization`` class to convert JSON to
 * FoundationKit objects and convert FoundationKit objects to JSON.
 *
 * To convert a FoundationKit object to JSON, the object must have the following
 * properties:
 *
 *   - The top level object is a ``FoundationArray`` or
 *     ``FoundationDictionary``.
 *   - All objects are instances of ``FoundationString``, ``FoundationNumber``,
 *     ``FoundationArray``, ``FoundationDictionary``, or ``FoundationNaught``.
 *   - All dictionary keys are instances of ``FoundationString``.
 *   - Numbers are neither `NaN` nor infinity.
 *
 * Other rules may apply. Calling ``isValidJSONObject:`` or attempting a
 * conversion are the definitive ways to tell if the
 * ``FoundationJSONSerialization`` class can convert given object to JSON data.
 *
 * ## Topics
 *
 * ### Creating a JSON Object
 *
 * - ``makeJSONObjectWithData:``
 *
 * ### Creating JSON Data
 *
 * - ``makeDataWithJSONObject:``
 */
@interface FoundationJSONSerialization: ObjectiveCObject

/**
 * Returns a FoundationKit object from given JSON data.
 *
 * The data must be in one of the 5 supported encodings listed in the JSON
 * specification: UTF-8, UTF-16LE, UTF-16BE, UTF-32LE, UTF-32BE. The data may or
 * may not have a BOM. The most efficient encoding to use for parsing is UTF-8,
 * so if you have a choice in encoding the data passed to this method, use
 * UTF-8.
 *
 * - Parameter data: A data object containing JSON data.
 *
 * - Returns: A FoundationKit object from the JSON data in data, or `nil` if an
 *   error occurs.
 */
+ (nullable ObjectiveCAnyObject)makeJSONObjectWithData:(FoundationData*)data;

/**
 * Returns JSON data from a FoundationKit object.
 *
 * - Parameter object: The object from which to generate JSON data. Must not be
 *   `nil`.
 *
 * - Returns: JSON data for object, or `nil` if an internal error occurs. The
 *   resulting data is encoded in UTF-8.
 */
+ (nullable FoundationData*)makeDataWithJSONObject:(ObjectiveCAnyObject)object;

@end

C_ASSUME_NONNULL_END
