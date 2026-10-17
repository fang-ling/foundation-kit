//===----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------===//
//
//  FoundationIndexPath.swift
//  foundation-kit
//
//  Created by Fang Ling on 2026/7/18.
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

/// A list of indexes that together represent the path to a specific location in a tree of nested arrays.
///
/// Each index in an index path represents the index into an array of children from one node in the tree to another, deeper, node.
///
/// ## Topics
///
/// ### Creating Index Paths
///
/// - ``init()``
/// - ``init(indexes:)``
public struct FoundationIndexPath {
  private var indexes: [CInteger]

  /// Creates an empty index path.
  public init() {
    self.indexes = []
  }

  /// Creates an index path from an array of elements.
  ///
  /// - Parameter indexes: Array of indexes to make up the index path.
  public init(indexes: [CInteger]) {
    self.indexes = indexes
  }

  /// Accesses one of the index path's nodes.
  ///
  /// - Parameter index: Index value of the desired node. Node numbering starts at zero.
  public subscript(index: CInteger) -> CInteger {
    get {
      return self.indexes[index]
    }
  }
}

#else

import Foundation

/// A list of indexes that together represent the path to a specific location in a tree of nested arrays.
public typealias FoundationIndexPath = Foundation::IndexPath

#endif
