//===----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------===//
//
//  FoundationUUIDTests.swift
//  foundation-kit
//
//  Created by Fang Ling on 2026/10/7.
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

#if !os(iOS)

import Testing

@testable import FoundationKit

@Suite("FoundationUUIDTests")
struct FoundationUUIDTests {
  @Test func testUUIDString() {
    var uuid = FoundationUUID()
    uuid._storage = 201841313305346694819280618311426643856

    #expect(uuid.uuidString == "97D93912-0038-410B-95FF-28965EBA1790")
  }
}

#endif
