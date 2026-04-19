/*
 *  FoundationMutableArray.m
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

#import "FoundationMutableArray.h"

#import "FoundationArray+Private.h"

OBJECTIVE_C_ASSUME_NONNULL_BEGIN

@implementation FoundationMutableArray

- (void)appendObject:(id)object {
  if (self.capacity == 0) {
    self->_objects = (owning id*)realloc(self->_objects, sizeof(id) * 1);
    self.capacity = 1;
  }

  if (self.count == self.capacity) {
    self.capacity *= 2;
    self->_objects = (owning id*)realloc(
      self->_objects,
      sizeof(id) * self.capacity
    );
  }

  self->_objects[self.count] = object;
  self.count += 1;
}

- (void)removeLastObject {
  /* Release the last element. */
  self->_objects[self.count - 1] = nil;
  self.count -= 1;

  if (self.count > 0 && self.count <= self.capacity / 4) {
    self.capacity /= 2;
    self->_objects = (owning id*)realloc(
      self->_objects,
      sizeof(id) * self.capacity
    );
  }
}

@end

OBJECTIVE_C_ASSUME_NONNULL_END
