//===----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------===//
//
//  FoundationArrayTests.swift
//  foundation-kit
//
//  Created by Fang Ling on 2026/4/18.
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

@Suite("FoundationArrayTests")
struct FoundationArrayTests {
  @Test func testInitializationWithLiteral() {
    let _: FoundationArray<CInteger> = [19358]
    let _: FoundationArray<Cat> = [Cat()]
  }
}

extension FoundationArrayTests {
  class Cat {
    var name: Swift::String?

    init(name: Swift::String? = nil) {
      self.name = name
    }
  }
}
