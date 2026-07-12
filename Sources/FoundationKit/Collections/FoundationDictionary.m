/*
 *  FoundationDictionary.m
 *  foundation-kit
 *
 *  Created by Fang Ling on 2026/6/27.
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

#import "FoundationDictionary.h"

#import "FoundationCoreFoundationDictionary.h"

C_ASSUME_NONNULL_BEGIN

@implementation FoundationDictionary

+ (instancetype)makeDictionary {
  return [[_FoundationCoreFoundationDictionary alloc] initWithObjects:null
                                                              forKeys:null
                                                                count:0
                                                            isMutable:no];
}

+ (instancetype)
  dictionaryWithObjects:(ObjectiveCAnyObject nonnil const[])objects
                forKeys:(ObjectiveCAnyObject nonnil const[])keys
                  count:(CInteger)count {
  return [[_FoundationCoreFoundationDictionary alloc] initWithObjects:objects
                                                              forKeys:keys
                                                                count:count
                                                            isMutable:no];
}

- (CInteger)count {
  CDebuggingHaltWithMessage("*** ABSTRACT METHOD count IS BEING CALLED. ***");
}

- (ObjectiveCAnyObject)objectForKeyedSubscript:(ObjectiveCAnyObject)key {
  CDebuggingHaltWithMessage(
    "*** ABSTRACT METHOD objectForKeyedSubscript: IS BEING CALLED. ***"
  );
}

/* MARK: - FoundationEnumerable Implementations */
- (CInteger)countByEnumeratingWithState:(FoundationEnumerationState*)state
                                objects:(_FoundationEnumerationBuffer)buffer
                                  count:(CInteger)count {
  CDebuggingHaltWithMessage(
    "*** ABSTRACT METHOD countByEnumeratingWithState:objects:count: "
    "IS BEING CALLED. ***"
  );
}

@end

C_ASSUME_NONNULL_END
