/*
 *  FoundationMutableSet.m
 *  foundation-kit
 *
 *  Created by Fang Ling on 2026/7/25.
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

#import "FoundationMutableSet.h"

#import "FoundationCoreFoundationSet.h"

C_ASSUME_NONNULL_BEGIN

@implementation FoundationMutableSet

+ (instancetype)makeSet {
  return [[_FoundationCoreFoundationSet alloc] initWithObjects:null count:0 isMutable:yes];
}

- (void)insertObject:(ObjectiveCAnyObject<ObjectiveCCopyable, FoundationComparable>)object {
  CDebuggingHaltWithMessage("*** ABSTRACT METHOD insertObject: IS BEING CALLED. ***");
}

@end

C_ASSUME_NONNULL_END
