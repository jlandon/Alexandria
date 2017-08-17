//
//  UIFont+Extensions.swift
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

extension UIFont {
    
    public enum Extension {
        case otf
        case ttf
        case woff
        case custom(String)
        
        fileprivate var type: String {
            switch self {
            case .otf:               return "otf"
            case .ttf:               return "ttf"
            case .woff:              return "woff"
            case .custom(let value): return value
            }
        }
    }
    
    /**
     Registers a font for use in the app.
     
     - parameter name: The name of the font family.
     - parameter fileExtension: The extension of the font file.
     - parameter bundle: The bundle in which the font file is located.
     
     - returns: Returns true if registering font is successful.
     
     */
    @discardableResult
    public static func register(name: String, fileExtension: Extension, in bundle: Bundle) -> Bool {
        guard let path = bundle.path(forResource: name, ofType: fileExtension.type) else {
            print("Error registering font: \(name).\(fileExtension.type)")
            return false
        }
        
        return register(filePath: path)
    }
    
    /**
     Registers a font for use in the app.
     
     - parameter filePath: The file path of font.
     
     - returns: Returns true if registering a font is successful.
     
     */
    @discardableResult
    public static func register(filePath: String) -> Bool {
        let url = NSURL(fileURLWithPath: filePath)
        guard let provider = CGDataProvider(url: url as CFURL) else {
            print("Error registering font: \(filePath)")
            return false
        }
        
        let font = CGFont(provider)
        
        var error: Unmanaged<CFError>?
        let result = CTFontManagerRegisterGraphicsFont(font, &error)
        
        if let errorRef = error?.takeRetainedValue() {
            let errorDescription = CFErrorCopyDescription(errorRef)
            print("Failed to load font: \(String(describing: errorDescription)) (\(filePath))")
        }
        
        error?.release()
        
        return result
    }

    /**
     Gets a custom font after registering if needed.
     
     - parameter filePath: The file path of font.
     - ofSize: The size (in points) to which the font is scaled. This value must be greater than 0.0.
     
     - returns: A font object of the specified font file path and size.
     
     */
    public static func customFont(filePath: String, ofSize fontSize: CGFloat) -> UIFont? {
        let url = NSURL(fileURLWithPath: filePath)
        guard let provider = CGDataProvider(url: url as CFURL) else {
            return nil
        }
        
        let cgFont = CGFont(provider)
        guard let postScriptName = cgFont.postScriptName else {
            return nil
        }
        
        let fontName = postScriptName as String
        
        var font = UIFont(name: fontName, size: fontSize)
        
        if font == nil && register(filePath: filePath) == true {
            font = UIFont(name: fontName, size: fontSize)
        }
        
        return font
    }
}
