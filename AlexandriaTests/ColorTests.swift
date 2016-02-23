//
//  ColorTests.swift
//
//  Created by Jonathan Landon on 2/8/16.
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

class ColorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testHexInitializer() {
        XCTAssertEqual(UIColor(hex: 0xFF0000), UIColor.redColor(), "Colors not equal")
        XCTAssertEqual(UIColor(hexString: "#00FF00"), UIColor.greenColor(), "Colors not equal")
        XCTAssertEqual(UIColor(hexString: "0000FF"), UIColor.blueColor(), "Colors not equal")
    }
    
    func testHexString() {
        XCTAssertEqual(UIColor.purpleColor().hexString, "#7f007f", "Hex strings are not equal")
    }
    
    func testHex() {
        XCTAssertEqual(UIColor.yellowColor().hex, UIColor(hex: 0xFFFF00).hex, "Hex values are not equal")
    }
    
    func testComponents() {
        let color = UIColor(hex: 0xEF5138)
        
        XCTAssertEqual(String(format: "%.3f", color.redComponent), "0.937", "Red components are not equal")
        XCTAssertEqual(String(format: "%.3f", color.greenComponent), "0.318", "Green components are not equal")
        XCTAssertEqual(String(format: "%.3f", color.blueComponent), "0.220", "Blue components are not equal")
    }
}
