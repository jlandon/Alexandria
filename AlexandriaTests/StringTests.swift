//
//  StringTests.swift
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

class StringTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCamelCased() {
        XCTAssertEqual("os version".camelCased, "osVersion", "CamelCased strings are not equal")
        XCTAssertEqual("HelloWorld".camelCased, "helloWorld", "CamelCased strings are not equal")
        XCTAssertEqual("someword With Characters".camelCased, "somewordWithCharacters", "CamelCased strings are not equal")
    }

    func testBase64() {
        XCTAssertEqual("Oven Bits".base64Encoded, "T3ZlbiBCaXRz", "Base64 encoded strings are not equal")
        XCTAssertEqual("T3ZlbiBCaXRz".base64Decoded, "Oven Bits", "Base64 decoded strings are not equal")
    }
    
    func testRegex() {
        XCTAssertEqual("hello".regex("[aeiou]", "*"), "h*ll*", "Regex strings are not equal")
        XCTAssertEqual("hello".regex("([aeiou])", "<$1>"), "h<e>ll<o>", "Regex strings are not equal")
    }
    
    func testRegexClosure() {
        XCTAssertEqual("hello".regex(".") {
            let s = $0.unicodeScalars
            let v = s[s.startIndex].value
            return "\(v) "
        }, "104 101 108 108 111 ", "Regex closure strings are not equal")
    }
    
    func testRanges() {
        XCTAssertEqual("swift"[0...1], "sw", "String ranges are not equal")
        XCTAssertEqual("swift"[0..<1], "s", "String ranges are not equal")
        XCTAssertEqual("swift"[...3], "swif", "String ranges are not equal")
        XCTAssertEqual("swift"[..<2], "sw", "String ranges are not equal")
        XCTAssertEqual("swift"[3...], "ft", "String ranges are not equal")
    }
    
    func testTruncate() {
        XCTAssertEqual("hello there".truncated(to: 5), "hello", "Truncated strings are not equal")
        XCTAssertEqual("hello there".truncated(to: 5, trailing: "..."), "hello...", "Truncated strings are not equal")
    }
    
    func testNumeric() {
        XCTAssert("1".isNumeric, "Simple string of one digit is numberic")
        XCTAssert("12345678901234567890".isNumeric, "String of many digits is numeric")
        XCTAssertFalse("".isNumeric, "Empty string is not numeric")
        XCTAssertFalse("12.34".isNumeric, "String containing decimal point is not numeric")
        XCTAssertFalse("a".isNumeric, "String containing only letters is not numeric")
        XCTAssertFalse("1a1".isNumeric, "String containing letters and digits is not numeric")
        XCTAssertFalse("a1a".isNumeric, "String containing letters and digits is not numeric")
    }
    
    func testExtendedStringRangeConversions() {
        let uk = "🇬🇧"
        let str = "a😜b🇬🇧c"
        let r1 = str.range(of: uk)!
        
        let n1 = str.nsRange(from: r1)
        XCTAssertEqual((str as NSString).substring(with: n1), uk, "Range should have found the UK flag")
        
        let r2 = str.range(from: n1)!
        XCTAssertEqual(String(str[r2]), uk, "Range should have found the UK flag")
    }
    
    func testRepeatedRangeConversion() {
        var content: String = "This library was created by <link id=\"ovenbits\" type=\"ahref\"/> and can be found on <link id=\"github\" type=\"ahref\"/>"
        let regexStr = "<link id=\"(.*?)\" type=\"ahref\"/>"
        do {
            let regex = try NSRegularExpression(pattern: regexStr, options: .caseInsensitive)
            for match in regex.matches(in: content, options: [], range: NSRange(location: 0, length: content.characters.count)).reversed() {
                let reference = String(content[content.range(from: match.range(at: 1))!])
                content = content.replacingCharacters(in: content.range(from: match.range)!, with: "<a class=\"link\" href=\"http://www.\(reference).com\">\(reference)</a>")
            }
            XCTAssertEqual(content, "This library was created by <a class=\"link\" href=\"http://www.ovenbits.com\">ovenbits</a> and can be found on <a class=\"link\" href=\"http://www.github.com\">github</a>", "Repeated regex should have been handled")
        } catch {
            XCTFail("Regular expression creation issue")
        }
    }
    
}
