//
//  CoreGraphics+Extensions.swift
//
//  Created by Jonathan Landon on 12/6/15.
//
//  Inspired by: http://bandes-stor.ch/blog/2015/11/28/help-yourself-to-some-swift/
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

import UIKit

extension CGContext {
    /// The current graphics context
    public static func currentContext() -> CGContext? {
        return UIGraphicsGetCurrentContext()
    }
}

@available(iOS 9.0, *)
extension CGColorSpace {
    
    /// CGColorSpace for the generic CMYK color space.
    public static let GenericCMYK = CGColorSpaceCreateWithName(kCGColorSpaceGenericCMYK)
    
    /// CGColorSpace for the Adobe RGB (1998) color space.
    public static let AdobeRGB1998 = CGColorSpaceCreateWithName(kCGColorSpaceAdobeRGB1998)
    
    /// CGColorSpace for the SRGB color space.
    public static let SRGB = CGColorSpaceCreateWithName(kCGColorSpaceSRGB)
    
    /// CGColorSpace for the generic gray color space with a gamma value of 2.2.
    public static let GenericGrayGamma2_2 = CGColorSpaceCreateWithName(kCGColorSpaceGenericGrayGamma2_2)
    
    /// CGColorSpace for the generic gray color space.
    public static let GenericGray = CGColorSpaceCreateWithName(kCGColorSpaceGenericGray)
    
    /// CGColorSpace for the generic RGB color space.
    public static let GenericRGB = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB)
    
    /// CGColorSpace for the generic linear RGB color space.
    public static let GenericRGBLinear = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGBLinear)
    
    /// CGColorSpace for the generic XYZ color space.
    public static let GenericXYZ = CGColorSpaceCreateWithName(kCGColorSpaceGenericXYZ)
    
    /// CGColorSpace for the linear ACESCG color space.
    public static let ACESCGLinear = CGColorSpaceCreateWithName(kCGColorSpaceACESCGLinear)
    
    /// CGColorSpace for the ITUR_709 color space.
    public static let ITUR_709 = CGColorSpaceCreateWithName(kCGColorSpaceITUR_709)
    
    /// CGColorSpace for the ITUR_2020 color space.
    public static let ITUR_2020 = CGColorSpaceCreateWithName(kCGColorSpaceITUR_2020)
    
    /// CGColorSpace for the ROMMRGB color space.
    public static let ROMMRGB = CGColorSpaceCreateWithName(kCGColorSpaceROMMRGB)
}
