//
//  CollectionTests.swift
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
import Alexandria

class CollectionTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testRemoveArrayElement() {
        var array = [1, 2, 3, 4, 5]
        
        XCTAssertEqual(array.removeElement(3), 3, "Element not found")
        XCTAssertEqual(array.removeElement(3), .None, "Element found")
    }
    
    func testUniqueArray() {
        let array = [1, 2, 4, 3, 2, 4, 5, 3]
        
        XCTAssertEqual(array.unique(), [1, 2, 4, 3, 5], "Unique arrays are not equal")
    }
    
    func testRotateArray() {
        var array = [1, 2, 3, 4, 5]

        XCTAssertEqual(array.rotate(array.count), array, "Array should have been rotated right")
        XCTAssertEqual(array.rotate(1), [2, 3, 4, 5, 1], "Array should have been rotated right")
        XCTAssertEqual(array.rotate(2), [3, 4, 5, 1, 2], "Array should have been rotated right")
        XCTAssertEqual(array.rotate(0), array, "Array should not have been rotated")
        XCTAssertEqual(array.rotate(-2), [4, 5, 1, 2, 3], "Array should have been rotated left")
        XCTAssertEqual(array.rotate(-1), [5, 1, 2, 3, 4], "Array should have been rotated left")
        XCTAssertEqual(array.rotate(-1 * array.count), array, "Array should have been rotated left")
        
        array = []
        XCTAssertEqual(array.rotate(2), [], "Empty array cannot be rotated")
    }
    
    func testRotateInPlace() {
        var array = [1, 2, 3, 4, 5]
        array.rotateInPlace(1)
        XCTAssertEqual([2, 3, 4, 5, 1], array, "Array should have been rotated right")
        array = [1, 2, 3, 4, 5]
        array.rotateInPlace(2)
        XCTAssertEqual([3, 4, 5, 1, 2], array, "Array should have been rotated right")
        array = [1, 2, 3, 4, 5]
        array.rotateInPlace(0)
        XCTAssertEqual(array, array, "Array should not have been rotated")
        array = [1, 2, 3, 4, 5]
        array.rotateInPlace(-2)
        XCTAssertEqual([4, 5, 1, 2, 3], array, "Array should have been rotated left")
        array = [1, 2, 3, 4, 5]
        array.rotateInPlace(-1)
        XCTAssertEqual([5, 1, 2, 3, 4], array, "Array should have been rotated left")
        array = []
        array.rotateInPlace(2)
        XCTAssertEqual(array, array, "Empty array cannot be rotated")
    }
    
    func testMapWithIndex() {
        let array = [1, 2, 3, 4, 5]
        
        let mapped: [Int] = array.mapWithIndex { index, element in
            return (index % 2 == 1) ? element * 2 : element
        }
        
        XCTAssertEqual(mapped, [1, 4, 3, 8, 5], "Mapping failed")
    }
    
    func testDictionaryUnion() {
        let dictionary1 = ["key1" : 1, "key2" : 2]
        let dictionary2 = ["key3" : 3]
        
        XCTAssertEqual(dictionary1.union(dictionary2), ["key1" : 1, "key2" : 2, "key3" : 3], "Dictionaries are not equal")
        XCTAssertEqual(dictionary1 + dictionary2, ["key1" : 1, "key2" : 2, "key3" : 3], "Dictionaries are not equal")
    }
    
    func testOptionalIndex() {
        let array = [1, 2, 3, 4, 5]
        
        XCTAssertEqual(array[safe:1], 2, "Array elements are not equal")
        XCTAssertEqual(array[safe:5], nil, "Array elements are not equal")
        
        XCTAssertEqual(array.at(2), 3, "Array elements are not equal")
        XCTAssertEqual(array.at(-1), nil, "Array elements are not equal")
    }
}
