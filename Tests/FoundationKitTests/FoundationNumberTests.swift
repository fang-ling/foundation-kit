//
//  FoundationNumberTests.swift
//  foundation-framework
//
//  Created by Fang Ling on 2026/4/25.
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

import Testing

import CoreFoundationKit
import FoundationKit

@Test("FoundationNumberTests")
func testFoundationNumber() {
  var number = FoundationNumber.make(withUnsignedInteger64: 19358)
  #expect(number.unsignedInteger64Value == 19358)

  // Test bridging.
  var unsignedInteger64Value = CUnsignedInteger64(19342)
  number = Unmanaged<FoundationNumber>
    .fromOpaque(
      UnsafeRawPointer(
        CoreFoundationNumberInitialize(
          kCoreFoundationNumberTypeUnsignedInteger64,
          &unsignedInteger64Value
        )
      )
    )
    .takeRetainedValue()
  #expect(number.unsignedInteger64Value == 19342)

  unsignedInteger64Value = CUnsignedInteger64(12333)
  number = Unmanaged<FoundationNumber>
    .fromOpaque(
      UnsafeRawPointer(
        CoreFoundationNumberInitialize(
          kCoreFoundationNumberTypeUnsignedInteger64,
          &unsignedInteger64Value
        )
      )
    )
    .takeUnretainedValue()
  #expect(number.unsignedInteger64Value == 12333)
  CoreFoundationRelease(Unmanaged.passUnretained(number).toOpaque())
}
