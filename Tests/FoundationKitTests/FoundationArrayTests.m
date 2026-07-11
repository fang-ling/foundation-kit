/*
 *  FoundationArrayTests.m
 *  foundation-kit
 *
 *  Created by Fang Ling on 2026/4/18.
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
#import <ObjectiveCKit/ObjectiveCKit.h>

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>

C_ASSUME_NONNULL_BEGIN

@interface Cat: ObjectiveCObject

@property (nonatomic, copy) NSString* name;

- (instancetype)initWithName:(NSString*)name;

@end

@implementation Cat

- (instancetype)initWithName:(NSString*)name {
  if (!(self = [super init])) {
    return nil;
  }

  self.name = name;

  return self;
}

@end

@interface FoundationArrayTests: XCTestCase

@end

@implementation FoundationArrayTests

- (void)testFoundationArray {
  let array = [FoundationMutableArray makeArray];
  XCTAssertEqual(array.count, 0);

  [array appendObject:[[Cat alloc] initWithName:@"Alice"]];
  XCTAssertTrue([((Cat*)array[0]).name isEqual:@"Alice"]);
  XCTAssertEqual(array.count, 1);

  [array appendObject:[[Cat alloc] initWithName:@"Tracy"]];
  XCTAssertTrue([((Cat*)array[1]).name isEqual:@"Tracy"]);
  XCTAssertEqual(array.count, 2);

  [array removeLastObject];
  XCTAssertTrue([((Cat*)array[0]).name isEqual:@"Alice"]);
  XCTAssertEqual(array.count, 1);

  [array removeLastObject];
  XCTAssertEqual(array.count, 0);

  array = [FoundationMutableArray makeArray];
  [array appendObject:[[Cat alloc] initWithName:@"Diana"]];
  [array appendObject:[[Cat alloc] initWithName:@"Clara"]];

  [array insertObject:[[Cat alloc] initWithName:@"Alice"] atIndex:0];
  XCTAssertTrue([((Cat*)array[0]).name isEqual:@"Alice"]);

  [array insertObject:[[Cat alloc] initWithName:@"Tracy"] atIndex:0];
  XCTAssertTrue([((Cat*)array[0]).name isEqual:@"Tracy"]);

  [array removeObjectAtIndex:0];
  XCTAssertTrue([((Cat*)array[0]).name isEqual:@"Alice"]);

  [array removeObjectAtIndex:1];
  XCTAssertTrue([((Cat*)array[1]).name isEqual:@"Clara"]);

  ObjectiveCAnyObject objects[] = {
    [[Cat alloc] initWithName:@"Alice"],
    [[Cat alloc] initWithName:@"Tracy"],
    [[Cat alloc] initWithName:@"Diana"],
    [[Cat alloc] initWithName:@"Clara"]
  };
  array = [FoundationMutableArray arrayWithObjects:objects
                                             count:3];
  XCTAssertEqual(array.count, 3);
  XCTAssertTrue([((Cat*)array[2]).name isEqual:@"Diana"]);
}

@end

C_ASSUME_NONNULL_END
