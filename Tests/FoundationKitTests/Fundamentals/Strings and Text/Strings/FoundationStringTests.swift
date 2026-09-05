//===----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------===//
//
//  FoundationStringTests.swift
//  foundation-kit
//
//  Created by Fang Ling on 2026/5/1.
//
//  This source file is part of the FoundationKit open source project
//
//  Copyright (c) 2025-2026 Fang Ling <fangling@fangl.ing>
//  Licensed under Apache License v2.0
//
//  See LICENSE for license information
//
//  SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------===//

import CKit
import FoundationKit

import Testing

@Suite("FoundationStringTests")
struct FoundationStringTests {
  let strings = ["", "Hello, world!", "こんにちは!", "Heil!", "Γεια σου, κόσμε!", "你好，世界！", "👋, 🌍!"]

  @Test func testCount() {
    for input in strings {
      #expect(FoundationString(stringLiteral: input).utf8.count == input.utf8.count)
    }
  }

  @Test func testGettingCString() {
    for input in strings {
      let string = FoundationString(stringLiteral: input)
      #expect(strcmp(string.utf8.cString, input) == 0)
    }
  }

  @Test func testSubscript() {
//     for input in strings {
//       let string = FoundationString(stringLiteral: input)

//       var index = 0
//       for scalar in input.unicodeScalars {
//         #expect(string[index] == scalar.value)

//         index += 1
//       }
//     }
  }
}
