/*
 *  FoundationJSONSerializationTests.m
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

#import <CKit/CKit.h>
#import <FoundationKit/FoundationKit.h>

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>

C_ASSUME_NONNULL_BEGIN

@interface FoundationJSONSerializationTests: XCTestCase

@end

@implementation FoundationJSONSerializationTests

- (void)testFoundationJSONSerialization {
  let jsonString = @"[]";
  let jsonNSData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
  let jsonData = [FoundationData makeDataWithBytes:jsonNSData.bytes
                                             count:jsonNSData.length];
  ObjectiveCAnyObject jsonObject =
    [FoundationJSONSerialization makeJSONObjectWithData:jsonData];
  XCTAssertTrue([jsonObject isKindOfClass:FoundationArray.class]);
  XCTAssertEqual(((FoundationArray*)jsonObject).count, 0);

  jsonString = @"{}";
  jsonNSData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
  jsonData = [FoundationData makeDataWithBytes:jsonNSData.bytes
                                         count:jsonNSData.length];
  jsonObject = [FoundationJSONSerialization makeJSONObjectWithData:jsonData];
  XCTAssertTrue([jsonObject isKindOfClass:FoundationDictionary.class]);
  XCTAssertEqual(((FoundationDictionary*)jsonObject).count, 0);

  jsonString = @"{\"status\":\"ok\",\"code\":200}";
  jsonNSData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
  jsonData = [FoundationData makeDataWithBytes:jsonNSData.bytes
                                         count:jsonNSData.length];
  jsonObject = [FoundationJSONSerialization makeJSONObjectWithData:jsonData];
  XCTAssertTrue([jsonObject isKindOfClass:FoundationDictionary.class]);
  XCTAssertEqual(((FoundationDictionary*)jsonObject).count, 2);
  let key = [FoundationString makeStringWithCString:"status"];
  ObjectiveCAnyObject value = [FoundationString makeStringWithCString:"ok"];
  XCTAssertTrue([((FoundationDictionary*)jsonObject)[key] isEqual:value]);
  key = [FoundationString makeStringWithCString:"code"];
  value = [FoundationNumber makeNumberWithInteger64:200];
  /* TODO: Make FoundationNumber conform to the FoundationComparable */
  XCTAssertEqual(
    ((FoundationNumber*)((FoundationDictionary*)jsonObject)[key]).integerValue,
    200
  );

  jsonString = @"{\"status\":\"ok\",\"data\":[{\"name\":\"Alice\"}]}";
  jsonNSData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
  jsonData = [FoundationData makeDataWithBytes:jsonNSData.bytes
                                         count:jsonNSData.length];
  jsonObject = [FoundationJSONSerialization makeJSONObjectWithData:jsonData];
  XCTAssertTrue([jsonObject isKindOfClass:FoundationDictionary.class]);
  XCTAssertEqual(((FoundationDictionary*)jsonObject).count, 2);
  let key2 = [FoundationString makeStringWithCString:"data"];
  let value2 = (FoundationArray*)((FoundationDictionary*)jsonObject)[key2];
  XCTAssertTrue([value2 isKindOfClass:FoundationArray.class]);
  XCTAssertEqual(value2.count, 1);
  let firstItem = (FoundationDictionary*)[value2 objectAtIndex:0];
  XCTAssertTrue([firstItem isKindOfClass:FoundationDictionary.class]);
  XCTAssertEqual(firstItem.count, 1);
  let key3 = [FoundationString makeStringWithCString:"name"];
  let value3 = [FoundationString makeStringWithCString:"Alice"];
  XCTAssertTrue([firstItem[key3] isEqual:value3]);
}

@end

C_ASSUME_NONNULL_END
