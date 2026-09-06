//===----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------===//
//
//  FoundationString.swift
//  foundation-kit
//
//  Created by Fang Ling on 2026/5/1.
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

/// A Unicode string value that is a collection of characters.
///
/// A string is a series of characters, such as "FoundationKit", that forms a collection. Strings in FoundationKit are Unicode correct and locale insensitive, and are designed to be efficient. The
/// String type offers interoperability with C functions that work with strings.
///
/// You can create new strings using string literals or string interpolations. A _string literal_ is a series of characters enclosed in quotes.
///
///    ```swift
///    let greeting: FoundationString = "Welcome!"
///    ```
///
/// _String interpolations_ are string literals that evaluate any included expressions and convert the results to string form. String interpolations give you an easy way to build a string from
/// multiple pieces. Wrap each expression in a string interpolation in parentheses, prefixed by a backslash.
///
///    ```swift
///    let name: FoundationString = "Rosa"
///    let personalizedGreeting: FoundationString = "Welcome, \(name)!"
///    // personalizedGreeting == "Welcome, Rosa!"
///
///    let price = 2
///    let number = 3
///    let cookiePrice: FoundationString = "\(number) cookies: $\(price * number)."
///    // cookiePrice == "3 cookies: $6."
///    ```
///
/// Combine strings using the concatenation operator (+).
///
///    ```swift
///    let longerGreeting = greeting + " We're glad you're here!"
///    // longerGreeting == "Welcome! We're glad you're here!"
///    ```
///
/// Multiline string literals are enclosed in three double quotation marks ("""), with each delimiter on its own line. Indentation is stripped from each line of a multiline string literal to match the
/// indentation of the closing delimiter.
///
///    ```swift
///    let banner: FoundationString = """
///              __,
///             (           o  /) _/_
///              `.  , , , ,  //  /
///            (___)(_(_/_(_ //_ (__
///                         /)
///                        (/
///            """
///    ```
///
/// ### Modifying and Comparing Strings
///
/// Strings always have value semantics. Modifying a copy of a string leaves the original unaffected.
///
///    ```swift
///    var otherGreeting = greeting
///    otherGreeting += " Have a nice time!"
///    // otherGreeting == "Welcome! Have a nice time!"
///
///    print(greeting)
///    // Prints "Welcome!"
///    ```
///
/// Comparing strings for equality using the equal-to operator (==) or a relational operator (like < or >=) is always performed using Unicode canonical representation. As a result, different
/// representations of a string compare as being equal.
///
///    ```swift
///    let cafe1: FoundationString = "Cafe\u{301}"
///    let cafe2: FoundationString = "Café"
///    print(cafe1 == cafe2)
///    // Prints "true"
///    ```
///
/// The Unicode scalar value "`\u{301}`" modifies the preceding character to include an accent, so "e`\u{301}`" has the same canonical representation as the single Unicode scalar value "é".
///
/// Basic string operations are not sensitive to locale settings, ensuring that string comparisons and other operations always have a single, stable result, allowing strings to be used as keys in
/// ``FoundationDictionary`` instances and for other purposes.
///
/// ### Accessing String Elements
///
/// A string is a collection of _extended grapheme clusters_, which approximate human-readable characters. Many individual characters,such as "é", "김", and "🇯🇵", can be made up of multiple Unicode
/// scalar values. These scalar values are combined by Unicode's boundary algorithms into extended grapheme clusters, represented by the Swift ``Character`` type. Each element of a string is
/// represented by a ``Character`` instance.
///
/// For example, to retrieve the first word of a longer string, you can search for a space and then create a substring from a prefix of the string up to that point:
///
///    ```swift
///    let name: String = "Marie Curie"
///    let firstSpace = name.firstIndex(of: " ") ?? name.endIndex
///    let firstName = name[0 ..< firstSpace]
///    // firstName == "Marie"
///    ```
///
/// The firstName constant is an instance of the ``Substring`` type—a type that represents substrings of a string while sharing the original string's storage. Substrings present the same interface as
/// strings.
///
/// ### Accessing a String's Unicode Representation
///
/// If you need to access the contents of a string as encoded in different Unicode encodings, use one of the string's ``unicodeScalars``, ``utf16``, or ``utf8`` properties. Each property provides
/// access to a view of the string as a series of code units, each encoded in a different Unicode encoding.
///
/// To demonstrate the different views available for every string, the following examples use this ``FoundationString`` instance:
///
///    ```swift
///    let cafe: FoundationString = "Cafe\u{301} du 🌍"
///    print(cafe)
///    // Prints "Café du 🌍"
///    ```
///
/// The cafe string is a collection of the nine characters that are visible when the string is displayed.
///
///    ```swift
///    print(cafe.count)
///    // Prints "9"
///    print(FoundationArray(cafe))
///    // Prints "["C", "a", "f", "é", " ", "d", "u", " ", "🌍"]"
///    ```
///
/// #### Unicode Scalar View
///
/// A string's ``unicodeScalars`` property is a collection of Unicode scalar values, the 21-bit codes that are the basic unit of Unicode. Each scalar value is represented by a ``Unicode.Scalar``
/// instance and is equivalent to a UTF-32 code unit.
///
///    ```swift
///    print(cafe.unicodeScalars.count)
///    // Prints "10"
///    print(FoundationArray(cafe.unicodeScalars))
///    // Prints "["C", "a", "f", "e", "\u{0301}", " ", "d", "u", " ", "\u{0001F30D}"]"
///    print(cafe.unicodeScalars.map { $0.value })
///    // Prints "[67, 97, 102, 101, 769, 32, 100, 117, 32, 127757]"
///    ```
///
/// The ``unicodeScalars`` view's elements comprise each Unicode scalar value in the cafe string. In particular, because cafe was declared using the decomposed form of the "é" character,
/// ``unicodeScalars`` contains the scalar values for both the letter "e" (101) and the accent character "´" (769).
///
/// #### UTF-16 View
///
/// A string's ``utf16`` property is a collection of UTF-16 code units, the 16-bit encoding form of the string's Unicode scalar values. Each code unit is stored as a ``CUnsignedInteger16`` instance.
///
///    ```swift
///    print(cafe.utf16.count)
///    // Prints "11"
///    print(FoundationArray(cafe.utf16))
///    // Prints "[67, 97, 102, 101, 769, 32, 100, 117, 32, 55356, 57101]"
///    ```
///
/// The elements of the ``utf16`` view are the code units for the string when encoded in UTF-16.
///
/// #### UTF-8 View
///
/// A string's ``utf8`` property is a collection of UTF-8 code units, the 8-bit encoding form of the string's Unicode scalar values. Each code unit is stored as a ``CInteger8`` instance.
///
///    ```swift
///    print(cafe.utf8.count)
///    // Prints "14"
///    print(FoundationArray(cafe.utf8))
///    // Prints "[67, 97, 102, 101, 204, 129, 32, 100, 117, 32, 240, 159, 140, 141]"
///    ```
///
/// The elements of the ``utf8`` view are the code units for the string when encoded in UTF-8. This representation matches the one used when ``FoundationString`` instances are passed to C APIs.
///
/// ### Measuring the Length of a String
///
/// When you need to know the length of a string, you must first consider what you'll use the length for. Are you measuring the number of characters that will be displayed on the screen, or are you
/// measuring the amount of storage needed for the string in a particular encoding? A single string can have greatly differing lengths when measured by its different views.
///
/// For example, an ASCII character like the capital letter A is represented by a single element in each of its four views. The Unicode scalar value of A is 65, which is small enough to fit in a
/// single code unit in both UTF-16 and UTF-8.
///
///    ```swift
///    let capitalA: FoundationString = "A"
///    print(capitalA.count)
///    // Prints "1"
///    print(capitalA.unicodeScalars.count)
///    // Prints "1"
///    print(capitalA.utf16.count)
///    // Prints "1"
///    print(capitalA.utf8.count)
///    // Prints "1"
///    ```
///
/// On the other hand, an emoji flag character is constructed from a pair of Unicode scalar values, like "`\u{1F1F5}`" and "`\u{1F1F7}`". Each of these scalar values, in turn, is too large to fit into
/// a single UTF-16 or UTF-8 code unit. As a result, each view of the string "🇵🇷" reports a different length.
///
///    ```swift
///    let flag: FoundatioString = "🇵🇷"
///    print(flag.count)
///    // Prints "1"
///    print(flag.unicodeScalars.count)
///    // Prints "2"
///    print(flag.utf16.count)
///    // Prints "4"
///    print(flag.utf8.count)
///    // Prints "8"
///    ```
/// To check whether a string is empty, use its ``isEmpty`` property instead of comparing the length of one of the views to 0. Unlike with ``isEmpty``, calculating a view's count property requires
/// iterating through the elements of the string.
///
/// ### Accessing String View Elements
///
/// To find individual elements of a string, use the appropriate view for your task. For example, to retrieve the first word of a longer string, you can search the string for a space and then create a
/// new string from a prefix of the string up to that point.
///
///    ```swift
///    let name: String = "Marie Curie"
///    let firstSpace = name.firstIndex(of: " ") ?? name.endIndex
///    let firstName = name[0 ..< firstSpace]
///    // firstName == "Marie"
///    ```
/// Strings and their views share indices, so you can access the UTF-8 view of the name string using the same `firstSpace` index.
///
///    ```swift
///    print(FoundationArray(name.utf8[0 ..< firstSpace]))
///    // Prints "[77, 97, 114, 105, 101]"
///    ```
///
/// Note that an index into one view may not have an exact corresponding position in another view. For example, the `flag` string declared above comprises a single character, but is composed of eight
/// code units when encoded as UTF-8. The following code creates constants for the first and second positions in the `flag.utf8` view. Accessing the ``utf8`` view with these indices yields the first
/// and second code UTF-8 units.
///
///    ```swift
///    let firstCodeUnit = flag.startIndex
///    let secondCodeUnit = flag.utf8.index(after: firstCodeUnit)
///    // flag.utf8[firstCodeUnit] == 240
///    // flag.utf8[secondCodeUnit] == 159
///    ```
///
/// When used to access the elements of the `flag` string itself, however, the `secondCodeUnit` index does not correspond to the position of a specific character. Instead of only accessing the
/// specific UTF-8 code unit, that index is treated as the position of the character at the index's encoded offset. In the case of `secondCodeUnit`, that character is still the flag itself.
///
///    ```swift
///    // flag[firstCodeUnit] == "🇵🇷"
///    // flag[secondCodeUnit] == "🇵🇷"
///    ```
///
/// If you need to validate that an index from one string's view corresponds with an exact position in another view, use the index's ``samePosition(in:)`` method or the ``init(_:within:)``
/// initializer.
///
///    ```swift
///    if let exactIndex = secondCodeUnit.samePosition(in: flag) {
///      print(flag[exactIndex])
///    } else {
///      print("No exact match for this position.")
///    }
///    // Prints "No exact match for this position."
///    ```
///
/// ### Performance Optimizations
///
/// Although strings in FoundationKit have value semantics, strings use a copy-on-write strategy to store their data in a buffer. This buffer can then be shared by different copies of a string. A
/// string's data is only copied lazily, upon mutation, when more than one string instance is using the same buffer. Therefore, the first in any sequence of mutating operations may cost O(_n_) time
/// and space.
///
/// When a string's contiguous storage fills up, a new buffer must be allocated and data must be moved to the new storage. String buffers use an exponential growth strategy that makes appending to a
/// string a constant time operation when averaged over many append operations.
///
/// ## Topics
///
/// ### Working with String Views
///
/// - ``utf8``
///
/// ### Infrequently Used Functionality
///
/// - ``init(stringLiteral:)``
///
/// ### Related String Types
///
/// - ``FoundationString/UTF8View``
public struct FoundationString {
  @_Storage internal var string: CoreFoundationString

  private init(string: Swift::String) {
    self._string = _Storage(wrappedValue: CoreFoundationString(cString: string))
  }
}

extension FoundationString {
  /// A UTF-8 encoding of `self`.
  public var utf8: FoundationString.UTF8View {
    return UTF8View(string: self)
  }
}

extension FoundationString: Swift::ExpressibleByStringLiteral {
  /// Creates an instance initialized to the given string value.
  ///
  /// Do not call this initializer directly. It is used by the compiler when you initialize a string using a string literal. For example:
  ///
  ///    ```swift
  ///    let nextStop: FoundationString = "Clark & Lake"
  ///    ```
  ///
  /// This assignment to the `nextStop` constant calls this string literal initializer behind the scenes.
  ///
  /// - Parameter value: The value of the new instance.
  public init(stringLiteral value: Swift::String) {
    self.init(string: value)
  }
}

extension FoundationString: Swift::ExpressibleByStringInterpolation {}
