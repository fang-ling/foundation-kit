//
//  FoundationNumberTests.swift
//  foundation-framework
//
//  Created by Fang Ling on 2026/4/25.
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

@testable import FoundationKit

import Testing

@Test("FoundationNumberTests")
func testFoundationNumber() {
  let number = FoundationNumber.make(withUnsignedInteger: 19358)
  #expect(number.unsignedIntegerValue == 19358)
}
