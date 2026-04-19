////
////  UUIDTests.swift
////  foundation-framework
////
////  Created by Fang Ling on 2026/3/28.
////
////  Licensed under the Apache License, Version 2.0 (the "License");
////  you may not use this file except in compliance with the License.
////  You may obtain a copy of the License at
////
////    http://www.apache.org/licenses/LICENSE-2.0
////
////  Unless required by applicable law or agreed to in writing, software
////  distributed under the License is distributed on an "AS IS" BASIS,
////  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
////  See the License for the specific language governing permissions and
////  limitations under the License.
////
//
//@testable import Foundation
//
//import Testing
//
//@Suite("UUIDTests")
//struct UUIDTests {
//  @Test("Initialize")
//  func testInitializing() {
//    let uuid = UUID()
//
//    let version = (uuid._uuid.1 >> 12) & 0xF
//    let variant = (uuid._uuid.0 >> 62) & 0b11
//    #expect(version == 0b0100)
//    #expect(variant == 0b10)
//  }
//
//  @Test("Get UUID string")
//  func testGettingUUIDString() {
//    let uuid = UUID()
//
//    let uuidString = uuid.uuidString
//    #expect(uuidString.charactersView[14] == 52)
//    #expect([56, 57, 65, 66].contains(uuidString.charactersView[19]))
//  }
//}
