/*
 *  FoundationStringTests.m
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

#import <CKit/CKit.h>
#import <FoundationKit/FoundationKit.h>

#import <XCTest/XCTest.h>

C_ASSUME_NONNULL_BEGIN

@interface FoundationStringTests: XCTestCase

@end

@implementation FoundationStringTests

- (void)testFoundationString {
//  let inputStrings = ["", "Hello, world!", "こんにち", "🌍", "🐮 say ", "ω"]
//
//  for inputString in inputStrings {
//    var string = FoundationString.makeString(withCString: inputString)!
//
//    let count = string.count
//    let characters = UnsafeMutablePointer<CInteger32>.allocate(
//      capacity: Int(count)
//    )
//    string.copyCharacters(characters)
//    let inputCharacters = inputString.unicodeScalars.map {
//      CInteger32($0.value)
//    }
//    let comparisonResult = memcmp(
//      characters,
//      inputCharacters,
//      MemoryLayout<CInteger32>.size * Int(count)
//    )
//
//    #expect(comparisonResult == 0)
//    #expect(count == inputCharacters.count)
//
//    // Test equality.
//    let otherString = FoundationString.makeString(withCString: inputString)!
//    #expect(string.isEqual(otherString))
//
//    // Test bridging.
//    string = Unmanaged<FoundationString>
//      .fromOpaque(
//        UnsafeRawPointer(
//          CoreFoundationStringInitializeWithCString(inputString)!
//        )
//      )
//      .takeRetainedValue()
//    #expect(string.count == inputString.count)
//
//    string = Unmanaged<FoundationString>
//      .fromOpaque(
//        UnsafeRawPointer(
//          CoreFoundationStringInitializeWithCString(inputString)!
//        )
//      )
//      .takeUnretainedValue()
//    #expect(string.count == inputString.count)
//    CoreFoundationRelease(Unmanaged.passUnretained(string).toOpaque())
//  }
//
//  // Test inequality.
//  let greetingString = FoundationString.makeString(withCString: "Hello")!
//  let anotherGreetingString = FoundationString.makeString(withCString: "Heil")!
//  #expect(!greetingString.isEqual(anotherGreetingString))

  let string1 = [FoundationString makeStringWithCString:"abc"];
  let string2 = [FoundationString makeStringWithCString:"acd"];
  let string3 = [FoundationString makeStringWithCString:"b"];
  XCTAssertEqual(
    [string1 compare:string2],
    kFoundationComparisonResultAscendingOrder
  );
  XCTAssertEqual(
    [string2 compare:string3],
    kFoundationComparisonResultAscendingOrder
  );
  XCTAssertEqual(
    [string3 compare:string1],
    kFoundationComparisonResultDescendingOrder
  );

  string1 = [FoundationString makeStringWithCString:"🌍"];
  string2 = [FoundationString makeStringWithCString:"🚢"];
  string3 = [FoundationString makeStringWithCString:"🌍"];
  XCTAssertNotEqual(
    [string1 compare:string2],
    kFoundationComparisonResultSameOrder
  );
  XCTAssertEqual(
    [string1 compare:string3],
    kFoundationComparisonResultSameOrder
  );

  string1 = [FoundationString makeStringWithCString:"Name"];
  string2 = [FoundationString makeStringWithCString:"Breed"];
  XCTAssertEqual(
    [string1 compare:string2],
    kFoundationComparisonResultDescendingOrder
  );
}

@end

C_ASSUME_NONNULL_END
