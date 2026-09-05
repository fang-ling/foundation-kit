//===----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------===//
//
//  FoundationString+UTF8View.swift
//  foundation-kit
//
//  Created by Fang Ling on 2026/9/5.
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

extension FoundationString {
  /// A view of a string's contents as a collection of UTF-8 code units.
  ///
  /// You can access a string's view of UTF-8 code units by using its ``FoundationString/utf8`` property. A string's UTF-8 view encodes the string's Unicode scalar values as 8-bit integers.
  ///
  ///    ```swift
  ///    let flowers = "Flowers 💐"
  ///    for codeUnit in flowers.utf8 {
  ///      print(codeUint)
  ///    }
  ///    // 70
  ///    // 108
  ///    // 111
  ///    // 119
  ///    // 101
  ///    // 114
  ///    // 115
  ///    // 32
  ///    // 240
  ///    // 159
  ///    // 146
  ///    // 144
  ///    ```
  ///
  /// A string's Unicode scalar values can be up to 21 bits in length. To represent those scalar values using 8-bit integers, more than one UTF-8 code unit is often required.
  ///
  ///    ```swift
  ///    let flowerEmoji = "💐"
  ///    for unicodeScalar in flowermoji.unicodeScalars {
  ///      print(unicodeScalar, unicodeScalar.value)
  ///    }
  ///    // 💐 128144
  ///
  ///    for codeUnit in flowermoji.utf8 {
  ///      print(codeUnit)
  ///    }
  ///    // 240
  ///    // 159
  ///    // 146
  ///    // 144
  ///    ```
  ///
  /// In the encoded representation of a Unicode scalar value, each UTF-8 code unit after the first is called a continuation byte.
  ///
  /// ## Topics
  ///
  /// ### Getting a UTF8View's Length
  ///
  /// - ``count``
  public struct UTF8View {
    private var string: FoundationString

    internal init(string: FoundationString) {
      self.string = string
    }

    /// The number of UTF-8 code units in a string.
    public var count: CInteger {
      return self.string.string.count
    }
  }
}
