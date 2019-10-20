//
//  IntTests.swift
//
//  Created by hsoi on 6/3/16.
//
// The MIT License (MIT)
//
// Copyright (c) 2014-2016 Oven Bits, LLC
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import XCTest

class IntTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    func testToAbbreviatedString() {
        XCTAssertEqual(Int(598).abbreviatedString, "598")
        XCTAssertEqual(Int(-999).abbreviatedString, "-999")
        XCTAssertEqual(Int(1000).abbreviatedString, "1K")
        XCTAssertEqual(Int(-1284).abbreviatedString, "-1.3K")
        XCTAssertEqual(Int(9940).abbreviatedString, "9.9K")
        XCTAssertEqual(Int(9980).abbreviatedString, "10K")
        XCTAssertEqual(Int(39900).abbreviatedString, "39.9K")
        XCTAssertEqual(Int(99880).abbreviatedString, "99.9K")
        XCTAssertEqual(Int(399880).abbreviatedString, "0.4M")
        XCTAssertEqual(Int(999898).abbreviatedString, "1M")
        XCTAssertEqual(Int(999999).abbreviatedString, "1M")
        XCTAssertEqual(Int(1456384).abbreviatedString, "1.5M")
        XCTAssertEqual(Int(12383474).abbreviatedString, "12.4M")
    }
}
