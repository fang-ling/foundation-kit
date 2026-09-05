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
    let _: FoundationArray = [19358]
    let _: FoundationArray = [Cat()]
  }

  @Test func testCount() {
    let array1: FoundationArray<CInteger> = []
    #expect(array1.count == 0)

    let array2: FoundationArray = [Cat(), Cat(), Cat()]
    #expect(array2.count == 3)
  }

  @Test func testSwiftSequenceProtocolConformance() {
    let input = ["Diana", "Tracy", "Alice"]
    let array: FoundationArray = ["Diana", "Tracy", "Alice"]

    var index = 0
    for element in array {
      #expect(element == input[index])

      index += 1
    }
  }

  @Test func testSwiftCollectionProtocolConformance() async {
    await #expect(processExitsWith: .failure) {
      let array: FoundationArray = []
      _ = array[1]
    }

    let input = ["Diana", "Tracy", "Alice"]
    let array: FoundationArray = ["Diana", "Tracy", "Alice"]

    for index in array.indices {
      #expect(array[index] == input[index])
    }
  }

  @Test func testSwiftMutableCollectionProtocolConformance() {
    var input = ["Diana", "Tracy", "Alice"]
    let array: FoundationArray = ["Diana", "Tracy", "Alice"]
    var copiedArray = array

    input[1] = "Clara"
    copiedArray[1] = input[1]

    for index in copiedArray.indices {
      #expect(copiedArray[index] == input[index])

      if index != 1 {
        #expect(array[index] == input[index])
      }
    }
    #expect(copiedArray[1] != array[1])
    #expect(copiedArray[1] == "Clara")
  }

  @Test func testSwiftBidirectionalCollectionProtocolConformance() {
    let array: FoundationArray = [Cat(), Cat(), Cat()]

    for index in array.indices {
      if index >= array.startIndex && index < array.endIndex {
        #expect(array.index(before: array.index(after: index)) == index)
      }

      if index > array.startIndex && index <= array.endIndex {
        #expect(array.index(after: array.index(before: index)) == index)
      }
    }
  }

  @Test func testSwiftRangeReplaceableCollectionConformance() {
    var array = FoundationArray<Cat>()

    // Pure append to an empty array.
    var cats = [Cat(name: "Alice"), Cat(name: "Tracy"), Cat(name: "Diana")]
    array.append(contentsOf: cats)

    for index in cats.indices {
      #expect(array[index].name == cats[index].name)
    }
    #expect(cats.count == array.count)

    // Insert in the middle, growing the array.
    cats.insert(contentsOf: [Cat(name: "Laura"), Cat(name: "Clara"), Cat(name: "Ruby"), Cat(name: "Eva"), Cat(name: "Sue")], at: 1)
    array.insert(contentsOf: cats[1 ... 5], at: 1)

    for index in cats.indices {
      #expect(array[index].name == cats[index].name)
    }
    #expect(cats.count == array.count)

    // Remove from the middle.
    cats.removeSubrange(3 ..< 6)
    array.removeSubrange(3 ..< 6)

    for index in cats.indices {
      #expect(array[index].name == cats[index].name)
    }
    #expect(cats.count == array.count)

    // Replace with equal count.
    cats.replaceSubrange(0 ..< 3, with: [Cat(name: "Grace"), Cat(name: "Anna"), Cat(name: "Rachel")])
    array.replaceSubrange(0 ..< 3, with: cats[0 ..< 3])

    for index in cats.indices {
      #expect(array[index].name == cats[index].name)
    }
    #expect(cats.count == array.count)

    // Remove everything.
    cats.removeAll()
    array.removeAll()
    #expect(cats.count == array.count)
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
