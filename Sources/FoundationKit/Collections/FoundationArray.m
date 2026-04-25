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

//#import <stdarg.h>

//#import "FoundationArray+Private.h"

C_ASSUME_NONNULL_BEGIN

//@implementation FoundationArray

//- (instancetype)init {
//  if (!(self = [super init])) {
//    return nil;
//  }
//
//  self.count = 0;
//  self.capacity = 0;
//  self->_objects = (owning ObjectiveCAnyObject*)malloc(0);
//
//  return self;
//}

//- (instancetype)initWithObjects:(ObjectiveCAnyObject)firstObject, ... {
//  if (!(self = [super init])) {
//    return nil;
//  }
//
//  let count = 0ull;
//  if (firstObject) {
//    count = 1;
//
//    va_list arguments;
//    va_start(arguments, firstObject);
//    while (va_arg(arguments, ObjectiveCAnyObject) != nil) {
//      count += 1;
//    }
//    va_end(arguments);
//  }
//
//  self.count = count;
//  self.capacity = count;
//  self->_objects = (owning ObjectiveCAnyObject*)malloc(
//    sizeof(ObjectiveCAnyObject) * count
//  );
//
//  if (count > 0) {
//    self->_objects[0] = firstObject;
//
//    va_list arguments;
//    va_start(arguments, firstObject);
//    for (let i = 1; i < count; i += 1) {
//      self->_objects[i] = va_arg(arguments, ObjectiveCAnyObject);
//    }
//    va_end(arguments);
//  }
//
//  return self;
//}

//- (void)dealloc {
//  for (let i = 0; i < self.count; i += 1) {
//    self->_objects[i] = nil;
//  }
//
//  free(self->_objects);
//}

//- (ObjectiveCAnyObject)objectAtIndex:(CUnsignedInteger64)index {
//  return self->_objects[index];
//}

//@end

C_ASSUME_NONNULL_END
