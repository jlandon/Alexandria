//
//  UIImage+Extensions.swift
//
//  Created by John C. "Hsoi" Daub (john.daub@ovenbits.com, hsoi@hsoienterprises.com) on 2014-11-04.
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

extension UIImage {

    /**
     Returns a copy of self, tinted by the given color.
     
     - parameter tintColor: The UIColor to tint by.
     - returns: A copy of self, tinted by the tintColor.
     */
    public func tinted(tintColor: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.mainScreen().scale)

        let context = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)

        tintColor.setFill()

        CGContextTranslateCTM(context, 0.0, size.height)
        CGContextScaleCTM(context, 1.0, -1.0)

        CGContextSetBlendMode(context, .Normal)
        let rect = CGRectMake(0.0, 0.0, size.width, size.height)
        CGContextDrawImage(context, rect, CGImage)

        CGContextClipToMask(context, rect, CGImage)
        CGContextAddRect(context, rect)
        CGContextDrawPath(context, .Fill)

        let coloredImage = UIGraphicsGetImageFromCurrentImageContext()

        CGContextRestoreGState(context)
        UIGraphicsEndImageContext()

        return coloredImage
    }
    
    /**
     Returns a copy of self, scaled by a specified scale factor (with an optional image orientation).
     
     Example:
     ```
     let image = UIImage(named: <image_name>) // image size = (width: 200, height: 100)
     image?.scaledBy(0.25) // image size = (width: 50, height: 25)
     image?.scaledBy(2)    // image size = (width: 400, height: 200)
     ```
     
     - parameter scaleFactor: The factor at which to scale this image.
     - parameter orientiation: The orientation to use for the scaled image (optional, defaults to the image's `imageOrientation` property).
     - returns: A copy of self, scaled by the scaleFactor (with an optional image orientation).
     */
    public func scaledBy(scaleFactor: CGFloat, withOrientation orientation: UIImageOrientation? = nil) -> UIImage? {
        guard let coreImage = CGImage else { return nil }
        
        return UIImage(CGImage: coreImage, scale: 1/scaleFactor, orientation: orientation ?? imageOrientation)
    }

    /**
    Returns an optional image using the `drawingCommands`

    Example:

        let image = UIImage(size: CGSizeMake(12, 24)) {
            let path = UIBezierPath()
            path.moveToPoint(...)
            path.addLineToPoint(...)
            path.addLineToPoint(...)
            path.lineWidth = 2
            UIColor.whiteColor().setStroke()
            path.stroke()
        }

    - parameter size: The image size.
    - parameter drawingCommands: A closure describing the path, fill/stroke color, etc.
    - returns: An optional image based on `drawingCommands`.
    */
    public convenience init?(size: CGSize, drawingCommands commands: () -> Void) {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        commands()

        defer {
            UIGraphicsEndImageContext()
        }
        if let image = UIGraphicsGetImageFromCurrentImageContext().CGImage {
            self.init(CGImage: image)
            return
        }
        return nil
    }

    /**
    Returns an optional image using the specified color

    - parameter color: The color of the image.
    - returns: An optional image based on `color`.
    */
    public convenience init?(color: UIColor) {
        let size = CGSize(width: 1, height: 1)
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)

        color.setFill()
        UIRectFill(rect)

        defer {
            UIGraphicsEndImageContext()
        }
        if let image = UIGraphicsGetImageFromCurrentImageContext().CGImage {
            self.init(CGImage: image)
            return
        }
        return nil
    }
}
