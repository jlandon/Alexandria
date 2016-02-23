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
    
    // Hsoi 2014-10-09 - iOS 8 changed such things regarding view geometry are now
    // orientation-dependent. Thus where under iOS 7 the +[[UIScreen mainScreen] bounds] would
    // result in:
    //
    //  Portrait:   width: 320.0,   height: 568.00
    //  Landscape:  width: 320.0,   height: 568.00
    //
    // (against the [[UIApplication sharedApplication] statusBarOrientation], so UIInterfaceOrientation)
    //
    // in iOS8 you get:
    //
    //  Portrait:   width: 320.0,   height: 568.0
    //  Landscape:  width: 568.0    height: 320.0
    //
    // Based upon: http://stackoverflow.com/questions/24150359/is-uiscreen-mainscreen-bounds-size-becoming-orientation-dependent-in-ios8
    // we have this category extension method of +ONE_size to get the height/width of the +[UIScreen mainScreen]
    // that should fit expectation regarding screen width and height relative to orientation and OS version.
    //
    // Thus, regardless of OS version, what you get is:
    //
    //  Portrait:   width: 320.0,   height: 568.0
    //  Landscape:  width: 568.0    height: 320.0

    // TODO: Hsoi 2015-01-21 - Convert to a class variable, when Swift supports them.
    //
    // I originally wrote this functionality in Objective-C and wrote it as a class method so you could just
    // `+[UIScreen orientedSize]` and be done with it (since on iOS we generally only care about the mainScreen).
    // When converting to Swift, I figured the right thing would be to make this a computed read-only property, but
    // then it would need to be a class variable, which Swift doesn't yet support. So for now, it's a class func.
    
    public class func orientedSize() -> CGSize {
        var screenSize = UIScreen.mainScreen().bounds.size
        let interfaceOrientation = UIApplication.sharedApplication().statusBarOrientation
        if (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape(interfaceOrientation) {
            screenSize = CGSizeMake(screenSize.height, screenSize.width)
        }
        return screenSize
    }
    
    /// The center of the screen
    public var center: CGPoint {
        return CGPoint(x: width/2, y: height/2)
    }
    
    /// The width of the screen
    public var width: CGFloat {
        return CGRectGetWidth(self.bounds)
    }
    
    /// The height of the screen
    public var height: CGFloat {
        return CGRectGetHeight(self.bounds)
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