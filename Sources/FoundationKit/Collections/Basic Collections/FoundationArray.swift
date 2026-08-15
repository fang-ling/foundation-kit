//===----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------===//
//
//  FoundationArray.swift
//  foundation-kit
//
//  Created by Fang Ling on 2026/4/19.
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

/// An ordered, random-access collection.
///
/// Arrays are one of the most commonly used data types in an app. You use arrays to organize your app's data. Specifically, you use the Array type to hold elements of a single type, the array's
/// `Element` type. An array can store any kind of elements—from integers to strings to classes.
///
/// Swift makes it easy to create arrays in your code using an array literal: simply surround a comma-separated list of values with square brackets. Without any other information, Swift creates an
/// array that includes the specified values, automatically inferring the array's `Element` type. For example:
///
///    ```swift
///    // An array of 'CInteger' elements
///    let oddNumbers: FoundationArray = [1, 3, 5, 7, 9, 11, 13, 15]
///
///    // An array of 'Swift::String' elements
///    let streets: FoundationArray = ["Albemarle", "Brandywine", "Chesapeake"]
///    ```
///
/// You can create an empty array by specifying the `Element` type of your array in the declaration. For example:
///
///    ```swift
///    var emptyFloatingPoints: FoundationArray<CFloatingPoint> = []
///    ```
///
/// If you need an array that is preinitialized with a fixed number of default values, use the ``FoundationArray(repeating:count:)`` initializer.
///
///    ```swift
///    let digitCounts = FoundationArray(repeating: 0, count: 10)
///    print(digitCounts)
///    // Prints "[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]"
///    ```
///
/// ### Accessing Array Values
///
/// When you need to perform an operation on all of an array's elements, use a `for-in` loop to iterate through the array's contents.
///
///    ```swift
///    for street in streets {
///      print("I don't live on \(street).")
///    }
///    // Prints "I don't live on Albemarle."
///    // Prints "I don't live on Brandywine."
///    // Prints "I don't live on Chesapeake."
///    ```
/// Use the ``isEmpty`` property to check quickly whether an array has any elements, or use the ``count`` property to find the number of elements in the array.
///
///    ```swift
///    if oddNumbers.isEmpty {
///      print("I don't know any odd numbers.")
///    } else {
///      print("I know \(oddNumbers.count) odd numbers.")
///    }
///    // Prints "I know 8 odd numbers."
///    ```
/// Use the ``first`` and ``last`` properties for safe access to the value of the array's first and last elements. If the array is empty, these properties are `nil`.
///
///    ```swift
///    if let firstElement = oddNumbers.first, let lastElement = oddNumbers.last {
///      print(firstElement, lastElement, separator: ", ")
///    }
///    // Prints "1, 15"
///
///    print(emptyFloatingPoints.first, emptyFloatingPoints.last, separator: ", ")
///    // Prints "nil, nil"
///    ```
///
/// You can access individual array elements through a subscript. The first element of a nonempty array is always at index zero. You can subscript an array with any integer from zero up to, but not
/// including, the count of the array. Using a negative number or an index equal to or greater than count triggers a runtime error. For example:
///
///    ```swift
///    print(oddNumbers[0], oddNumbers[3], separator: ", ")
///    // Prints "1, 7"
///
///    print(emptyFloatingPoints[0])
///    // Triggers runtime error: Index out of range
///    ```
///
/// ### Adding and Removing Elements
///
/// Suppose you need to store a list of the names of students that are signed up for a class you're teaching. During the registration period, you need to add and remove names as students add and drop
/// the class.
///
///    ```swift
///    var students = ["Ben", "Ivy", "Jordell"]
///    ```
///
/// To add single elements to the end of an array, use the ``append(_:)`` method. Add multiple elements at the same time by passing another array or a sequence of any kind to the
/// ``append(contentsOf:)`` method.
///
///    ```swift
///    students.append("Maxime")
///    students.append(contentsOf: ["Shakia", "William"])
///    // ["Ben", "Ivy", "Jordell", "Maxime", "Shakia", "William"]
///    ```
/// You can add new elements in the middle of an array by using the ``insert(_:at:)`` method for single elements and by using ``insert(contentsOf:at:)`` to insert multiple elements from another
/// collection or array literal. The elements at that index and later indices are shifted back to make room.
///
///    ```swift
///    students.insert("Liam", at: 3)
///    // ["Ben", "Ivy", "Jordell", "Liam", "Maxime", "Shakia", "William"]
///    ```
///
/// To remove elements from an array, use the ``remove(at:)``, ``removeSubrange(_:)``, and ``removeLast()`` methods.
///
///    ```swift
///    // Ben's family is moving to another state
///    students.remove(at: 0)
///    // ["Ivy", "Jordell", "Liam", "Maxime", "Shakia", "William"]
///
///    // William is signing up for a different class
///    students.removeLast()/
///    // ["Ivy", "Jordell", "Liam", "Maxime", "Shakia"]
///    ```
///
/// You can replace an existing element with a new value by assigning the new value to the subscript.
///
///    ```swift
///    if let i = students.firstIndex(of: "Maxime") {
///      students[i] = "Max"
///    }
///    // ["Ivy", "Jordell", "Liam", "Max", "Shakia"]
///    ```
///
/// ### Growing the Size of an Array
///
/// Every array reserves a specific amount of memory to hold its contents. When you add elements to an array and that array begins to exceed its reserved capacity, the array allocates a larger region
/// of memory and copies its elements into the new storage. The new storage is a multiple of the old storage's size. This exponential growth strategy means that appending an element happens in
/// constant time, averaging the performance of many append operations. Append operations that trigger reallocation have a performance cost, but they occur less and less often as the array grows
/// larger.
///
/// If you know approximately how many elements you will need to store, use the ``reserveCapacity(_:)`` method before appending to the array to avoid intermediate reallocations. Use the ``capacity``
/// and ``count`` properties to determine how many more elements the array can store without allocating larger storage.
///
/// ### Modifying Copies of Arrays
///
/// Each array has an independent value that includes the values of all of its elements. For simple types such as integers and other structures, this means that when you change a value in one array,
/// the value of that element does not change in any copies of the array. For example:
///
///    ```swift
///    var numbers = [1, 2, 3, 4, 5]
///    var numbersCopy = numbers
///    numbers[0] = 100
///    print(numbers)
///    // Prints "[100, 2, 3, 4, 5]"
///    print(numbersCopy)
///    // Prints "[1, 2, 3, 4, 5]"
///    ```
///
/// If the elements in an array are instances of a class, the semantics are the same, though they might appear different at first. In this case, the values stored in the array are references to
/// objects that live outside the array. If you change a reference to an object in one array, only that array has a reference to the new object. However, if two arrays contain references to the same
/// object, you can observe changes to that object's properties from both arrays. For example:
///
///    ```swift
///    // An integer type with reference semantics
///    class IntegerReference {
///      var value = 10
///    }
///    var firstIntegers = [IntegerReference(), IntegerReference()]
///    var secondIntegers = firstIntegers
///
///    // Modifications to an instance are visible from either array
///    firstIntegers[0].value = 100
///    print(secondIntegers[0].value)
///    // Prints "100"
///
///    // Replacements, additions, and removals are still visible
///    // only in the modified array
///    firstIntegers[0] = IntegerReference()
///    print(firstIntegers[0].value)
///    // Prints "10"
///    print(secondIntegers[0].value)
///    // Prints "100"
///    ```
///
/// Arrays, like all variable-size collections in the FoundationKit, use copy-on-write optimization. Multiple copies of an array share the same storage until you modify one of the copies. When that
/// happens, the array being modified replaces its storage with a uniquely owned copy of itself, which is then modified in place. Optimizations are sometimes applied that can reduce the amount of
/// copying.
///
/// This means that if an array is sharing storage with other copies, the first mutating operation on that array incurs the cost of copying the array. An array that is the sole owner of its storage
/// can perform mutating operations in place.
///
/// In the example below, a numbers array is created along with two copies that share the same storage. When the original numbers array is modified, it makes a unique copy of its storage before making
/// the modification. Further modifications to numbers are made in place, while the two copies continue to share the original storage.
///
///    ```swift
///    var numbers = [1, 2, 3, 4, 5]
///    var firstCopy = numbers
///    var secondCopy = numbers
///
///    // The storage for 'numbers' is copied here
///    numbers[0] = 100
///    numbers[1] = 200
///    numbers[2] = 300
///    // 'numbers' is [100, 200, 300, 4, 5]
///    // 'firstCopy' and 'secondCopy' are [1, 2, 3, 4, 5]
///    ```
///
/// ## Topics
///
/// ### Infrequently Used Functionality
///
/// - ``init(arrayLiteral:)``
public struct FoundationArray<Element> {
  private let array: CoreFoundationArray

  private init(elements: [Element]) {
    let objects = elements.map { $0 as AnyObject }
    let unretainedObjects = objects.map { Unmanaged.passUnretained($0).toOpaque() }

    array = unretainedObjects.withUnsafeBufferPointer { CoreFoundationArray(objects: $0.baseAddress, count: elements.count) }
  }
}

extension FoundationArray: Swift::ExpressibleByArrayLiteral {
  /// Creates an array from the given array literal.
  ///
  /// Do not call this initializer directly. It is used by the compiler when you use an array literal. Instead, create a new array by using an array literal as its value. To do this, enclose a
  /// comma-separated list of values in square brackets.
  ///
  /// Here, an array of strings is created from an array literal holding only strings.
  ///
  ///    ```swift
  ///    let ingredients = ["cocoa beans", "sugar", "cocoa butter", "salt"]
  ///    ```
  ///
  /// - Parameter elements: A variadic list of elements of the new array.
  public init(arrayLiteral elements: Element...) {
    self.init(elements: elements)
  }
}
