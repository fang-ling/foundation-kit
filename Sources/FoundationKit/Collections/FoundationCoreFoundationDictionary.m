/*
 *  FoundationCoreFoundationDictionary.m
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

#import "FoundationCoreFoundationDictionary.h"

#import "FoundationEnumerable.h"
#import "../Sorting/FoundationComparisonResult.h"
#import "../Sorting/FoundationComparable.h"

#import <CoreFoundationKit/CoreFoundationKit.h>
#import <ObjectiveCKit/ObjectiveCKit.h>

C_ASSUME_NONNULL_BEGIN

FoundationComparisonResult FoundationCoreFoundationDictionaryCompare(
  const void* _lhs,
  const void* _rhs
) {
  let lhs = (_CoreFoundationDictionaryEntry*)_lhs;
  let rhs = (_CoreFoundationDictionaryEntry*)_rhs;

  let object1 = (bridging ObjectiveCAnyObject<FoundationComparable>)lhs->key;
  let object2 = (bridging ObjectiveCAnyObject<FoundationComparable>)rhs->key;

  return [object1 compare:object2];
}

@interface _FoundationCoreFoundationDictionary () {
  _CoreFoundationRedBlackTree* tree;
  CInteger mutationCount;
  CBoolean isMutable;
}

@end

@implementation _FoundationCoreFoundationDictionary

- (instancetype)initWithObjects:(nillable ObjectiveCAnyObject const[])objects
                        forKeys:(nillable ObjectiveCAnyObject const[])keys
                          count:(CInteger)count
                      isMutable:(CBoolean)mutable {
  if (!(self = [super init])) {
    return nil;
  }

  self->tree = _CoreFoundationRedBlackTreeInitialize(
    sizeof(_CoreFoundationDictionaryEntry),
    FoundationCoreFoundationDictionaryCompare
  );
  self->mutationCount = 0l;
  self->isMutable = mutable;

  for (let i = 0; i < count; i += 1) {
    let entry = (_CoreFoundationDictionaryEntry){
      (bridging CoreFoundationAnyObject*)([keys[i] copy]),
      (bridging CoreFoundationAnyObject*)objects[i]
    };

    _CoreFoundationRedBlackTreeInsertKey(self->tree, &entry);
  }

  return self;
}

- (void)dealloc {
  _CoreFoundationRedBlackTreeDeinitialize(self->tree);
}

- (CInteger)count {
  return CoreFoundationDictionaryGetCount(
    (bridging CoreFoundationAnyObject*)self
  );
}

- (ObjectiveCAnyObject)objectForKeyedSubscript:(ObjectiveCAnyObject)key {
  return (bridging ObjectiveCAnyObject)CoreFoundationDictionaryGetValue(
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
  CoreFoundationMutableDictionaryRemoveValue(
    (bridging CoreFoundationAnyObject*)self,
    (bridging CoreFoundationAnyObject*)[key copy]
  );
}

- (CInteger)countByEnumeratingWithState:(FoundationEnumerationState *)state
                                objects:(_FoundationEnumerationBuffer)buffer
                                  count:(CInteger)count {
  if (state->state == 0) {
    state->mutationsBuffer = &self->mutationCount;
    state->extra[0] = 0l;
    state->state = 1;
  }

  let entry = (_CoreFoundationDictionaryEntry){ 0 };
  _CoreFoundationDictionaryGetEntryAtIndex(
    (bridging CoreFoundationDictionary*)(self),
    state->extra[0],
    &entry
  );

  state->itemsBuffer = buffer;

  let objectCount = 0l;
  while (state->extra[0] < self.count && objectCount < count) {
    let entry = (_CoreFoundationDictionaryEntry){ 0 };
    _CoreFoundationDictionaryGetEntryAtIndex(
      (bridging CoreFoundationDictionary*)(self),
      state->extra[0],
      &entry
    );

    if (!entry.key) {
      break;
    }

    *buffer = (bridging ObjectiveCAnyObject)entry.key;
    buffer += 1;

    state->extra[0] += 1;
    objectCount += 1;
  }

  return objectCount;
}

@end

/*
 * Exposed to CoreFoundation to ensure correct initialization of the Objective-C
 * instance.
 */
CoreFoundationAnyObject* FoundationCoreFoundationDictionaryInitialize(
  ObjectiveCAnyObject nonnil const objects[nonnil],
  ObjectiveCAnyObject nonnil const keys[nonnil],
  CInteger count,
  CBoolean isMutable
) {
  let dictionary =
    [[_FoundationCoreFoundationDictionary alloc] initWithObjects:objects
                                                         forKeys:keys
                                                           count:count
                                                       isMutable:isMutable];

  return (retainedbridging CoreFoundationAnyObject*)dictionary;
}

C_ASSUME_NONNULL_END
