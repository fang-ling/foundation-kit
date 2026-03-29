//
//  Geometry.h
//  foundation-framework
//
//  Created by Fang Ling on 2026/3/29.
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

#ifndef Geometry_h
#define Geometry_h

#include "../Numerics/FloatingPoint64.h"

struct Foundation_Point {
  Foundation_FloatingPoint64 x;
  Foundation_FloatingPoint64 y;
}
SWIFT_NAME(Point);

struct Foundation_Size {
  Foundation_FloatingPoint64 width;
  Foundation_FloatingPoint64 height;
}
SWIFT_NAME(Size);

struct Foundation_Rectangle {
  struct Foundation_Point origin;
  struct Foundation_Size size;
}
SWIFT_NAME(Rectangle);

#endif /* Geometry_h */
