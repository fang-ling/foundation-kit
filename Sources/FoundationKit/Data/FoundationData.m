/*
 *  FoundationData.m
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

#import "FoundationData.h"

C_ASSUME_NONNULL_BEGIN

@interface FoundationData ()

@property (nonatomic, readwrite) const void* bytes;

@property (nonatomic, readwrite) CInteger count;

@end

@implementation FoundationData

+ (instancetype)makeDataWithBytes:(const void*)bytes count:(CInteger)count {
  let data = [[FoundationData alloc] init];

  data.bytes = CMemoryAllocate(count, sizeof(CInteger8));
  CMemoryCopy((void*)data.bytes, bytes, count);
  data.count = count;

  return data;
}

@end

C_ASSUME_NONNULL_END
