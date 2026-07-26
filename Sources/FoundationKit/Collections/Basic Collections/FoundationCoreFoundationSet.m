/*
 *  FoundationCoreFoundationSet.m
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

#import "FoundationCoreFoundationSet.h"

#import "../../Sorting/FoundationComparable.h"
#import "../../Sorting/FoundationComparisonResult.h"

#import <CoreFoundationKit/CoreFoundationKit.h>
#import <ObjectiveCKit/ObjectiveCKit.h>

C_ASSUME_NONNULL_BEGIN

FoundationComparisonResult FoundationCoreFoundationSetCompare(const void* lhs, const void* rhs) {
  let object1 = (bridging ObjectiveCAnyObject<FoundationComparable>)*(const void**)lhs;
  let object2 = (bridging ObjectiveCAnyObject<FoundationComparable>)*(const void**)rhs;

  return [object1 compare:object2];
}

@interface _FoundationCoreFoundationSet () {
  _CoreFoundationRedBlackTree* _tree;
  CInteger _mutationCount;
  CBoolean _isMutable;
}

@end

@implementation _FoundationCoreFoundationSet

- (instancetype)initWithObjects:(ObjectiveCAnyObject nillable const[])objects count:(CInteger)count isMutable:(CBoolean)isMutable {
  if (!(self = [super init])) {
    return nil;
  }

  self->_tree = _CoreFoundationRedBlackTreeInitialize(sizeof(void*), FoundationCoreFoundationSetCompare);
  self->_mutationCount = 0l;
  self->_isMutable = isMutable;

  for (let i = 0; i < count; i += 1) {
    let key = (bridging CoreFoundationAnyObject*)([objects[i] copy]);

    _CoreFoundationRedBlackTreeInsertKey(self->_tree, &key);
  }

  return self;
}

- (void)dealloc {
  _CoreFoundationRedBlackTreeDeinitialize(self->_tree);
}

- (void)insertObject:(ObjectiveCAnyObject<ObjectiveCCopyable, FoundationComparable>)object {
  CoreFoundationMutableSetInsertObject((bridging CoreFoundationAnyObject*)self, (bridging CoreFoundationAnyObject*)[object copy]);
}

- (CBoolean)containsObject:(ObjectiveCAnyObject<ObjectiveCEquatable>)object {
  return CoreFoundationMutableSetContainsObject((bridging CoreFoundationAnyObject*)self, (bridging CoreFoundationAnyObject*)object);
}

@end

/* Exposed to CoreFoundation to ensure correct initialization of the Objective-C instance. */
CoreFoundationAnyObject* FoundationCoreFoundationSetInitialize(ObjectiveCAnyObject nonnil const objects[nonnil], CInteger count, CBoolean isMutable) {
  return (retainedbridging CoreFoundationAnyObject*)[[_FoundationCoreFoundationSet alloc] initWithObjects:objects count:count isMutable:isMutable];
}

C_ASSUME_NONNULL_END
