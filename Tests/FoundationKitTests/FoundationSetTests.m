/*
 *  FoundationSetTests.m
 *  foundation-kit
 *
 *  Created by Fang Ling on 2026/7/26.
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
#import <FoundationKit/FoundationKit.h>

#import <XCTest/XCTest.h>

@interface FoundationSetTests: XCTestCase

@end

@implementation FoundationSetTests

- (void)testFoundationSet {
  let set = (FoundationMutableSet*)[FoundationSet makeSet];

  set = [FoundationMutableSet makeSet];

  let object = [FoundationString makeStringWithCString:"Diana"];
  [set insertObject:object];
  XCTAssertTrue([set containsObject:object]);
  object = [FoundationString makeStringWithCString:"Clara"];
  XCTAssertFalse([set containsObject:object]);
}

@end
