// swift-tools-version: 6.0

//===--------------------------------------------------------------------------------------------------------------------------------------------------------------------------===//
//
//  Package.swift
//  foundation-kit
//
//  Created by Fang Ling on 2025/12/7.
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
//===--------------------------------------------------------------------------------------------------------------------------------------------------------------------------===//

import PackageDescription

let isDevelopment = false

let dependencies = [
  ("c-kit", "main"),
  ("core-foundation-kit", "main"),
  ("swift-yyjson", "main")
]

let package = Package(
  name: "foundation-kit",
  products: [
    .library(name: "FoundationKit", targets: ["FoundationKit"])
  ],
  dependencies: dependencies.map { isDevelopment ? .package(path: "../\($0.0)") : .package(url: "https://github.com/fang-ling/\($0.0)", branch: $0.1) },
  targets: [
    .target(
      name: "FoundationKit",
      dependencies: [
        .product(name: "CKit", package: "c-kit"),
        .product(name: "CYYJSON", package: "swift-yyjson"),
        .product(name: "CoreFoundationKit", package: "core-foundation-kit")
      ]
    ),
    .testTarget(
      name: "FoundationKitTests",
      dependencies: [
        "FoundationKit"
      ]
    )
  ]
)
