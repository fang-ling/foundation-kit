/*
 *  FoundationCoreFoundationArray.m
 *  foundation-kit
 *
 *  Created by Fang Ling on 2026/5/2.
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

#import "FoundationCoreFoundationArray.h"

#import <CoreFoundationKit/CoreFoundationKit.h>

C_ASSUME_NONNULL_BEGIN

@interface _FoundationCoreFoundationArray() {
  owning ObjectiveCAnyObject* _objects;
  CInteger _count;
  CInteger _capacity;
  CInteger _mutationCount;
  CBoolean _isMutable;
}

@end

@implementation _FoundationCoreFoundationArray

- (instancetype)initWithObjects:(nillable ObjectiveCAnyObject const[])objects
                          count:(CInteger)count
                      isMutable:(CBoolean)isMutable {
  if (!(self = [super init])) {
    return nil;
  }

  self->_objects = (owning ObjectiveCAnyObject*)CMemoryAllocate(
    count,
    sizeof(const void*)
  );
  self->_count = count;
  self->_capacity = count;
  self->_isMutable = isMutable;

  for (let i = 0l; i < count; i += 1) {
    self->_objects[i] = objects[i];
  }

  return self;
}

- (void)dealloc {
  for (let i = 0; i < self->_count; i += 1) {
    self->_objects[i] = nil;
  }
  CMemoryDeallocate(self->_objects);
}

- (CInteger)count {
  return CoreFoundationMutableArrayGetCount(
    (bridging CoreFoundationMutableArray*)self
  );
}

- (ObjectiveCAnyObject)objectAtIndexedSubscript:(CInteger)index {
  return
    (bridging ObjectiveCAnyObject)CoreFoundationMutableArrayGetObjectAtIndex(
      (bridging CoreFoundationMutableArray*)self,
      index
    );
}

- (void)appendObject:(ObjectiveCAnyObject)object {
  CoreFoundationMutableArrayAppendObject(
    (bridging CoreFoundationMutableArray*)self,
    (bridging CoreFoundationAnyObject*)object
  );
}

- (void)insertObject:(ObjectiveCAnyObject)object atIndex:(CInteger)index {
  CoreFoundationMutableArrayInsertObjectAtIndex(
    (bridging CoreFoundationMutableArray*)self,
    (bridging CoreFoundationAnyObject*)object,
    index
  );
}

- (void)removeLastObject {
  CoreFoundationMutableArrayRemoveLastObject(
    (bridging CoreFoundationMutableArray*)self
  );
}

- (void)removeObjectAtIndex:(CInteger)index {
  CoreFoundationMutableArrayRemoveObjectAtIndex(
    (bridging CoreFoundationMutableArray*)self,
    index
  );
}

- (void)removeAllObjectsWhere:(CBoolean (^)(ObjectiveCAnyObject object))
                                shouldBeRemoved {
  for (let i = self.count - 1; i >= 0; i -= 1) {
    if (shouldBeRemoved(self[i])) {
      [self removeObjectAtIndex:i];
    }
  }
}

/* MARK: - FoundationEnumerable Implementations */
- (CInteger)countByEnumeratingWithState:(FoundationEnumerationState *)state
                                objects:(_FoundationEnumerationBuffer)buffer
                                  count:(CInteger)count {
  if (state->state == 0) {
    state->mutationsBuffer = &self->_mutationCount;
    state->itemsBuffer =
      (unsafeunretained ObjectiveCAnyObject*)(void*)self->_objects;
    state->state = 1;

    return self->_count;
  }

  return 0;
}

/* MARK: - ObjectiveCCopyable Implementations */
- (ObjectiveCAnyObject)copy {
  if (self->_isMutable) {
    CDebuggingHaltWithMessage("TODO");
  } else {
    return self;
  }
}

@end

/*
 * Exposed to CoreFoundation to ensure correct initialization of the Objective-C
 * instance.
 */
CoreFoundationAnyObject* FoundationCoreFoundationArrayInitialize(
  ObjectiveCAnyObject nonnil const objects[nonnil],
  CInteger count,
  CBoolean isMutable
) {
  let array =
    [[_FoundationCoreFoundationArray alloc] initWithObjects:objects
                                                      count:count
                                                  isMutable:isMutable];

  return (retainedbridging CoreFoundationAnyObject*)array;
}

C_ASSUME_NONNULL_END
