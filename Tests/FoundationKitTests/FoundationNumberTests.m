/*
 *  FoundationNumberTests.m
 *  foundation-kit
 *
 *  Created by Fang Ling on 2026/4/25.
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

@interface FoundationNumberTests: XCTestCase

@end

@implementation FoundationNumberTests

- (void)testFoundationNumber {
//  var number = FoundationNumber.make(withUnsignedInteger64: 19358)
//  #expect(number.unsignedInteger64Value == 19358)
//
//  // Test bridging.
//  var unsignedInteger64Value = CUnsignedInteger64(19342)
//  number = Unmanaged<FoundationNumber>
//    .fromOpaque(
//      UnsafeRawPointer(
//        CoreFoundationNumberInitialize(
//          kCoreFoundationNumberTypeUnsignedInteger64,
//          &unsignedInteger64Value
//        )
//      )
//    )
//    .takeRetainedValue()
//  #expect(number.unsignedInteger64Value == 19342)
//
//  unsignedInteger64Value = CUnsignedInteger64(12333)
//  number = Unmanaged<FoundationNumber>
//    .fromOpaque(
//      UnsafeRawPointer(
//        CoreFoundationNumberInitialize(
//          kCoreFoundationNumberTypeUnsignedInteger64,
//          &unsignedInteger64Value
//        )
//      )
//    )
//    .takeUnretainedValue()
//  #expect(number.unsignedInteger64Value == 12333)
//  CoreFoundationRelease(Unmanaged.passUnretained(number).toOpaque())

  let number1 = [FoundationNumber numberWithLongLong:19358];
  let number2 = [FoundationNumber numberWithLongLong:19348];
  XCTAssertEqual(
    [number1 compare:number2],
    kFoundationComparisonResultDescendingOrder
  );
}

@end

C_ASSUME_NONNULL_END
