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
     - parameter hex: The hex component of the color object, specified as a value from 0x000000 to 0xFFFFFF.
     - parameter alpha: The opacity component of the color object, specified as a value from 0.0 to 1.0 (optional).
     - returns: A UIColor initialized with the given color value.
     */
    public convenience init(hex: UInt32, alpha: CGFloat = 1) {
        assert((0...0xFFFFFF).contains(hex), "hex must be a value between 0x000000 and 0xFFFFFF")
        assert((0...1).contains(alpha), "alpha must be a value between 0.0 and 1.0")
        
        let (r, g, b) = Model.hex(hex).rgb
        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
    
    /**
     Returns a UIColor from a hue-saturation-lightness (HSL) set.
     - parameter hue: The hue component of the color object, specified as a value from 0.0 to 1.0.
     - parameter saturation: The saturation component of the color object, specified as a value from 0.0 to 1.0.
     - parameter lightness: The lightness component of the color object, specified as a value from 0.0 to 1.0.
     - parameter alpha: The opacity component of the color object, specified as a value from 0.0 to 1.0 (optional).
     - returns: A UIColor initialized with the given color value.
     */
    public convenience init(hue: CGFloat, saturation: CGFloat, lightness: CGFloat, alpha: CGFloat = 1) {
        assert((0...1).contains(hue), "hue value must be a value between 0.0 and 1.0")
        assert((0...1).contains(saturation), "saturation must be a value between 0.0 and 1.0")
        assert((0...1).contains(lightness), "lightness must be a value between 0.0 and 1.0")
        assert((0...1).contains(alpha), "alpha must be a value between 0.0 and 1.0")
        
        let (r, g, b) = Model.hsl(hue, saturation, lightness).rgb
        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
    
    /**
     Returns a UIColor from a cyan-magenta-yellow-key (CMYK) set.
     - parameter cyan: The cyan component of the color object, specified as a value from 0.0 to 1.0.
     - parameter magenta: The magenta component of the color object, specified as a value from 0.0 to 1.0.
     - parameter yellow: The yellow component of the color object, specified as a value from 0.0 to 1.0.
     - parameter key: The key (black) component of the color object, specified as a value from 0.0 to 1.0.
     - parameter alpha: The opacity component of the color object, specified as a value from 0.0 to 1.0 (optional).
     - returns: A UIColor initialized with the given color value.
     */
    public convenience init(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, key: CGFloat, alpha: CGFloat = 1) {
        assert((0...1).contains(cyan), "cyan value must be a value between 0.0 and 1.0")
        assert((0...1).contains(magenta), "magenta must be a value between 0.0 and 1.0")
        assert((0...1).contains(yellow), "yellow must be a value between 0.0 and 1.0")
        assert((0...1).contains(key), "key must be a value between 0.0 and 1.0")
        assert((0...1).contains(alpha), "alpha must be a value between 0.0 and 1.0")
        
        let (r, g, b) = Model.cmyk(cyan, magenta, yellow, key).rgb
        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
    
    /**
     Returns a UIColor from a given hex color string.
     - parameter hexString: The hex color string, e.g.: "#9443FB" or "9443FB".
     - returns: A UIColor initialized with the color specified by the hexString.
     */
    public convenience init(hexString: String, alpha: CGFloat = 1) {
        var hexString = hexString
        if hexString.hasPrefix("#") {
            hexString = hexString[1...]
        }
        let scanner = Scanner(string: hexString)
        var hexEquivalent: UInt32 = 0
        
        if !scanner.scanHexInt32(&hexEquivalent) {
            assertionFailure("hexString did not contain a valid hex value")
        }
        
        self.init(hex: hexEquivalent, alpha: alpha)
    }
    
    /**
     Returns a UIColor initialized with color components divided by 255.0.
     - parameter red: Integer representation of the red component in range of 0-255.
     - parameter green: Integer representation of the green component in range of 0-255.
     - parameter blue: Integer representation of the blue component in range of 0-255.
    */
    public convenience init(red: UInt8, green: UInt8, blue: UInt8) {
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
    }
    
    /// Returns a random UIColor with hue, saturation, and brightness ranging from 0.5 to 1.0.
    public static var random: UIColor {
        let component = { CGFloat(arc4random() % 128)/256.0 + 0.5 }
        return UIColor(hue: component(), saturation: component(), brightness: component(), alpha: 1)
    }
    
    /**
     Lightens the given color by the given percentage.
     - parameter amount: The percentage by which to lighten the color. Valid values are from `0.0` to `1.0`, or for a more readable format `0%` to `100%`.
     - returns: The lightened color.
     */
    public final func lightened(by amount: CGFloat) -> UIColor {
        assert((0...1).contains(amount), "amount must be in range 0-100%")
        
        let (h, s, l) = hsl
        return UIColor(hue: h, saturation: s, lightness: l * (1 + amount), alpha: rgba.a)
    }
    
    /**
     Darkens the given color by the given percentage.
     - parameter amount: The percentage by which to darken the color. Valid values are from `0.0` to `1.0`, or for a more readable format `0%` to `100%`.
     - returns: The darkened color.
     */
    public final func darkened(by amount: CGFloat) -> UIColor {
        assert((0...1).contains(amount), "amount must be in range 0-100%")
        
        let (h, s, l) = hsl
        return UIColor(hue: h, saturation: s, lightness: l * (1 - amount), alpha: rgba.a)
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
        let (r, g, b, _) = self.rgba
        return Model.rgb(r * 255, g * 255, b * 255).hex
    }
    
    /**
     Returns the RGBA (red, green, blue, alpha) components, specified as values from 0.0 to 1.0.
     - returns: The RGBA components as a tuple (r, g, b, a).
     */
    public final var rgba: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        var (r, g, b, a): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        getRed(&r, green: &g, blue: &b, alpha: &a)
            
        return (r, g, b, a)
    }
    
    /**
     Returns the HSL (hue, saturation, lightness) components, specified as values from 0.0 to 1.0.
     - returns: The HSL components as a tuple (h, s, l).
     */
    public final var hsl: (h: CGFloat, s: CGFloat, l: CGFloat) {
        let (r, g, b, _) = rgba
        return Model.rgb(r * 255, g * 255, b * 255).hsl
    }
    
    /**
     Returns the HSB (hue, saturation, brightness) components, specified as values from 0.0 to 1.0.
     - returns: The HSB components as a tuple (h, s, b).
     */
    public final var hsb: (h: CGFloat, s: CGFloat, b: CGFloat) {
        let (r, g, b, _) = rgba
        return Model.rgb(r * 255, g * 255, b * 255).hsb
    }
    
    /**
     Returns the CMYK (cyan, magenta, yellow, key) components, specified as values from 0.0 to 1.0.
     - returns: The CMYK components as a tuple (c, m, y, k).
     */
    public final var cmyk: (c: CGFloat, m: CGFloat, y: CGFloat, k: CGFloat) {
        let (r, g, b, _) = rgba
        return Model.rgb(r * 255, g * 255, b * 255).cmyk
    }
    
    /**
     Returns an alpha-adjusted UIColor.
     - returns: A UIColor with an adjust alpha component (shorthand for `colorWithAlphaComponent`).
     */
    public final func alpha(_ alpha: CGFloat) -> UIColor {
        return withAlphaComponent(alpha)
    }
    
    /**
     Returns a UIColor from the given hexidecimal integer.
     - parameter hex: The color value.
     - parameter alpha: The alpha component.
     - returns: A UIColor initialized with the given hex value.
     */
    public static func hex(_ hex: UInt32, alpha: CGFloat = 1) -> UIColor {
        return UIColor(hex: hex, alpha: alpha)
    }
    
    /**
     Returns a UIColor from the given RGB components.
     - parameter red: The red component in range of 0-255.
     - parameter green: The green component in range of 0-255.
     - parameter blue: The blue component in range of 0-255.
     - parameter alpha: The alpha component.
     - returns: A UIColor initialized with the given RGB components.
     */
    public static func rgb(_ red: UInt8, _ green: UInt8, _ blue: UInt8, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red, green: green, blue: blue).alpha(alpha)
    }
}

// MARK: - Model

extension UIColor {

    /**
     Model is an enum for describing and converting color models.
     
     - `rgb`: Red, Green, Blue color representation
     - `hsl`: Hue, Saturation, Lightness color representation
     - `hsb`: Hue, Saturation, Brightness color representation
     - `cmyk`: Cyan, Magenta, Yellow, Key (Black) color representation
     - `hex`: UInt32 (hex) color representation
     */
    public enum Model {
        /// Red, Green, Blue
        case rgb(CGFloat, CGFloat, CGFloat)
        /// Hue, Saturation, Lightness
        case hsl(CGFloat, CGFloat, CGFloat)
        /// Hue, Saturation, Brightness
        case hsb(CGFloat, CGFloat, CGFloat)
        /// Cyan, Magenta, Yellow, Key (Black)
        case cmyk(CGFloat, CGFloat, CGFloat, CGFloat)
        /// UInt32 (hex)
        case hex(UInt32)
        
        /// Returns the model as an RGB tuple
        public var rgb: (r: CGFloat, g: CGFloat, b: CGFloat) {
            switch self {
            case .rgb(let rgb):
                return rgb
            case .hsl(let h, let s, let l):
                return convert(hsl: h, s, l)
            case .hsb(let h, let s, let b):
                return convert(hsb: h, s, b)
            case .cmyk(let c, let m, let y, let k):
                return convert(cmyk: c, m, y, k)
            case .hex(let hex):
                return convert(hex: hex)
            }
        }
        
        /// Returns the model as an HSL tuple
        public var hsl: (h: CGFloat, s: CGFloat, l: CGFloat) {
            switch self {
            case .rgb(let r, let g, let b):
                return convert(rgb: r, g, b)
            case .hsl(let hsl):
                return hsl
            case .hsb, .cmyk, .hex:
                let (r, g, b) = self.rgb
                return convert(rgb: r, g, b)
            }
        }
        
        /// Returns the model as an HSB tuple
        public var hsb: (h: CGFloat, s: CGFloat, b: CGFloat) {
            switch self {
            case .rgb(let r, let g, let b):
                return convert(rgb: r, g, b)
            case .hsl, .cmyk, .hex:
                let (r, g, b) = self.rgb
                return convert(rgb: r, g, b)
            case .hsb(let hsb):
                return hsb
            }
        }
        
        /// Returns the model as a CMYK tuple
        public var cmyk: (c: CGFloat, m: CGFloat, y: CGFloat, k: CGFloat) {
            switch self {
            case .rgb(let r, let g, let b):
                return convert(rgb: r, g, b)
            case .hsl, .hsb, .hex:
                let (r, g, b) = self.rgb
                return convert(rgb: r, g, b)
            case .cmyk(let cmyk):
                return cmyk
            }
        }
        
        /// Returns the model as a UInt32 (hex) value
        public var hex: UInt32 {
            switch self {
            case .rgb(let r, let g, let b):
                return convert(rgb: r, g, b)
            case .hsl, .hsb, .cmyk:
                let (r, g, b) = self.rgb
                return convert(rgb: r, g, b)
            case .hex(let hex):
                return hex
            }
        }
    }
}
    
// MARK: - Private color model conversions

/// Converts RGB to HSL (https://en.wikipedia.org/wiki/HSL_and_HSV)
private func convert(rgb r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> (h: CGFloat, s: CGFloat, l: CGFloat) {
    
    let r = r / 255
    let g = g / 255
    let b = b / 255
    
    let max = Swift.max(r, g, b)
    let min = Swift.min(r, g, b)
    
    var h, s: CGFloat
    let l = (max + min) / 2
    
    if max == min {
        h = 0
        s = 0
    }
    else {
        let d = max - min
        s = (l > 0.5) ? d / (2 - max - min) : d / (max + min)
        
        switch max {
        case r:  h = (g - b) / d + (g < b ? 6 : 0)
        case g:  h = (b - r) / d + 2
        case b:  h = (r - g) / d + 4
        default: h = 0
        }
        
        h /= 6;
    }
    
    return (h, s, l)
}

/// Converts HSL to RGB (https://en.wikipedia.org/wiki/HSL_and_HSV)
private func convert(hsl h: CGFloat, _ s: CGFloat, _ l: CGFloat) -> (r: CGFloat, g: CGFloat, b: CGFloat) {
    
    let r, g, b: CGFloat
    
    if s == 0 {
        r = l
        g = l
        b = l
    }
    else {
        let c = (1 - abs(2 * l - 1)) * s
        let x = c * (1 - abs((h * 6).truncatingRemainder(dividingBy: 2) - 1))
        let m = l - c/2
        
        switch h * 6 {
        case 0..<1: (r, g, b) = (c, x, 0) + m
        case 1..<2: (r, g, b) = (x, c, 0) + m
        case 2..<3: (r, g, b) = (0, c, x) + m
        case 3..<4: (r, g, b) = (0, x, c) + m
        case 4..<5: (r, g, b) = (x, 0, c) + m
        case 5..<6: (r, g, b) = (c, 0, x) + m
        default:    (r, g, b) = (0, 0, 0) + m
        }
    }
    
    return (round(r * 255), round(g * 255), round(b * 255))
}

/// Converts RGB to HSB (https://en.wikipedia.org/wiki/HSL_and_HSV)
private func convert(rgb r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> (h: CGFloat, s: CGFloat, b: CGFloat) {
    var h, s, v: CGFloat
    
    let r = r / 255
    let g = g / 255
    let b = b / 255
    
    let max = Swift.max(r, g, b)
    let min = Swift.min(r, g, b)
    let d = max - min
    
    if d == 0 {
        h = 0
        s = 0
    }
    else {
        s = (max == 0) ? 0 : d / max
        
        switch max {
        case r:  h = ((g - b) / d) + (g < b ? 6 : 0)
        case g:  h = ((b - r) / d) + 2
        case b:  h = ((r - g) / d) + 4
        default: h = 0
        }
        
        h /= 6;
    }
    
    v = max
    
    return (h, s, v)
}

/// Converts HSB to RGB (https://en.wikipedia.org/wiki/HSL_and_HSV)
private func convert(hsb h: CGFloat, _ s: CGFloat, _ b: CGFloat) -> (r: CGFloat, g: CGFloat, b: CGFloat) {
    
    let c = b * s
    let x = c * (1 - abs((h * 6).truncatingRemainder(dividingBy: 2) - 1))
    let m = b - c
    
    var r, g, b: CGFloat
    
    switch h * 6 {
    case 0..<1: (r, g, b) = (c, x, 0) + m
    case 1..<2: (r, g, b) = (x, c, 0) + m
    case 2..<3: (r, g, b) = (0, c, x) + m
    case 3..<4: (r, g, b) = (0, x, c) + m
    case 4..<5: (r, g, b) = (x, 0, c) + m
    case 5..<6: (r, g, b) = (c, 0, x) + m
    default:    (r, g, b) = (0, 0, 0) + m
    }
    
    return (round(r * 255), round(g * 255), round(b * 255))
}

/// Converts UInt32 to RGB
private func convert(hex: UInt32) -> (r: CGFloat, g: CGFloat, b: CGFloat) {
    let r = CGFloat((hex >> 16) & 0xFF)
    let g = CGFloat((hex >> 8) & 0xFF)
    let b = CGFloat(hex & 0xFF)
    
    return (r, g, b)
}

/// Converts RGB to UInt32
private func convert(rgb r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UInt32 {
    return (UInt32(r) << 16) | (UInt32(g) << 8) | UInt32(b)
}

/// Converts RGB to CMYK (http://www.rapidtables.com/convert/color/rgb-to-cmyk.htm)
private func convert(rgb r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> (c: CGFloat, m: CGFloat, y: CGFloat, k: CGFloat) {
    let r = r / 255
    let g = g / 255
    let b = b / 255
    
    let k = 1 - max(r, g, b)
    let c = (k == 1) ? 0 : (1 - r - k) / (1 - k)
    let m = (k == 1) ? 0 : (1 - g - k) / (1 - k)
    let y = (k == 1) ? 0 : (1 - b - k) / (1 - k)
    
    return (c, m, y, k)
}

/// Converts CMYK to RGB (http://www.rapidtables.com/convert/color/cmyk-to-rgb.htm)
private func convert(cmyk c: CGFloat, _ m: CGFloat, _ y: CGFloat, _ k: CGFloat) -> (r: CGFloat, g: CGFloat, b: CGFloat) {
    let r = 255 * (1 - c) * (1 - k)
    let g = 255 * (1 - m) * (1 - k)
    let b = 255 * (1 - y) * (1 - k)
    
    return (round(r), round(g), round(b))
}

/// Private operator for HSL and HSB conversion
private func +(lhs: (CGFloat, CGFloat, CGFloat), rhs: CGFloat) -> (CGFloat, CGFloat, CGFloat) {
    return (lhs.0 + rhs, lhs.1 + rhs, lhs.2 + rhs)
}
