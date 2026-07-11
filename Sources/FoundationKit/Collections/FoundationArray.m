/*
 *  FoundationArray.m
 *  foundation-kit
 *
 *  Created by Fang Ling on 2026/4/19.
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

#import "FoundationArray.h"

#import "FoundationCoreFoundationArray.h"

C_ASSUME_NONNULL_BEGIN

@implementation FoundationArray

+ (instancetype)makeArray {
  return [[_FoundationCoreFoundationArray alloc] initWithObjects:null
                                                           count:0
                                                       isMutable:no];
}

+ (instancetype)arrayWithObjects:(ObjectiveCAnyObject nillable const[])objects
                           count:(CInteger)count {
  return [[_FoundationCoreFoundationArray alloc] initWithObjects:objects
                                                           count:count
                                                       isMutable:no];
}

- (CInteger)count {
  CDebuggingHaltWithMessage("*** ABSTRACT METHOD count IS BEING CALLED. ***");
}

- (ObjectiveCAnyObject)objectAtIndexedSubscript:(CInteger)index {
  CDebuggingHaltWithMessage(
    "*** ABSTRACT METHOD objectAtIndexedSubscript: IS BEING CALLED. ***"
  );
}

/* MARK: - FoundationEnumerable Implementations */
- (CInteger)countByEnumeratingWithState:(FoundationEnumerationState *)state
                                objects:(_FoundationEnumerationBuffer)buffer
                                  count:(CInteger)count {
  CDebuggingHaltWithMessage(
    "*** ABSTRACT METHOD countByEnumeratingWithState:objects:count: "
    "IS BEING CALLED. ***"
  );
}

/* MARK: - ObjectiveCCopyable Implementations */
- (ObjectiveCAnyObject)copy {
  CDebuggingHaltWithMessage("*** ABSTRACT METHOD copy IS BEING CALLED. ***");
}

@end

C_ASSUME_NONNULL_END
