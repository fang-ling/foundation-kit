//===--------------------------------------------------------------------------------------------------------------------------------------------------------------------------===//
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
//===--------------------------------------------------------------------------------------------------------------------------------------------------------------------------===//

import CKit
import CoreFoundationKit

/// A static, plain-text Unicode string object.
///
/// You can use this type in Swift when you need reference semantics or other FoundationKit-specific behavior.
///
/// The ``FoundationString`` class and its mutable subclass, ``FoundationMutableString``, provide an extensive set of APIs for working with strings, including methods for
/// comparing, searching, and modifying strings. ``FoundationString`` objects are used throughout FoundationKit and other frameworks, serving as the basis for all textual and
/// linguistic functionality on the platform.
///
/// ``FoundationString`` is toll-free bridged with its CoreFoundationKit counterpart, ``CoreFoundationString``.
///
/// ### String Objects
///
/// A ``FoundationString`` object encodes a Unicode-compliant text string, represented as a sequence of UTF–32 code units. All lengths, character indexes, and ranges are expressed
/// in terms of 32-bit platform-endian values, with index values starting at 0.
///
/// A ``FoundationString`` object can be initialized from or written to a C buffer, a ``FoundationData`` object, or a UTF-32 characters buffer. It can also be encoded and decoded
/// to and from ASCII, UTF–8, UTF–16, UTF–32, or any other string encoding represented by ``FoundationString.Encoding``.
///
/// > Note: An immutable string is a text string that is defined when it is created and subsequently cannot be changed. An immutable string is implemented as an array of UTF–32
///   code units (in other words, a text string). To create and manage an immutable string, use the ``FoundationString`` class. To construct and manage a string that can be changed
///   after it has been created, use ``FoundationMutableString``.
///
/// The objects you create using ``FoundationString`` and ``FoundationMutableString`` are referred to as string objects (or, when no confusion will result, merely as strings). The
/// term C string refers to the standard `char*` type.
///
/// ### Understanding Characters
///
/// A string object presents itself as a sequence of UTF–32 code units. You can determine how many UTF-32 code units a string object contains with the ``count`` property and can
/// retrieve a specific UTF-32 code unit with the subscript syntax. These two "primitive" ways provide basic access to a string object.
///
/// Most use of strings, however, is at a higher level, with the strings being treated as single entities: You compare strings against one another, search them for substrings,
/// combine them into new strings, and so on. If you need to access string objects character by character, you must understand the Unicode character encoding, specifically issues
/// related to composed character sequences. For details see _The Unicode Standard, Version 4.0_ (The Unicode Consortium, Boston: Addison-Wesley, 2003, ISBN 0-321-18578-1) and the
/// Unicode Consortium web site: https://www.unicode.org/.
///
/// Localized string comparisons are based on the Unicode Collation Algorithm, as tailored for different languages by CLDR (Common Locale Data Repository). Both are projects of the
/// Unicode Consortium. Unicode is a registered trademark of Unicode, Inc.
///
/// ### Interpreting UTF-32-Encoded Data
///
/// When creating a ``FoundationString`` object from a UTF-32-encoded string (or a byte stream interpreted as UTF-32), if the byte order is not otherwise specified,
/// ``FoundationString`` assumes that the UTF-32 characters are native-endian, unless there is a BOM (byte-order mark), in which case the BOM dictates the byte order. When creating
/// a ``FoundationString`` object from an array of ``CUnsignedInteger32`` values, the returned string is always native-endian, since the array always contains UTF–32 code units in
/// native byte order.
///
/// ### Subclassing Notes
///
/// There should be little need of subclassing. If you need to customize behavior, it's often better to consider composition instead of subclassing.
///
/// #### Alternatives to Subclassing
///
/// Often a better and easier alternative to making a subclass of ``FoundationString`` is object composition. This is especially the case when your intent is to add to the subclass
/// metadata or some other attribute that is not essential to a string object. In object composition, you would have an ``FoundationString`` object as one instance variable of your
/// custom class and one or more properties that store the metadata that you want for the custom object. Then just design your subclass interface to include accessor methods for
/// the embedded string object and the metadata.
///
/// If the behavior you want to add supplements that of the existing class, you could write an extension on ``FoundationString``. Keep in mind, however, that this extension will be
/// in effect for all instances of ``FoundationString`` that you use, and this might have unintended consequences.
///
/// ## Topics
///
/// ### Getting a String's Length
///
/// - ``count``
///
/// ### Getting Characters and Bytes
///
/// - ``subscript(index:)``
public final class FoundationString: Swift::ExpressibleByStringLiteral {
  private var _characters: Swift::UnsafeMutablePointer<CUnsignedInteger32>

  private var _count: CInteger

  /// The number of UTF-32 code units in the string.
  public var count: CInteger {
    return Swift::unsafeBitCast(self, to: CoreFoundationString.self).count
  }

  fileprivate init(characters: Swift::UnsafePointer<CUnsignedInteger32>, count: CInteger) {
    self._count = count
    self._characters = Swift::UnsafeMutablePointer<CUnsignedInteger32>.allocate(capacity: Swift::Int(count))
    self._characters.initialize(from: characters, count: Swift::Int(count))
  }

  public required convenience init(stringLiteral value: Swift::String) {
    self.init(characters: value.unicodeScalars.map { $0.value }, count: value.count)
  }

  deinit {
    self._characters.deallocate()
  }

  /// Accesses the character at the given position.
  ///
  /// - Parameter index: A valid index of the string. `index` must be less than the string's `count`.
  public subscript(index: CInteger) -> CUnsignedInteger32 {
    return Swift::unsafeBitCast(self, to: CoreFoundationString.self).character(at: index)
  }
}

// Exposed to CoreFoundationKit to ensure correct initialization of the Swift instance.
@c @implementation
public func _CoreFoundationStringInitializeWithCharacters(_ characters: Swift::UnsafePointer<CUnsignedInteger32>, _ count: CInteger) -> Swift::UnsafeMutableRawPointer {
  return Swift::Unmanaged<FoundationString>.passUnretained(FoundationString(characters: characters, count: count)).toOpaque()
}
