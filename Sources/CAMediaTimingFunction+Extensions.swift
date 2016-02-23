//
//  CAMediaTimingFunction+Extensions.swift
//
//  Created by Jonathan Landon on 12/6/15.
//
//  Inspired by: http://bandes-stor.ch/blog/2015/11/28/help-yourself-to-some-swift/
//
//  The static timing function properties are be initialized lazily the first time 
//  they're accessed. The @nonobjc is required to prevent the compiler from trying 
//  to generate a dynamic accessor for a static (therefore final) property.
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

extension CAMediaTimingFunction {
    
    /// A media timing function for ease-in
    @nonobjc public static let EaseIn = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
    
    /// A media timing function for ease-in and ease-out
    @nonobjc public static let EaseInEaseOut = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    
    /// A media timing function for ease-out.
    @nonobjc public static let EaseOut = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
    
    /// A linear media timing function.
    @nonobjc public static let Linear = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
    
    /**
     Create a CAMediaTimingFunction from the specified control points.
     
     - parameter x1: The x coordinate of the first control point.
     - parameter y1: The y coordinate of the first control point.
     - parameter x2: The x coordinate of the second control point.
     - parameter y2: The y coordinate of the second control point.
     
     - returns: A CAMediaTimingFunction with the specified control points.
     */
    public static func controlPoints(x1: Float, _ y1: Float, _ x2: Float, _ y2: Float) -> CAMediaTimingFunction {
        return .init(controlPoints: x1, y1, x2, y2)
    }
}
