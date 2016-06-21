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

extension AttributedString {
    /**
    Returns a new mutable string with characters from a given character set removed.

    See http://panupan.com/2012/06/04/trim-leading-and-trailing-whitespaces-from-nsmutableattributedstring/

    - Parameters:
      - charSet: The character set with which to remove characters.
    - returns: A new string with the matching characters removed.
    */
    public func trimmingCharacters(in set: CharacterSet) -> AttributedString {
        let modString = NSMutableAttributedString(attributedString: self)
        modString.trimCharacters(in: set)
        return AttributedString(attributedString: modString)
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
    public func trimCharacters(in set: CharacterSet) {
        var range = (string as NSString).rangeOfCharacter(from: set)

        // Trim leading characters from character set.
        while range.length != 0 && range.location == 0 {
            replaceCharacters(in: range, with: "")
            range = (string as NSString).rangeOfCharacter(from: set)
        }

        // Trim trailing characters from character set.
        range = (string as NSString).rangeOfCharacter(from: set, options: .backwardsSearch)
        while range.length != 0 && NSMaxRange(range) == length {
            replaceCharacters(in: range, with: "")
            range = (string as NSString).rangeOfCharacter(from: set, options: .backwardsSearch)
        }
    }

}


extension NSMutableAttributedString {
    
    /**
     Applies the given font over the whole string.
     
     - parameter font: The font to apply.
     */
    public func addFont(_ font: UIFont) {
        addAttribute(NSFontAttributeName, value: font, range: NSRange(location: 0, length: length))
    }
    
    
    /**
     Applies the given text alignment over the whole string.
     
     - parameter alignment: The alignment to apply.
     */
    public func addAlignment(_ alignment: NSTextAlignment) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: length))
    }
    
    
    /**
     Applies the given color over the whole string, as the foreground color.
     
     - parameter color: The color to apply.
     */
    public func addForegroundColor(_ color: UIColor) {
        addAttribute(NSForegroundColorAttributeName, value: color, range: NSRange(location: 0, length: length))
    }
    
    
    /**
     Applies a single underline under the whole string.
     
     - parameter style: The `NSUnderlineStyle` to apply. Defaults to `.StyleSingle`.
     */
    public func addUnderline(style: NSUnderlineStyle = .styleSingle) {
        addAttribute(NSUnderlineStyleAttributeName, value: style.rawValue, range: NSRange(location: 0, length: length))
    }

}
