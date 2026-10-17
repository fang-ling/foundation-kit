//===----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------===//
//
//  FoundationIndexPathTests.swift
//  foundation-kit
//
//  Created by Fang Ling on 2026/10/17.
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

import FoundationKit

import Testing

@Suite("FoundationIndexPathTests")
struct FoundationIndexPathTests {
  @Test func testTwoIndexes() {
    let indexPath = FoundationIndexPath(indexes: [19358, 19342])
    #expect(indexPath[0] == 19358)
    #expect(indexPath[1] == 19342)
  }

  @Test func testManyIndexes() {
    let indexPath = FoundationIndexPath(indexes: [12361, 12333, 19348, 19324, 0])
    #expect(indexPath[0] == 12361)
    #expect(indexPath[1] == 12333)
    #expect(indexPath[2] == 19348)
    #expect(indexPath[3] == 19324)
    #expect(indexPath[4] == 0)
  }
}
