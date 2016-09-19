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
import Alexandria

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
        XCTAssertEqual(UIColor(hex: 0xFF0000), UIColor.red, "Colors not equal")
        XCTAssertEqual(UIColor(hexString: "#00FF00"), UIColor.green, "Colors not equal")
        XCTAssertEqual(UIColor(hexString: "0000FF"), UIColor.blue, "Colors not equal")
        XCTAssertEqual(UIColor(hue: 0, saturation: 1, lightness: 0.5), UIColor.red, "Colors not equal")
        XCTAssertEqual(UIColor(cyan: 0, magenta: 1, yellow: 1, key: 0), UIColor.red, "Colors not equal")
    }
    
    func testHexString() {
        XCTAssertEqual(UIColor.purple.hexString, "#7f007f", "Hex strings are not equal")
    }
    
    func testHex() {
        XCTAssertEqual(UIColor.yellow.hex, UIColor(hex: 0xFFFF00).hex, "Hex values are not equal")
    }
    
    func testComponents() {
        let color = UIColor(hex: 0xEF5138)
        
        XCTAssertCGFloatEqual(color.rgba.r, 0.937, roundedToDecimalPlaces: 3, "Red components are not equal")
        XCTAssertCGFloatEqual(color.rgba.g, 0.318, roundedToDecimalPlaces: 3, "Green components are not equal")
        XCTAssertCGFloatEqual(color.rgba.b, 0.220, roundedToDecimalPlaces: 3, "Blue components are not equal")
    }
    
    func testLightenColor() {
        let color = UIColor(hex: 0xEF5138)
        XCTAssertEqual(color.lightened(by: 0.2).hex, 0xF3816F)
        XCTAssertEqual(color.lightened(by: 20%).hex, 0xF3816F)
    }
    
    func testDarkenColor() {
        let color = UIColor(hex: 0xEF5138)
        XCTAssertEqual(color.darkened(by: 0.2).hex, 0xDA2D12)
        XCTAssertEqual(color.darkened(by: 20%).hex, 0xDA2D12)
    }
    
    func testRGBColorModel() {
        let rgb: [(r: CGFloat, g: CGFloat, b: CGFloat)] = [
            (255, 255, 0),
            (255, 128, 0),
            (255, 0, 0),
            (0, 255, 0),
            (0, 128, 0),
            (0, 255, 255),
            (0, 0, 255),
            (170, 0, 255),
            (255, 0, 255),
            (153, 102, 0),
            (255, 255, 255),
            (242, 242, 242),
            (179, 179, 179),
            (102, 102, 102),
            (0, 0, 0),
        ]
        
        for color in rgb {
            let model = UIColor.Model.rgb(color.r, color.g, color.b)
            
            let hsl  = UIColor.Model.hsl(model.hsl.h, model.hsl.s, model.hsl.l)
            let hsb  = UIColor.Model.hsb(model.hsb.h, model.hsb.s, model.hsb.b)
            let cmyk = UIColor.Model.cmyk(model.cmyk.c, model.cmyk.m, model.cmyk.y, model.cmyk.k)
            let hex  = UIColor.Model.hex(model.hex)
            
            XCTAssertEqual(hsl.rgb.r, color.r)
            XCTAssertEqual(hsl.rgb.g, color.g)
            XCTAssertEqual(hsl.rgb.b, color.b)
            
            XCTAssertEqual(hsb.rgb.r, color.r)
            XCTAssertEqual(hsb.rgb.g, color.g)
            XCTAssertEqual(hsb.rgb.b, color.b)
            
            XCTAssertEqual(cmyk.rgb.r, color.r)
            XCTAssertEqual(cmyk.rgb.g, color.g)
            XCTAssertEqual(cmyk.rgb.b, color.b)
            
            XCTAssertEqual(hex.rgb.r, color.r)
            XCTAssertEqual(hex.rgb.g, color.g)
            XCTAssertEqual(hex.rgb.b, color.b)
        }
    }
    
    func testhsbColorModel() {
        let hsb: [(h: CGFloat, s: CGFloat, b: CGFloat)] = [
            (60/360, 1, 1),
            (30/360, 1, 1),
            (0, 1, 1),
            (120/360, 1, 1),
            (120/360, 1, 0.5),
            (180/360, 1, 1),
            (240/360, 1, 1),
            (280/360, 1, 1),
            (300/360, 1, 1),
            (40/360, 1, 0.6),
            (0, 0, 1),
            (0, 0, 0.95),
            (0, 0, 0.7),
            (0, 0, 0.4),
            (0, 0, 0),
        ]
        
        for color in hsb {
            let model = UIColor.Model.hsb(color.h, color.s, color.b)
            
            let rgb  = UIColor.Model.rgb(model.rgb.r, model.rgb.g, model.rgb.b)
            let hsb  = UIColor.Model.hsb(model.hsb.h, model.hsb.s, model.hsb.b)
            let cmyk = UIColor.Model.cmyk(model.cmyk.c, model.cmyk.m, model.cmyk.y, model.cmyk.k)
            let hex  = UIColor.Model.hex(model.hex)
            
            XCTAssertCGFloatEqual(rgb.hsb.h, color.h, roundedToDecimalPlaces: 2, "Hue components are not equal")
            XCTAssertCGFloatEqual(rgb.hsb.s, color.s, roundedToDecimalPlaces: 2, "Saturation components are not equal")
            XCTAssertCGFloatEqual(rgb.hsb.b, color.b, roundedToDecimalPlaces: 2, "Brightness components are not equal")
            
            XCTAssertCGFloatEqual(hsb.hsb.h, color.h, roundedToDecimalPlaces: 2, "Hue components are not equal")
            XCTAssertCGFloatEqual(hsb.hsb.s, color.s, roundedToDecimalPlaces: 2, "Saturation components are not equal")
            XCTAssertCGFloatEqual(hsb.hsb.b, color.b, roundedToDecimalPlaces: 2, "Brightness components are not equal")
            
            XCTAssertCGFloatEqual(cmyk.hsb.h, color.h, roundedToDecimalPlaces: 2, "Hue components are not equal")
            XCTAssertCGFloatEqual(cmyk.hsb.s, color.s, roundedToDecimalPlaces: 2, "Saturation components are not equal")
            XCTAssertCGFloatEqual(cmyk.hsb.b, color.b, roundedToDecimalPlaces: 2, "Brightness components are not equal")
            
            XCTAssertCGFloatEqual(hex.hsb.h, color.h, roundedToDecimalPlaces: 2, "Hue components are not equal")
            XCTAssertCGFloatEqual(hex.hsb.s, color.s, roundedToDecimalPlaces: 2, "Saturation components are not equal")
            XCTAssertCGFloatEqual(hex.hsb.b, color.b, roundedToDecimalPlaces: 2, "Brightness components are not equal")
        }
    }
    
    func testHSLColorModel() {
        let hsl: [(h: CGFloat, s: CGFloat, l: CGFloat)] = [
            (60/360, 1, 0.5),
            (30/360, 1, 0.5),
            (0, 1, 0.5),
            (120/360, 1, 0.5),
            (120/360, 1, 0.25),
            (180/360, 1, 0.5),
            (240/360, 1, 0.5),
            (280/360, 1, 0.5),
            (300/360, 1, 0.5),
            (40/360, 1, 0.3),
            (0, 0, 1),
            (0, 0, 0.95),
            (0, 0, 0.7),
            (0, 0, 0.4),
            (0, 0, 0),
        ]
        
        for color in hsl {
            let model = UIColor.Model.hsl(color.h, color.s, color.l)
            
            let rgb  = UIColor.Model.rgb(model.rgb.r, model.rgb.g, model.rgb.b)
            let hsb  = UIColor.Model.hsb(model.hsb.h, model.hsb.s, model.hsb.b)
            let cmyk = UIColor.Model.cmyk(model.cmyk.c, model.cmyk.m, model.cmyk.y, model.cmyk.k)
            let hex  = UIColor.Model.hex(model.hex)
            
            XCTAssertCGFloatEqual(rgb.hsl.h, color.h, roundedToDecimalPlaces: 2, "Hue components are not equal")
            XCTAssertCGFloatEqual(rgb.hsl.s, color.s, roundedToDecimalPlaces: 2, "Saturation components are not equal")
            XCTAssertCGFloatEqual(rgb.hsl.l, color.l, roundedToDecimalPlaces: 2, "Lightness components are not equal")
            
            XCTAssertCGFloatEqual(hsb.hsl.h, color.h, roundedToDecimalPlaces: 2, "Hue components are not equal")
            XCTAssertCGFloatEqual(hsb.hsl.s, color.s, roundedToDecimalPlaces: 2, "Saturation components are not equal")
            XCTAssertCGFloatEqual(hsb.hsl.l, color.l, roundedToDecimalPlaces: 2, "Lightness components are not equal")
            
            XCTAssertCGFloatEqual(cmyk.hsl.h, color.h, roundedToDecimalPlaces: 2, "Hue components are not equal")
            XCTAssertCGFloatEqual(cmyk.hsl.s, color.s, roundedToDecimalPlaces: 2, "Saturation components are not equal")
            XCTAssertCGFloatEqual(cmyk.hsl.l, color.l, roundedToDecimalPlaces: 2, "Lightness components are not equal")
            
            XCTAssertCGFloatEqual(hex.hsl.h, color.h, roundedToDecimalPlaces: 2, "Hue components are not equal")
            XCTAssertCGFloatEqual(hex.hsl.s, color.s, roundedToDecimalPlaces: 2, "Saturation components are not equal")
            XCTAssertCGFloatEqual(hex.hsl.l, color.l, roundedToDecimalPlaces: 2, "Lightness components are not equal")
        }
    }
    
    func testCMYKColorModel() {
        let cmyk: [(c: CGFloat, m: CGFloat, y: CGFloat, k: CGFloat)] = [
            (0, 0, 1, 0),
            (0, 0.5, 1, 0),
            (0, 1, 1, 0),
            (1, 0, 1, 0),
            (1, 0, 1, 0.5),
            (1, 0, 0, 0),
            (1, 1, 0, 0),
            (1/3, 1, 0, 0),
            (0, 1, 0, 0),
            (0, 1/3, 1, 0.4),
            (0, 0, 0, 0),
            (0, 0, 0, 0.05),
            (0, 0, 0, 0.3),
            (0, 0, 0, 0.6),
            (0, 0, 0, 1),
        ]
        
        for color in cmyk {
            let model = UIColor.Model.cmyk(color.c, color.m, color.y, color.k)
            
            let rgb  = UIColor.Model.rgb(model.rgb.r, model.rgb.g, model.rgb.b)
            let hsl  = UIColor.Model.hsl(model.hsl.h, model.hsl.s, model.hsl.l)
            let hsb  = UIColor.Model.hsb(model.hsb.h, model.hsb.s, model.hsb.b)
            let hex  = UIColor.Model.hex(model.hex)
            
            XCTAssertCGFloatEqual(rgb.cmyk.c, color.c, roundedToDecimalPlaces: 2, "Cyan components are not equal")
            XCTAssertCGFloatEqual(rgb.cmyk.m, color.m, roundedToDecimalPlaces: 2, "Magenta components are not equal")
            XCTAssertCGFloatEqual(rgb.cmyk.y, color.y, roundedToDecimalPlaces: 2, "Yellow components are not equal")
            XCTAssertCGFloatEqual(rgb.cmyk.k, color.k, roundedToDecimalPlaces: 2, "Key components are not equal")
            
            XCTAssertCGFloatEqual(hsl.cmyk.c, color.c, roundedToDecimalPlaces: 2, "Cyan components are not equal")
            XCTAssertCGFloatEqual(hsl.cmyk.m, color.m, roundedToDecimalPlaces: 2, "Magenta components are not equal")
            XCTAssertCGFloatEqual(hsl.cmyk.y, color.y, roundedToDecimalPlaces: 2, "Yellow components are not equal")
            XCTAssertCGFloatEqual(hsl.cmyk.k, color.k, roundedToDecimalPlaces: 2, "Key components are not equal")
            
            XCTAssertCGFloatEqual(hsb.cmyk.c, color.c, roundedToDecimalPlaces: 2, "Cyan components are not equal")
            XCTAssertCGFloatEqual(hsb.cmyk.m, color.m, roundedToDecimalPlaces: 2, "Magenta components are not equal")
            XCTAssertCGFloatEqual(hsb.cmyk.y, color.y, roundedToDecimalPlaces: 2, "Yellow components are not equal")
            XCTAssertCGFloatEqual(hsb.cmyk.k, color.k, roundedToDecimalPlaces: 2, "Key components are not equal")
            
            XCTAssertCGFloatEqual(hex.cmyk.c, color.c, roundedToDecimalPlaces: 2, "Cyan components are not equal")
            XCTAssertCGFloatEqual(hex.cmyk.m, color.m, roundedToDecimalPlaces: 2, "Magenta components are not equal")
            XCTAssertCGFloatEqual(hex.cmyk.y, color.y, roundedToDecimalPlaces: 2, "Yellow components are not equal")
            XCTAssertCGFloatEqual(hex.cmyk.k, color.k, roundedToDecimalPlaces: 2, "Key components are not equal")
        }
    }
    
    func testHexColorModel() {
        let hex: [UInt32] = [
            0xFFFF00,
            0xFF8000,
            0xFF0000,
            0x00FF00,
            0x008000,
            0x00FFFF,
            0x0000FF,
            0xAA00FF,
            0xFF00FF,
            0x996600,
            0xFFFFFF,
            0xF3F3F3,
            0xB3B3B3,
            0x676767,
            0x000000
        ]
        
        for color in hex {
            let model = UIColor.Model.hex(color)
            
            let rgb  = UIColor.Model.rgb(model.rgb.r, model.rgb.g, model.rgb.b)
            let hsl  = UIColor.Model.hsl(model.hsl.h, model.hsl.s, model.hsl.l)
            let hsb  = UIColor.Model.hsb(model.hsb.h, model.hsb.s, model.hsb.b)
            let cmyk = UIColor.Model.cmyk(model.cmyk.c, model.cmyk.m, model.cmyk.y, model.cmyk.k)
            
            XCTAssertEqual(rgb.hex, color)
            XCTAssertEqual(rgb.hex, color)
            XCTAssertEqual(rgb.hex, color)
            XCTAssertEqual(rgb.hex, color)
            
            XCTAssertEqual(hsl.hex, color)
            XCTAssertEqual(hsl.hex, color)
            XCTAssertEqual(hsl.hex, color)
            XCTAssertEqual(hsl.hex, color)
            
            XCTAssertEqual(hsb.hex, color)
            XCTAssertEqual(hsb.hex, color)
            XCTAssertEqual(hsb.hex, color)
            XCTAssertEqual(hsb.hex, color)
            
            XCTAssertEqual(cmyk.hex, color)
            XCTAssertEqual(cmyk.hex, color)
            XCTAssertEqual(cmyk.hex, color)
            XCTAssertEqual(cmyk.hex, color)
        }
    }
}

func XCTAssertCGFloatEqual(_ lhs: CGFloat, _ rhs: CGFloat, roundedToDecimalPlaces places: UInt, _ message: String) {
    XCTAssertEqual(lhs.rounded(places: places), rhs.rounded(places: places), message)
}
