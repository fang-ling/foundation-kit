//===----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------===//
//
//  FoundationUUID.swift
//  foundation-kit
//
//  Created by Fang Ling on 2026/9/25.
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

import CKit
import SwiftFramework

/// A universally unique value to identify types, interfaces, and other items.
///
/// ## Topics
///
/// ### Creating UUIDs
///
/// - ``init()``
/// - ``random(using:)``
///
/// ### Getting UUID Values
///
/// - ``uuidString``
public struct FoundationUUID {
  private static let _uppercasedHexTable: [CUnsignedInteger8] = [
    CUnsignedInteger8(ascii: "0"),
    CUnsignedInteger8(ascii: "1"),
    CUnsignedInteger8(ascii: "2"),
    CUnsignedInteger8(ascii: "3"),
    CUnsignedInteger8(ascii: "4"),
    CUnsignedInteger8(ascii: "5"),
    CUnsignedInteger8(ascii: "6"),
    CUnsignedInteger8(ascii: "7"),
    CUnsignedInteger8(ascii: "8"),
    CUnsignedInteger8(ascii: "9"),
    CUnsignedInteger8(ascii: "A"),
    CUnsignedInteger8(ascii: "B"),
    CUnsignedInteger8(ascii: "C"),
    CUnsignedInteger8(ascii: "D"),
    CUnsignedInteger8(ascii: "E"),
    CUnsignedInteger8(ascii: "F")
  ]

  internal var _storage: SwiftUnsignedInteger128

  /// A string created from the UUID, such as "E621E1F8-C36C-495A-93FC-0C247A3E6E5F".
  public var uuidString: SwiftString {
    return SwiftString(unsafeUninitializedCapacity: 36) { buffer in
      return self._unparse(into: buffer, hexTable: FoundationUUID._uppercasedHexTable)
    }
  }

  /// Generates a new random UUID.
  ///
  /// - Parameter generator: The random number generator to use when creating the new random value.
  ///
  /// - Returns: A random UUID.
  public static func random(using generator: inout some SwiftRandomNumberGenerator) -> FoundationUUID {
    var bits = UInt128.random(in: .min ... .max, using: &generator)

    // Clear bits 48 through 51 and 64 through 65.
    bits &= 0b11111111_11111111_11111111_11111111_11111111_11111111_00001111_11111111_00111111_11111111_11111111_11111111_11111111_11111111_11111111_11111111
    // Set the version to 4 (0100 in binary) and the variant to '10' (RFC9562 variant).
    bits |= 0b00000000_00000000_00000000_00000000_00000000_00000000_01000000_00000000_10000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000

    return FoundationUUID(storage: bits)
  }

  /// Creates a UUID with RFC 4122 version 4 random bytes.
  public init() {
    var generator = SwiftSystemRandomNumberGenerator()
    self = FoundationUUID.random(using: &generator)
  }

  private init(storage: SwiftUnsignedInteger128) {
    self._storage = storage
  }

  private func _unparse(into buffer: SwiftUnsafeMutableBufferPointer<CUnsignedInteger8>, hexTable: [CUnsignedInteger8]) -> CInteger {
    var bufferIndex = 0
    for index in 0 ..< 16 {
      // Insert '-' after bytes 4, 6, 8, 10.
      switch index {
      case 4, 6, 8, 10:
        buffer[bufferIndex] = CUnsignedInteger8(ascii: "-")
        bufferIndex &+= 1
      default:
        break
      }

      // Byte 0 is the most significant byte of _storage.
      let byte = (self._storage &>> ((15 &- index) &* 8)) & 0xFF
      buffer[bufferIndex] = hexTable[CInteger(byte &>> 4)]
      buffer[bufferIndex &+ 1] = hexTable[CInteger(byte & 0xF)]
      bufferIndex &+= 2
    }

    return 36
  }
}

#else

import Foundation

/// A universally unique value to identify types, interfaces, and other items.
public typealias FoundationUUID = Foundation::UUID

#endif
