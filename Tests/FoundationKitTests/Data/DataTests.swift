////
////  DataTests.swift
////  foundation-framework
////
////  Created by Fang Ling on 2026/2/10.
////
////  Licensed under the Apache License, Version 2.0 (the "License");
////  you may not use this file except in compliance with the License.
////  You may obtain a copy of the License at
////
////    http://www.apache.org/licenses/LICENSE-2.0
////
////  Unless required by applicable law or agreed to in writing, software
////  distributed under the License is distributed on an "AS IS" BASIS,
////  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
////  See the License for the specific language governing permissions and
////  limitations under the License.
////
//
//@testable import Foundation
//import Testing
//
//@Suite("DataTests")
//struct DataTests {
//  @Test("Initialize with empty data")
//  func testInitializeEmpty() {
//    let bytes: [UnsignedInteger8] = []
//    let data = bytes.withUnsafeBufferPointer { buffer in
//      Data(bytes: buffer.baseAddress!, count: 0)
//    }
//
//    #expect(data.count == 0)
//  }
//
//  @Test("Initialize with single byte")
//  func testInitializeSingleByte() {
//    let bytes: [UnsignedInteger8] = [42]
//    let data = bytes.withUnsafeBufferPointer { buffer in
//      Data(bytes: buffer.baseAddress!, count: UnsignedInteger64(buffer.count))
//    }
//
//    #expect(data.count == 1)
//    #expect(data.bytes[0] == 42)
//  }
//
//  @Test("Initialize with multiple bytes")
//  func testInitializeMultipleBytes() {
//    let bytes: [UnsignedInteger8] = [0x48, 0x65, 0x6C, 0x6C, 0x6F]
//    let data = bytes.withUnsafeBufferPointer { buffer in
//      Data(bytes: buffer.baseAddress!, count: UnsignedInteger64(buffer.count))
//    }
//
//    #expect(data.count == 5)
//    for i in 0 ..< 5 {
//      #expect(data.bytes[i] == bytes[i])
//    }
//  }
//
//  @Test("Initialize with large buffer")
//  func testInitializeLargeBuffer() {
//    let size = 1024 * 1024
//    let bytes = [UnsignedInteger8](repeating: 0xAB, count: size)
//
//    let data = bytes.withUnsafeBufferPointer { buffer in
//      Data(bytes: buffer.baseAddress!, count: UnsignedInteger64(buffer.count))
//    }
//
//    #expect(data.count == UnsignedInteger64(size))
//    #expect(data.bytes[0] == 0xAB)
//    #expect(data.bytes[size - 1] == 0xAB)
//  }
//
//  @Test("Data copies buffer independently")
//  func testDataCopyIndependence() {
//    var bytes: [UnsignedInteger8] = [1, 2, 3, 4, 5]
//    let data = bytes.withUnsafeBufferPointer { buffer in
//      Data(bytes: buffer.baseAddress!, count: UnsignedInteger64(buffer.count))
//    }
//
//    // Modify original buffer
//    bytes[0] = 99
//    bytes[4] = 88
//
//    // Data should still have original values
//    #expect(data.bytes[0] == 1)
//    #expect(data.bytes[4] == 5)
//  }
//
//  @Test("Multiple Data instances are independent")
//  func testMultipleInstancesIndependent() {
//    let bytes1: [UnsignedInteger8] = [1, 2, 3]
//    let bytes2: [UnsignedInteger8] = [4, 5, 6]
//
//    let data1 = bytes1.withUnsafeBufferPointer { buffer in
//      Data(bytes: buffer.baseAddress!, count: UnsignedInteger64(buffer.count))
//    }
//    let data2 = bytes2.withUnsafeBufferPointer { buffer in
//      Data(bytes: buffer.baseAddress!, count: UnsignedInteger64(buffer.count))
//    }
//
//    #expect(data1.count == 3)
//    #expect(data2.count == 3)
//    #expect(data1.bytes[0] == 1)
//    #expect(data2.bytes[0] == 4)
//  }
//
//  @Test("Store and retrieve UTF-8 string")
//  func testUTF8String() {
//    let string = "Hello, 🌍!"
//    let utf8Bytes = Array(string.utf8)
//
//    let data = utf8Bytes.withUnsafeBufferPointer { buffer in
//      Data(bytes: buffer.baseAddress!, count: UnsignedInteger64(buffer.count))
//    }
//
//    #expect(data.count == UnsignedInteger64(utf8Bytes.count))
//
//    // Reconstruct string from data
//    let reconstructedBytes = UnsafeBufferPointer(
//      start: data.bytes,
//      count: Int(data.count)
//    )
//    let reconstructedString = Swift.String(
//      decoding: reconstructedBytes,
//      as: UTF8.self
//    )
//
//    #expect(reconstructedString == string)
//  }
//
//  @Test("Store binary struct data")
//  func testBinaryStructureData() {
//    struct Header {
//      var magic: UInt32
//      var version: UInt16
//      var flags: UInt16
//      var length: UnsignedInteger64
//    }
//
//    var header = Header(
//      magic: 0x12345678,
//      version: 1,
//      flags: 0xABCD,
//      length: 1024
//    )
//
//    let data = withUnsafeBytes(of: &header) { buffer in
//      Data(
//        bytes: buffer.baseAddress!.assumingMemoryBound(
//          to: UnsignedInteger8.self
//        ),
//        count: UnsignedInteger64(buffer.count)
//      )
//    }
//
//    #expect(data.count == UnsignedInteger64(MemoryLayout<Header>.size))
//
//    // Read back
//    let reconstructed = data.bytes.withMemoryRebound(
//      to: Header.self,
//      capacity: 1
//    ) { ptr in
//      ptr.pointee
//    }
//
//    #expect(reconstructed.magic == 0x12345678)
//    #expect(reconstructed.version == 1)
//    #expect(reconstructed.flags == 0xABCD)
//    #expect(reconstructed.length == 1024)
//  }
//}
