//
//  FloatingPoint64.swift
//  foundation-framework
//
//  Created by Fang Ling on 2026/1/1.
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

import FoundationFrameworkEssentials

/* MARK: - Numeric Constants */
//extension FloatingPoint64 {
//  public static var π: Self {
//    Foundation_FloatingPoint64_Pi
//  }
//}

/* MARK: - Common Floating-Point Operations */
extension FloatingPoint64 {
  public func takeSquareRoot() -> Self {
    return Foundation_FloatingPoint64_TakeSquareRoot(self)
  }

  public func checkEquality(to other: Self, tolerance: Self) -> BinaryLogic {
    return Foundation_FloatingPoint64_CheckEquality(self, other, tolerance)
  }

  public func makeAbsolute() -> Self {
    return Foundation_FloatingPoint64_MakeAbsolute(self)
  }
}

/* MARK: - Elementary Functions */
 extension FloatingPoint64 {
  public func calculateCosine() -> Self {
    return Foundation_FloatingPoint64_CalculateCosine(self)
  }

  public func calculateSine() -> Self {
    return Foundation_FloatingPoint64_CalculateSine(self)
  }
}
