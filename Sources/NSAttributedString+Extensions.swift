//
//  NSAttributedString+Extensions.swift
//
//  Created by Ben Kreeger on 12/11/15.
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

extension NSAttributedString {
    /**
    Returns a new mutable string with characters from a given character set removed.

    See http://panupan.com/2012/06/04/trim-leading-and-trailing-whitespaces-from-nsmutableattributedstring/

    - Parameters:
      - charSet: The character set with which to remove characters.
    - returns: A new string with the matching characters removed.
    */
    public func attributedStringByTrimmingCharacterSet(charSet: NSCharacterSet) -> NSAttributedString {
        let modString = NSMutableAttributedString(attributedString: self)
        modString.trimCharactersInSet(charSet)
        return NSAttributedString(attributedString: modString)
    }
}


extension NSMutableAttributedString {
    /**
    Modifies this instance of the string to remove characters from a given character set from
    the beginning and end of the string.

    See http://panupan.com/2012/06/04/trim-leading-and-trailing-whitespaces-from-nsmutableattributedstring/

    - Parameters:
      - charSet: The character set with which to remove characters.
    */
    public func trimCharactersInSet(charSet: NSCharacterSet) {
        var range = (string as NSString).rangeOfCharacterFromSet(charSet)

        // Trim leading characters from character set.
        while range.length != 0 && range.location == 0 {
            replaceCharactersInRange(range, withString: "")
            range = (string as NSString).rangeOfCharacterFromSet(charSet)
        }

        // Trim trailing characters from character set.
        range = (string as NSString).rangeOfCharacterFromSet(charSet, options: .BackwardsSearch)
        while range.length != 0 && NSMaxRange(range) == length {
            replaceCharactersInRange(range, withString: "")
            range = (string as NSString).rangeOfCharacterFromSet(charSet, options: .BackwardsSearch)
        }
    }

}


extension NSMutableAttributedString {
    
    /**
     Applies the given font over the whole string.
     
     - parameter font: The font to apply.
     */
    public func addFont(font: UIFont) {
        self.addAttribute(NSFontAttributeName, value: font, range: NSMakeRange(0, self.length))
    }
    
    
    /**
     Applies the given text alignment over the whole string.
     
     - parameter alignment: The alignment to apply.
     */
    public func addAlignment(alignment: NSTextAlignment) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        self.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, self.length))
    }
    
    
    /**
     Applies the given color over the whole string, as the foreground color.
     
     - parameter color: The color to apply.
     */
    public func addForegroundColor(color: UIColor) {
        self.addAttribute(NSForegroundColorAttributeName, value: color, range: NSMakeRange(0, self.length))
    }
    
    
    /**
     Applies a single underline under the whole string.
     
     - parameter style: The `NSUnderlineStyle` to apply. Defaults to `.StyleSingle`.
     */
    public func addUnderline(style: NSUnderlineStyle = .StyleSingle) {
        self.addAttribute(NSUnderlineStyleAttributeName, value: style.rawValue, range: NSMakeRange(0, self.length))
    }

}