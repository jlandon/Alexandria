//
//  UIColor+Extensions.swift
//
//  Created by Jonathan Landon on 4/15/15.
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

extension UIColor {
    
    /**
     Returns a UIColor from the given hexidecimal integer.
     - parameter hex: The color value.
     - returns: A UIColor initialized with the given color value.
     */
    public convenience init(hex: UInt32) {
        let r = (hex >> 16) & 0xFF
        let g = (hex >> 8) & 0xFF
        let b = hex & 0xFF
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
    }
    
    /**
     Returns a UIColor from a given hex color string.
     - parameter hexString: The hex color string, e.g.: "#9443FB" or "9443FB". The leading "#" is recommended but optional.
     - returns: A UIColor initialized with the color specified by the hexString. In the event of an invalid hexString, including nil, it will attempt to return some sort of valid UIColor (perhaps black) but may return nil; all depends on the particulars of the given string.
     */
    public convenience init(hexString: String) {
        var mutableHexString = hexString
        if mutableHexString.hasPrefix("#") {
            mutableHexString = hexString.substringFromIndex(mutableHexString.startIndex.advancedBy(1))
        }
        let scanner = NSScanner(string: mutableHexString)
        var hexEquivalent: UInt32 = 0
        scanner.scanHexInt(&hexEquivalent)
        
        self.init(hex: hexEquivalent)
    }
    
    /**
     Returns a UIColor initialized with color components divided by 255.0.
     - parameter red: Integer representation of the red component in range of 0-255
     - parameter green: Integer representation of the green component in range of 0-255
     - parameter blue: Integer representation of the blue component in range of 0-255
    */
    public convenience init(red: UInt8, green: UInt8, blue: UInt8) {
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
    }
    
    /// Returns a random UIColor with hue, saturation, and brightness ranging from 0.5 to 1.0.
    public static func randomColor() -> UIColor {
        let component = { CGFloat(arc4random() % 128)/256.0 + 0.5 }
        return UIColor(hue: component(), saturation: component(), brightness: component(), alpha: 1)
    }
    
    /**
     Lightens the given color by the given percentage.
     - parameter amount: The percentage to lighten the color by. Valid values are from 0.0 to 1.0.
     - returns: The lightened color.
     */
    public final func lighterColorByPercentage(amount: CGFloat) -> UIColor {
        var hue: CGFloat = 1.0
        var saturation: CGFloat = 1.0
        var brightness: CGFloat = 1.0
        var alpha: CGFloat = 1.0
        
        self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        
        return UIColor(hue: hue, saturation: saturation, brightness: min(brightness * (1 + amount), 1.0), alpha: alpha)
    }
    
    /**
     Darkens the given color by the given percentage.
     - parameter amount: The percentage to darken the color by. Valid values are from 0.0 to 1.0.
     - returns: The darkened color.
     */
    public final func darkerColorByPercentage(amount: CGFloat) -> UIColor {
        var hue: CGFloat = 1.0
        var saturation: CGFloat = 1.0
        var brightness: CGFloat = 1.0
        var alpha: CGFloat = 1.0
        
        self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness * (1 - amount), alpha: alpha)
    }
    
    /**
     Returns the color represenation as a hexadecimal string, prefixed with '#'.
     - returns: The hexadecimal string representation of the color.
     */
    public final var hexString: String {
        return String(format:"#%06x", hex)
    }
    
    /**
     Returns the color representation as a 32-bit integer.
     - returns: A UInt32 that represents the hexadecimal color.
     */
    public final var hex: UInt32 {
        let rgba = RGBAComponents
        
        let red   = (UInt32)(rgba.r * 255) << 16
        let green = (UInt32)(rgba.g * 255) << 8
        let blue  = (UInt32)(rgba.b * 255)
        
        return red | green | blue
    }
    
    /**
     Returns the RGBA (red, green, blue, alpha) components.
     - returns: The RGBA components as a tuple (r, g, b, a).
     */
    public final var RGBAComponents: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        var (r, g, b, a): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        getRed(&r, green: &g, blue: &b, alpha: &a)
            
        return (r, g, b, a)
    }
    
    /**
     Returns the red component.
     - returns: The red component as a CGFloat.
     */
    public final var redComponent: CGFloat {
        return RGBAComponents.r
    }
    
    /**
     Returns the green component.
     - returns: The green component as a CGFloat.
     */
    public final var greenComponent: CGFloat {
        return RGBAComponents.g
    }
    
    /**
     Returns the blue component.
     - returns: The blue component as a CGFloat.
     */
    public final var blueComponent: CGFloat {
        return RGBAComponents.b
    }
    
    /**
     Returns the alpha component.
     - returns: The alpha component as a CGFloat.
     */
    public final var alphaComponent: CGFloat {
        return RGBAComponents.a
    }
    
    /**
     Returns an alpha-adjusted UIColor.
     - returns: A UIColor with an adjust alpha component (shorthand for `colorWithAlphaComponent`).
     */
    public final func alpha(alpha: CGFloat) -> UIColor {
        return colorWithAlphaComponent(alpha)
    }
    
    /**
     Returns a UIColor from the given hexidecimal integer.
     - parameter hex: The color value.
     - returns: A UIColor initialized with the given hex value.
     */
    public static func hex(hex: UInt32) -> UIColor {
        return UIColor(hex: hex)
    }
}
