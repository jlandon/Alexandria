//
//  UIScreen+Extensions.swift
//
//  Created by John C. "Hsoi" Daub (john.daub@ovenbits.com, hsoi@hsoienterprises.com) on 2014-10-09.
//
//  Extensions to the UIScreen class.
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

extension UIScreen {
    
    /// The center of the screen
    public var center: CGPoint {
        return CGPoint(x: width/2, y: height/2)
    }
    
    /// The width of the screen
    public var width: CGFloat {
        return bounds.width
    }
    
    /// The height of the screen
    public var height: CGFloat {
        return bounds.height
    }
    
    /// The center of the main screen
    public static var mainCenter: CGPoint {
        return UIScreen.mainScreen().center
    }
    
    /// The width of the main screen
    public static var mainWidth: CGFloat {
        return UIScreen.mainScreen().width
    }
    
    /// The height of the main screen
    public static var mainHeight: CGFloat {
        return UIScreen.mainScreen().height
    }
}
