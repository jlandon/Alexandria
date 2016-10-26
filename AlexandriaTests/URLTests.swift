//
//  URLTests.swift
//  Alexandria
//
//  Created by Jonathan Landon on 10/26/16.
//
//

import XCTest
import Alexandria

class URLTests: XCTestCase {
    
    func testStringLiteralInitializer() {
        let url: URL = "https://github.com/ovenbits"
        
        XCTAssert(url.absoluteString == "https://github.com/ovenbits", "Absolute strings are not equal")
        XCTAssert(url.scheme == "https", "Scheme are not equal")
        XCTAssert(url.host == "github.com", "Hosts are not equal")
        XCTAssert(url.path == "/ovenbits", "Paths are not equal")
    }
    
    func testPathAppendingOperator() {
        var url: URL = "https://github.com"
        url = url + "ovenbits"
        url = url + "Alexandria"
        
        XCTAssert(url.path == "/ovenbits/Alexandria", "Paths are not equal")
    }
    
}
