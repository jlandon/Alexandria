//
//  CGFloat+Extensions.swift
//
//  Created by Jonathan Landon on 2/9/16.
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

import Foundation

extension CGFloat {
    /// Generate a random CGFloat bounded by a closed interval range.
    public static func random(range: ClosedInterval<CGFloat>) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt64(UINT32_MAX)) * (range.end - range.start) + range.start
    }
    
    /// Generate a random CGFloat bounded by a range from min to max.
    public static func random(min min: CGFloat, max: CGFloat) -> CGFloat {
        return random(min...max)
    }
    
    /**
     Round self to a specified number of decimal places.
     
     - parameter places: The number of decimal places by which to round self.
     - returns: A CGFloat value, rounded to the specified number of decimal places.
     
     Examples:
     ```
     let val: CGFloat = 12.345678
     
     val.rounded(places: 2) // 12.35
     val.rounded(places: 3) // 12.346
     ```
     */
    public func rounded(places places: UInt) -> CGFloat {
        let multiplier = pow(10, CGFloat(places))
        return round(self * multiplier) / multiplier
    }
}