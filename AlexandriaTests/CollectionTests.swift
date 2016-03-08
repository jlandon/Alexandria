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
    
    
    func testPrevious() {
        let emptyArray = [Int]()
        
        XCTAssertNil(emptyArray.previous(42))
        
        let oneArray = [1]
        XCTAssertNil(oneArray.previous(1))
        XCTAssertNil(oneArray.previous(42))
        
        let twoArray = [1,2]
        XCTAssertNil(twoArray.previous(1))
        XCTAssertEqual(twoArray.previous(2), 1)
        XCTAssertNil(twoArray.previous(3))
        
        let threeArray = [1,2,3]
        XCTAssertNil(threeArray.previous(1))
        XCTAssertEqual(threeArray.previous(2), 1)
        XCTAssertEqual(threeArray.previous(3), 2)
        XCTAssertNil(threeArray.previous(4))
        
        let tensArray = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
        XCTAssertNil(tensArray.previous(10))
        XCTAssertEqual(tensArray.previous(20), 10)
        XCTAssertEqual(tensArray.previous(30), 20)
        XCTAssertEqual(tensArray.previous(40), 30)
        XCTAssertEqual(tensArray.previous(50), 40)
        XCTAssertEqual(tensArray.previous(60), 50)
        XCTAssertEqual(tensArray.previous(70), 60)
        XCTAssertEqual(tensArray.previous(80), 70)
        XCTAssertEqual(tensArray.previous(90), 80)
        XCTAssertEqual(tensArray.previous(100), 90)
        XCTAssertNil(tensArray.previous(110))
    }

    
    func testNext() {
        let emptyArray = [Int]()
        
        XCTAssertNil(emptyArray.next(42))
        
        let oneArray = [1]
        XCTAssertNil(oneArray.next(0))
        XCTAssertNil(oneArray.next(1))
        
        let twoArray = [1,2]
        XCTAssertNil(twoArray.next(0))
        XCTAssertEqual(twoArray.next(1), 2)
        XCTAssertNil(twoArray.next(2))
        XCTAssertNil(twoArray.next(3))
        
        let threeArray = [1,2,3]
        XCTAssertNil(threeArray.next(0))
        XCTAssertEqual(threeArray.next(1), 2)
        XCTAssertEqual(threeArray.next(2), 3)
        XCTAssertNil(threeArray.next(3))
        XCTAssertNil(threeArray.next(4))
        
        let tensArray = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
        XCTAssertNil(tensArray.next(0))
        XCTAssertEqual(tensArray.next(10), 20)
        XCTAssertEqual(tensArray.next(20), 30)
        XCTAssertEqual(tensArray.next(30), 40)
        XCTAssertEqual(tensArray.next(40), 50)
        XCTAssertEqual(tensArray.next(50), 60)
        XCTAssertEqual(tensArray.next(60), 70)
        XCTAssertEqual(tensArray.next(70), 80)
        XCTAssertEqual(tensArray.next(80), 90)
        XCTAssertEqual(tensArray.next(90), 100)
        XCTAssertNil(tensArray.next(100))
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
