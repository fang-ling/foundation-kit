//
//  FoundationValueTests.swift
//  foundation-kit
//
//  Created by Fang Ling on 2026/6/13.
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

//import Testing
//
//import CoreFoundationKit
//import FoundationKit
//
//@Test("FoundationValueTests")
//func testFoundationValue() {
//  var point = (x: CFloatingPoint64(10.0), y: CFloatingPoint64(20.0))
//  var value = FoundationValue.make(
//    withBytes: &point,
//    size: CInteger(MemoryLayout.size(ofValue: point))
//  )
//  #expect(value.size == 16)
//
//  var copy = (x: CFloatingPoint64(0.0), y: CFloatingPoint64(0.0))
//  value.copy(&copy)
//  #expect(copy.x == 10.0)
//  #expect(copy.y == 20.0)
//
//  // Modifying original does not affect stored value.
//  point.x = 30.0
//  value.copy(&copy)
//  #expect(copy.x == 10.0)
//
//  // Test bridging.
//  var pair = (a: CInteger32(7), b: CInteger64(8))
//  value = Unmanaged<FoundationValue>
//    .fromOpaque(
//      UnsafeRawPointer(
//        CoreFoundationValueInitializeWithBytesAndSize(
//          &pair,
//          CInteger(MemoryLayout.size(ofValue: pair))
//        )
//      )
//    )
//    .takeRetainedValue()
//  #expect(value.size == MemoryLayout.size(ofValue: pair))
//
//  var pairCopy = (a: CInteger32(0), b: CInteger64(0))
//  value.copy(&pairCopy)
//  #expect(pairCopy.a == 7)
//  #expect(pairCopy.b == 8)
//}
