/*
 *  FoundationIndexPath.m
 *  foundation-kit
 *
 *  Created by Fang Ling on 2026/7/18.
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

#import "FoundationIndexPath.h"

#import "../../Numerics/FoundationNumber.h"
#import "../../Numerics/FoundationNumericConstants.h"
#import "../FoundationArray.h"
#import "../FoundationMutableArray.h"

C_ASSUME_NONNULL_BEGIN

@interface FoundationIndexPath ()

@property (nonatomic) FoundationMutableArray<FoundationNumber*>* indexes;

@end

@implementation FoundationIndexPath

+ (instancetype)makeIndexPathWithIndexes:(const CInteger[])indexes count:(CInteger)count {
  let indexPath = [[FoundationIndexPath alloc] init];

  for (let i = 0; i < count; i += 1) {
    [indexPath.indexes appendObject:@(indexes[i])];
  }

  return indexPath;
}

- (instancetype)init {
  if (!(self = [super init])) {
    return nil;
  }

  self.indexes = [FoundationMutableArray makeArray];

  return self;
}

- (CInteger)indexAtPosition:(CInteger)position {
  return position < self.indexes.count ? self.indexes[position].integerValue : FoundationNotFound;
}

@end

C_ASSUME_NONNULL_END
