//
//  CGAffineTransform+Extensions.swift
//
//  Created by Jonathan Landon on 12/14/15.
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

extension CGAffineTransform {
    
    // MARK: Scale
    
    /**
    Returns a transform which scales by `(sx, sy)`. Equivalent to `CGAffineTransformMakeScale(sx, sy)`.
    
    - parameter sx: The `x` scale.
    - parameter sy: The `y` scale.
    
    - returns: A transform scaled by `(sx, sy)`.
    */
    public static func scale(_ sx: CGFloat, _ sy: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(scaleX: sx, y: sy)
    }
    
    // MARK: Translate
    
    /**
    Returns a transform which translates by `(tx, ty)`. Equivalent to `CGAffineTransformMakeTranslation(tx, ty)`.
    
    - parameter tx: The `x` translation.
    - parameter ty: The `y` translation.
    
    - returns: A transform translated by `(tx, ty)`.
    */
    public static func translate(_ tx: CGFloat, _ ty: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(translationX: tx, y: ty)
    }
    
    // MARK: Rotate
    
    /**
    Returns a transform which rotates by `angle` radians. Equivalent to `CGAffineTransformMakeRotation(angle)`.
    
    - parameter angle: The rotation angle in radians.
    
    - returns: A transform rotated by `angle` radians.
    */
    public static func rotate(_ angle: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(rotationAngle: angle)
    }
    
    // MARK: Invert
    
    /**
    Returns a transform which inverts another transform. Equivalent to `CGAffineTransformInvert(transform)`.
    
    - parameter transform: The transform to invert.
    
    - returns: An inverted transform.
    */
    public static func invert(_ transform: CGAffineTransform) -> CGAffineTransform {
        return transform.inverted()
    }
    
    // MARK: Concat
    
    /**
    Returns the concatenation of an array of transforms.
    
    - parameter transforms: The array of transforms to concatenate.
    
    - returns: A concatenation of the array of transforms.
    */
    public static func concat(_ transforms: CGAffineTransform...) -> CGAffineTransform {
        var transform: CGAffineTransform = .identity
        transforms.forEach { transform = transform.concatenating($0) }
        
        return transform
    }
    
    /**
     Concatenates two CGAffineTransforms and returns the result. Equivalent to `CGAffineTransformConcat(lhs, rhs)`.
     
     - parameter lhs: The first transform.
     - parameter rhs: The second transform.
     
     - returns: The concatentation of the two transforms.
     */
    public static func *(lhs: CGAffineTransform, rhs: CGAffineTransform) -> CGAffineTransform {
        return .concat(lhs, rhs)
    }

}
