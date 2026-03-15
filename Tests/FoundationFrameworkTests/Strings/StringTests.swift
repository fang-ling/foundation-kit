//
//  StringTests.swift
//  foundation-framework
//
//  Created by Fang Ling on 2026/3/7.
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

@testable import FoundationFramework

import Foundation
import Testing

@Suite("StringTests")
struct StringTests {
  let inputStrings = ["", "Hello, world!", "こんにち", "🌍", "🐮 say ", "ω"]

  @Test("Initialize with c string")
  func testInitializeWithCString() {
    for inputString in inputStrings {
      let string = String(cString: inputString)!
      let unicodeScalars = inputString.unicodeScalars.map {
        Integer32($0.value)
      }

      #expect(string._count == unicodeScalars.count)

      for i in 0 ..< Int(string._count) {
        #expect(string._characters[i] == unicodeScalars[i])
      }
    }
  }

  @Test("Equable")
  func testEquable() {
    for i in inputStrings.indices {
      for j in inputStrings.indices {
        let string1 = String(cString: inputStrings[i])
        let string2 = String(cString: inputStrings[j])

        #expect((string1 == string2) == (i == j))
      }
    }
  }
}
