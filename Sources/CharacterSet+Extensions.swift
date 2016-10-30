//
//  CharacterSet+Extensions.swift
//
//  Created by hsoi on 11/17/15.
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

/** 
 Extensions to CharacterSet
*/
public extension CharacterSet {
    
    /**
    
     Returns an `CharacterSet` comprised of the Unicode characters for currency symbols, as specified in:
    
        http://unicode.org/charts/PDF/U20A0.pdf
     
     which, at the time of this writing, is based upon The Unicode Standard version 8.0.
     
     According to that specification, the currency symbols fall in the range: 20A0–20CF, along with a handful of other
     symbols in other blocks.
     
     
    - returns: An CharacterSet of currency symbols

    */
    public static var currencySymbols: CharacterSet {        
        let charset = NSMutableCharacterSet.currencySymbols()
        return charset.copy() as! CharacterSet
    }
}

extension CharacterSet: ExpressibleByStringLiteral {
    
    /// Creates a CharacterSet initialized to the given string value.
    public init(stringLiteral value: StringLiteralType) {
        self.init(charactersIn: value)
    }
    
    /// Creates a CharacterSet initialized to the given value.
    public init(extendedGraphemeClusterLiteral value: StringLiteralType) {
        self.init(charactersIn: value)
    }
    
    /// Creates a CharacterSet initialized to the given value.
    public init(unicodeScalarLiteral value: StringLiteralType) {
        self.init(charactersIn: value)
    }
}


/**
 Extensions to NSMutableCharacterSet
 */
public extension NSMutableCharacterSet {
    
    /**
     
     Returns an `NSMutableCharacterSet` comprised of the Unicode characters for currency symbols, as specified in:
     
     http://unicode.org/charts/PDF/U20A0.pdf
     
     which, at the time of this writing, is based upon The Unicode Standard version 8.0.
     
     According to that specification, the currency symbols fall in the range: 20A0–20CF, along with a handful of other
     symbols in other blocks.
     
     
     - returns: An NSMutableCharacterSet of currency symbols
     
    */
    public class func currencySymbols() -> NSMutableCharacterSet {
        let charset = NSMutableCharacterSet()
        
        // http://unicode.org/charts/PDF/U20A0.pdf
        // http://www.alanwood.net/unicode/currency_symbols.html
        let otherSymbols = "\u{0024}\u{00A2}\u{00A3}\u{00A4}\u{00A5}\u{0192}\u{058F}\u{060B}\u{09F2}\u{09F3}\u{0AF1}\u{0BF9}\u{0E3F}\u{17DB}\u{2133}\u{3350}\u{5143}\u{5186}\u{5706}\u{570E}\u{5713}\u{571C}\u{A838}\u{C6D0}\u{FDFC}\u{FF04}\u{FFE0}\u{FFE1}\u{FFE5}\u{FFE6}\u{1F4B2}"
        charset.addCharacters(in: otherSymbols)
        
        let range = NSRange(location: 0x20A0, length: 0x20CF - 0x20A0 + 1)
        charset.addCharacters(in: range)
        
        return charset
    }
}
