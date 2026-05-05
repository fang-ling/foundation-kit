// swift-tools-version: 6.2

//
//  Package.swift
//  foundation-kit
//
//  Created by Fang Ling on 2025/12/7.
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

import PackageDescription

let isDevelopment = false

let dependencies = [
  ("c-kit", "main"),
  ("core-foundation-kit", "main"),
  ("objective-c-kit", "main")
]

let package = Package(
  name: "foundation-kit",
  products: [
    .library(name: "FoundationKit", targets: ["FoundationKit"])
  ],
  dependencies: dependencies.map({
    if isDevelopment {
      return .package(path: "../\($0.0)")
    } else {
      return .package(url: "https://github.com/fang-ling/\($0.0)", branch: $0.1)
    }
  }),
  targets: [
    .target(
      name: "FoundationKit",
      dependencies: [
        .product(name: "CKit", package: "c-kit"),
        .product(name: "CoreFoundationKit", package: "core-foundation-kit"),
        .product(name: "ObjectiveCKit", package: "objective-c-kit")
      ],
      publicHeadersPath: "Includes"
    ),
    .testTarget(
      name: "FoundationKitTests",
      dependencies: [
        "FoundationKit",
        .product(name: "CoreFoundationKit", package: "core-foundation-kit")
      ]
    )
  ]
)
