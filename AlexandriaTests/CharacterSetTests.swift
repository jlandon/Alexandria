//
//  CharacterSetTests.swift
//  Alexandria
//
//  Created by Jonathan Landon on 10/26/16.
//
//

import XCTest

class CharacterSetTests: XCTestCase {
    
    func testStringLiteralInitializer() {
        let set: CharacterSet = "abcdefg"
        
        XCTAssert(set.contains("a"), "Character missing from set")
        XCTAssert(set.contains("d"), "Character missing from set")
        XCTAssert(!set.contains("h"), "Character should not be in set")
    }
    
}
