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
    public static func Scale(sx: CGFloat, _ sy: CGFloat) -> CGAffineTransform {
        return CGAffineTransformMakeScale(sx, sy)
    }
    
    /**
     Returns a transform which scales `self` by `(sx, sy)`. Equivalent to `CGAffineTransformScale(self, sx, sy)`.
     
     - parameter sx: The `x` scale.
     - parameter sy: The `y` scale.
     
     - returns: A transform of `self` scaled by `(sx, sy)`.
     */
    public func Scale(sx: CGFloat, _ sy: CGFloat) -> CGAffineTransform {
        return CGAffineTransformScale(self, sx, sy)
    }
    
    /**
     Scales `self` by `(sx, sy)`, in place.
     
     - parameter sx: The `x` scale.
     - parameter sy: The `y` scale.
     */
    public mutating func ScaleInPlace(sx: CGFloat, _ sy: CGFloat) {
        self = CGAffineTransformScale(self, sx, sy)
    }
    
    // MARK: Translate
    
    /**
    Returns a transform which translates by `(tx, ty)`. Equivalent to `CGAffineTransformMakeTranslation(tx, ty)`.
    
    - parameter tx: The `x` translation.
    - parameter ty: The `y` translation.
    
    - returns: A transform translated by `(tx, ty)`.
    */
    public static func Translate(tx: CGFloat, _ ty: CGFloat) -> CGAffineTransform {
        return CGAffineTransformMakeTranslation(tx, ty)
    }
    
    /**
     Returns a transform which translates `self` by `(tx, ty)`. Equivalent to `CGAffineTransformTranslate(self, tx, ty)`.
     
     - parameter tx: The `x` translation.
     - parameter ty: The `y` translation.
     
     - returns: A transform of `self` translated by `(tx, ty)`.
     */
    public func Translate(tx: CGFloat, _ ty: CGFloat) -> CGAffineTransform {
        return CGAffineTransformTranslate(self, tx, ty)
    }
    
    /**
     Translates `self` by `(tx, ty)`, in place.
     
     - parameter tx: The `x` translation.
     - parameter ty: The `y` translation.
     */
    public mutating func TranslateInPlace(tx: CGFloat, _ ty: CGFloat) {
        self = CGAffineTransformTranslate(self, tx, ty)
    }
    
    // MARK: Rotate
    
    /**
    Returns a transform which rotates by `angle` radians. Equivalent to `CGAffineTransformMakeRotation(angle)`.
    
    - parameter angle: The rotation angle in radians.
    
    - returns: A transform rotated by `angle` radians.
    */
    public static func Rotate(angle: CGFloat) -> CGAffineTransform {
        return CGAffineTransformMakeRotation(angle)
    }
    
    /**
     Returns a transform which rotates `self` by `angle` radians. Equivalent to `CGAffineTransformRotate(self, angle)`.
     
     - parameter angle: The rotation angle in radians.
     
     - returns: A transform of `self` rotated by `angle` radians.
     */
    public func Rotate(angle: CGFloat) -> CGAffineTransform {
        return CGAffineTransformRotate(self, angle)
    }
    
    /**
     Rotates `self` by `angle` radians, in place.
     
     - parameter angle: The rotation angle in radians.
     */
    public mutating func RotateInPlace(angle: CGFloat) {
        self = CGAffineTransformRotate(self, angle)
    }
    
    // MARK: Invert
    
    /**
    Returns a transform which inverts another transform. Equivalent to `CGAffineTransformInvert(transform)`.
    
    - parameter transform: The transform to invert.
    
    - returns: An inverted transform.
    */
    public static func Invert(transform: CGAffineTransform) -> CGAffineTransform {
        return CGAffineTransformInvert(transform)
    }
    
    /**
     Returns a transform which inverts `self`. Equivalent to `CGAffineTransformInvert(self)`.
     
     - returns: The inverse transform of `self`.
     */
    public func Invert() -> CGAffineTransform {
        return CGAffineTransformInvert(self)
    }
    
    /// Inverts `self`, in place.
    public mutating func InvertInPlace() {
        self = CGAffineTransformInvert(self)
    }
    
    // MARK: Identity
    
    /// Returns an identity transform. Equivalent to `CGAffineTransformIdentity`.
    public static func Identity() -> CGAffineTransform {
        return CGAffineTransformIdentity
    }
    
    /// Returns an identity transform. Equivalent to `CGAffineTransformIdentity`.
    public func Identity() -> CGAffineTransform {
        return CGAffineTransformIdentity
    }
    
    /// Performs an identity transform on `self`, in place.
    public mutating func IdentityInPlace() {
        self = CGAffineTransformIdentity
    }
    
    // MARK: Concat
    
    /**
    Returns the concatenation of an array of transforms.
    
    - parameter transforms: The array of transforms to concatenate.
    
    - returns: A concatenation of the array of transforms.
    */
    public static func Concat(transforms: CGAffineTransform...) -> CGAffineTransform {
        var transform = CGAffineTransformIdentity
        transforms.forEach { transform = CGAffineTransformConcat(transform, $0) }
        
        return transform
    }
}

/**
 Concatenates two CGAffineTransforms and returns the result. Equivalent to `CGAffineTransformConcat(lhs, rhs)`.
 
 - parameter lhs: The first transform.
 - parameter rhs: The second transform.
 
 - returns: The concatentation of the two transforms.
 */
public func *(lhs: CGAffineTransform, rhs: CGAffineTransform) -> CGAffineTransform {
    return .Concat(lhs, rhs)
}
