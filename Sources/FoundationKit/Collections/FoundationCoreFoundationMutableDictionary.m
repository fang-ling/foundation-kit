/*
 *  FoundationCoreFoundationMutableDictionary.m
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

#import "FoundationCoreFoundationMutableDictionary.h"

#import "../Sorting/FoundationComparable.h"
#import "../Sorting/FoundationComparisonResult.h"

#import <CoreFoundationKit/CoreFoundationKit.h>
#import <ObjectiveCKit/ObjectiveCKit.h>

C_ASSUME_NONNULL_BEGIN

FoundationComparisonResult FoundationCoreFoundationMutableDictionaryCompare(
  const void* _lhs,
  const void* _rhs
) {
  let lhs = (_CoreFoundationDictionaryEntry*)_lhs;
  let rhs = (_CoreFoundationDictionaryEntry*)_rhs;

  let object1 = (bridging ObjectiveCAnyObject<FoundationComparable>)lhs->key;
  let object2 = (bridging ObjectiveCAnyObject<FoundationComparable>)rhs->key;

  return [object1 compare:object2];
}

@interface _FoundationCoreFoundationMutableDictionary () {
  _CoreFoundationRedBlackTree* tree;
}

@end

@implementation _FoundationCoreFoundationMutableDictionary

- (instancetype)init {
  if (!(self = [super init])) {
    return nil;
  }

  self->tree = _CoreFoundationRedBlackTreeInitialize(
    sizeof(_CoreFoundationDictionaryEntry),
    FoundationCoreFoundationMutableDictionaryCompare
  );

  return self;
}

- (void)dealloc {
  _CoreFoundationRedBlackTreeDeinitialize(self->tree);
}

- (CInteger)count {
  return CoreFoundationMutableDictionaryGetCount(
    (bridging CoreFoundationAnyObject*)self
  );
}

- (ObjectiveCAnyObject)objectForKeyedSubscript:(ObjectiveCAnyObject)key {
  return (bridging ObjectiveCAnyObject)CoreFoundationMutableDictionaryGetValue(
    (bridging CoreFoundationAnyObject*)self,
    (bridging CoreFoundationAnyObject*)[key copy]
  );
}

- (void)setObject:(ObjectiveCAnyObject)object
forKeyedSubscript:(ObjectiveCAnyObject)key {
  CoreFoundationMutableDictionarySetValue(
    (bridging CoreFoundationAnyObject*)self,
    (bridging CoreFoundationAnyObject*)[key copy],
    (bridging CoreFoundationAnyObject*)object
  );
}

- (void)removeObjectForKey:(ObjectiveCAnyObject)key {
  CDebuggingHaltWithMessage("*** TODO ***");
}

@end

/*
 * Exposed to CoreFoundation to ensure correct initialization of the Objective-C
 * instance.
 */
CoreFoundationAnyObject* FoundationCoreFoundationMutableDictionaryInitialize() {
  let dictionary = [[_FoundationCoreFoundationMutableDictionary alloc] init];

  return (retainedbridging CoreFoundationAnyObject*)dictionary;
}

C_ASSUME_NONNULL_END
