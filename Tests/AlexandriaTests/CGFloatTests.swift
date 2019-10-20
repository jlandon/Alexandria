//
//  CGFloatTests.swift
//  Alexandria
//
//  Created by Jonathan Landon on 6/20/16.
//
//

import XCTest

class CGFloatTests: XCTestCase {

    func testRounded() {
        XCTAssertEqual((1.234567 as CGFloat).rounded(places: 0), 1)
        XCTAssertEqual((1.234567 as CGFloat).rounded(places: 1), 1.2)
        XCTAssertEqual((1.234567 as CGFloat).rounded(places: 2), 1.23)
        XCTAssertEqual((1.234567 as CGFloat).rounded(places: 3), 1.235)
        XCTAssertEqual((1.234567 as CGFloat).rounded(places: 4), 1.2346)
        XCTAssertEqual((1.234567 as CGFloat).rounded(places: 5), 1.23457)
        XCTAssertEqual((1.234567 as CGFloat).rounded(places: 6), 1.234567)
        XCTAssertEqual((1.234567 as CGFloat).rounded(places: 7), 1.234567)
    }

}
