//
//  Geometry.swift
//  foundation-framework
//
//  Created by Fang Ling on 2026/3/29.
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

import FoundationFrameworkEssentials

extension Rectangle {
  public init(
    x: FloatingPoint64,
    y: FloatingPoint64,
    width: FloatingPoint64,
    height: FloatingPoint64
  ) {
    self.init(
      origin: .init(x: x, y: y),
      size: .init(width: width, height: height)
    )
  }
}

extension Rectangle {
  public static let zero = Rectangle(x: 0, y: 0, width: 0, height: 0)
}

extension Point {
  public static let zero = Point(x: 0, y: 0)
}

extension Point: @retroactive Equatable {
  public static func == (lhs: Point, rhs: Point) -> BinaryLogic {
    lhs.x == rhs.x && lhs.y == rhs.y
  }
}

extension Size: @retroactive Equatable {
  public static func == (lhs: Size, rhs: Size) -> BinaryLogic {
    lhs.width == rhs.width && lhs.height == rhs.height
  }
}

extension Rectangle: @retroactive Equatable {
  public static func == (lhs: Rectangle, rhs: Rectangle) -> BinaryLogic {
    lhs.origin == rhs.origin && lhs.size == rhs.size
  }
}
