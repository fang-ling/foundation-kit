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
  CoreFoundationAnyObject** _objects;
  CInteger _count;
  CInteger _capacity;
}

@end

@implementation _FoundationCoreFoundationArray

- (instancetype)init {
  if (!(self = [super init])) {
    return nil;
  }

  self->_objects = CMemoryAllocate(0);
  self->_count = 0;
  self->_capacity = 0;

  return self;
}

- (void)dealloc {
  for (let i = 0; i < self->_count; i += 1) {
    ObjectiveCAnyObject object =
      (transferredbridging ObjectiveCAnyObject)self->_objects[i];
    object = nil;
  }
  CMemoryDeallocate(self->_objects);
}

- (CInteger)count {
  return CoreFoundationArrayGetCount((bridging CoreFoundationArray*)self);
}

- (ObjectiveCAnyObject)objectAtIndex:(CInteger)index {
  return (bridging ObjectiveCAnyObject)CoreFoundationArrayGetObjectAtIndex(
    (bridging CoreFoundationArray*)self,
    index
  );
}

@end

/*
 * Exposed to CoreFoundation to ensure correct initialization of the Objective-C
 * instance.
 */
CoreFoundationAnyObject* FoundationCoreFoundationArrayInitialize() {
  let array = [[_FoundationCoreFoundationArray alloc] init];

  return (retainedbridging CoreFoundationAnyObject*)array;
}

C_ASSUME_NONNULL_END
