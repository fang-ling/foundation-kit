//===----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------===//
//
//  FoundationString+Storage.swift
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

import CoreFoundationKit

extension FoundationString {
  @propertyWrapper
  internal struct _Storage {
    private var box: _Box

    internal init(wrappedValue: CoreFoundationString) {
      self.box = _Box(content: wrappedValue)
    }

    internal var wrappedValue: CoreFoundationString {
      return self.box.content
    }

    internal var projectedValue: CoreFoundationString {
      mutating get {
        if !Swift::isKnownUniquelyReferenced(&self.box) {
          // self.box = _Box(content: self.box.content.copy())
          Swift::fatalError("Not implemented.")
        }

        return wrappedValue
      }

      set {
        self.box.content = newValue
      }
    }
  }
}

extension FoundationString._Storage {
  private final class _Box {
    internal var content: CoreFoundationString

    internal init(content: CoreFoundationString) {
      self.content = content
    }
  }
}
