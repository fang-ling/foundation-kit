/*
 *  FoundationJSONSerialization.m
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

#import "FoundationJSONSerialization.h"

#import "../Collections/FoundationMutableArray.h"
#import "../Collections/FoundationMutableDictionary.h"
#import "../Numerics/FoundationNumber.h"
#import "../Strings/FoundationString.h"

#import <CYYJSON/CYYJSON.h>

C_ASSUME_NONNULL_BEGIN

ObjectiveCAnyObject FoundationJSONSerializationDecode(CYYJSONValue* value) {
  if (!value) {
    return nil;
  }

  switch (CYYJSONValueGetType(value)) {
    case kCYYJSONTypeNil:
      return nil; /* FIXME: Return FoundationNaught. */

    case kCYYJSONTypeBoolean:
      return CYYJSONValueGetBooleanValue(value) ? @1ll : @0ll;

    case kCYYJSONTypeNumber: {
      let subtype = CYYJSONValueGetSubtype(value);

      if (subtype == kCYYJSONSubtypeUnsignedInteger) {
        return @(CYYJSONValueGetUnsignedIntegerValue(value));
      } else if (subtype == kCYYJSONSubtypeInteger) {
        return @(CYYJSONValueGetIntegerValue(value));
      } else if (subtype == kCYYJSONSubtypeFloatingPoint) {
        return @(CYYJSONValueGetFloatingPointValue(value));
      }
    }

    case kCYYJSONTypeString: {
      let cString = CYYJSONValueGetStringValue(value);

      return [FoundationString makeStringWithCString:cString];
    }

    case kCYYJSONTypeArray: {
      let array = [FoundationMutableArray makeArray];

      let iterator = CYYJSONArrayIteratorCreate(value);
      let item = (CYYJSONValue*)null;
      while ((item = CYYJSONArrayIteratorGetNextItem(&iterator))) {
        /* FIXME: nil check. */
        [array appendObject:FoundationJSONSerializationDecode(item)];
      }

      return array; /* TODO: immutable copy. */
    }

    case kCYYJSONTypeDictionary: {
      let dictionary = [FoundationMutableDictionary makeDictionary];

      let iterator = CYYJSONDictionaryIteratorCreate(value);
      let key = (CYYJSONValue*)null;
      while ((key = CYYJSONDictionaryIteratorGetNextItem(&iterator))) {
        let object = CYYJSONDictionaryIteratorGetObjectByKey(key);

        let keyCString = CYYJSONValueGetStringValue(key);
        let keyString = [FoundationString makeStringWithCString:keyCString];

        /* FIXME: nil check. */
        dictionary[keyString] = FoundationJSONSerializationDecode(object);
      }

      return dictionary; /* TODO: immutable copy. */
    }

    default:
      return nil;
  }
}

@implementation FoundationJSONSerialization

+ (ObjectiveCAnyObject)makeJSONObjectWithData:(FoundationData*)data {
  let document = CYYJSONDocumentInitializeFromData(data.bytes, data.count, 0);

  let rootValue = CYYJSONDocumentGetRootValue(document);

  ObjectiveCAnyObject object = FoundationJSONSerializationDecode(rootValue);

  CYYJSONDocumentDeinitialize(document);

  return object;
}

@end

C_ASSUME_NONNULL_END
