//
//  FloatingPoint64.c
//  foundation-framework
//
//  Created by Fang Ling on 2025/12/27.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#include "FloatingPoint64.h"

#include <math.h>

//const Foundation_FloatingPoint64 Foundation_FloatingPoint64_Pi = M_PI;

Foundation_FloatingPoint64
Foundation_FloatingPoint64_TakeSquareRoot(Foundation_FloatingPoint64 value) {
  return sqrt(value);
}

////Foundation_FloatingPoint64
////Foundation_FloatingPoint64_FindMaximum(Foundation_FloatingPoint64 x,
////                                       Foundation_FloatingPoint64 y) {
////  return x > y ? x : y;
////}

Foundation_BinaryLogic
Foundation_FloatingPoint64_CheckEquality(Foundation_FloatingPoint64 value,
                                         Foundation_FloatingPoint64 other,
                                         Foundation_FloatingPoint64 tolerance) {
  if (value == other) {
    return true;
  }

  Foundation_FloatingPoint64 delta = value - other;

  return fabs(delta) < tolerance;
}

Foundation_FloatingPoint64
Foundation_FloatingPoint64_MakeAbsolute(Foundation_FloatingPoint64 value) {
  return fabs(value);
}

////Foundation_FloatingPoint64
////Foundation_FloatingPoint64_TakeCeiling(Foundation_FloatingPoint64 value) {
////  return ceil(value);
////}

Foundation_FloatingPoint64
Foundation_FloatingPoint64_CalculateCosine(Foundation_FloatingPoint64 value) {
  return cos(value);
}

Foundation_FloatingPoint64
Foundation_FloatingPoint64_CalculateSine(Foundation_FloatingPoint64 value) {
  return sin(value);
}
