//
//  String+Extensions.swift
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

import Foundation

extension String {
    
    /// Converts self to an unsigned byte array.
    public var bytes: [UInt8] {
        return utf8.map { $0 }
    }
    
    /**
     Converts string to camel-case.

     Examples:

     ```
     "os version".camelCasedString                 // "osVersion"
     "HelloWorld".camelCasedString                 // "helloWorld"
     "someword With Characters".camelCasedString   // "somewordWithCharacters"
     ```
     */
    public var camelCasedString: String {
        guard !characters.isEmpty else { return self }
        
        if characters.contains(" ") {
            let first = self[0].lowercaseString
            let cammel = capitalizedString.stringByReplacingOccurrencesOfString(" ", withString: "")
            let rest = String(cammel.characters.dropFirst())
            return first + rest
        } else {
            let first = self[0].lowercaseString
            let rest = String(characters.dropFirst())
            return first + rest
        }
    }
    
    /**
     The base64 encoded version of self.
     Credit: http://stackoverflow.com/a/29365954
     */
    public var base64EncodedString: String? {
        let utf8str = dataUsingEncoding(NSUTF8StringEncoding)
        return utf8str?.base64EncodedStringWithOptions([])
    }
    
    /**
     The decoded value of a base64 encoded string
     Credit: http://stackoverflow.com/a/29365954
     */
    public var base64DecodedString: String? {
        let base64Decoded = NSData(base64EncodedString: self, options: []).flatMap({ String(data: $0, encoding: NSUTF8StringEncoding) })
        return base64Decoded
    }
    
    /**
     Returns true if every character within the string is a numeric character. Empty strings are
     considered non-numeric.
    */
    public var isNumeric: Bool {
        guard !isEmpty else { return false }
        return stringByTrimmingCharactersInSet(.decimalDigitCharacterSet()).isEmpty
    }

    /**
     Replaces all occurences of the pattern on self in-place.

     Examples:

     ```
     "hello".regexInPlace("[aeiou]", "*")      // "h*ll*"
     "hello".regexInPlace("([aeiou])", "<$1>") // "h<e>ll<o>"
     ```
     */
    public mutating func regexInPlace(pattern: String, _ replacement: String) {
        do {
            let expression = try NSRegularExpression(pattern: pattern, options: [])
            let range = NSMakeRange(0, self.characters.count)
            self = expression.stringByReplacingMatchesInString(self, options: [], range: range, withTemplate: replacement)
        }
        catch { return }
    }
    
    /**
     Returns a string containing replacements for all pattern matches.
     
     Examples:
     
     ```
     "hello".regex("[aeiou]", "*")      // "h*ll*"
     "hello".regex("([aeiou])", "<$1>") // "h<e>ll<o>"
     ```
     */
    public func regex(pattern: String, _ replacement: String) -> String {
        var replacementString = self
        replacementString.regexInPlace(pattern, replacement)
        return replacementString
    }

    /**
     Replaces pattern-matched strings, operated upon by a closure, on self in-place.

     - parameter pattern: The pattern to match against.
     - parameter matches: The closure in which to handle matched strings.
     
     Example:

     ```
     "hello".regexInPlace(".") {
        let s = $0.unicodeScalars
        let v = s[s.startIndex].value
        return "\(v) "
     }   // "104 101 108 108 111 "
     */
    public mutating func regexInPlace(pattern: String, _ matches: (String) -> String) {

        let expression: NSRegularExpression
        do {
            expression = try NSRegularExpression(pattern: "(\(pattern))", options: [])
        }
        catch {
            print("regex error: \(error)")
            return
        }

        let range = NSMakeRange(0, self.characters.count)

        var startOffset = 0

        let results = expression.matchesInString(self, options: [], range: range)

        for result in results {

            var endOffset = startOffset

            for i in 1..<result.numberOfRanges {
                var resultRange = result.range
                resultRange.location += startOffset

                let startIndex = self.startIndex.advancedBy(resultRange.location)
                let endIndex = self.startIndex.advancedBy(resultRange.location + resultRange.length)
                let replacementRange = startIndex..<endIndex
                
                let match = expression.replacementStringForResult(result, inString: self, offset: startOffset, template: "$\(i)")
                let replacement = matches(match)

                self.replaceRange(replacementRange, with: replacement)

                endOffset += replacement.characters.count - resultRange.length
            }

            startOffset = endOffset
        }
    }
    
    /**
     Returns a string with pattern-matched strings, operated upon by a closure.
     
     - parameter pattern: The pattern to match against.
     - parameter matches: The closure in which to handle matched strings.
     
     - returns: String containing replacements for the matched pattern.
     
     Example:
     
     ```
     "hello".regex(".") {
        let s = $0.unicodeScalars
        let v = s[s.startIndex].value
        return "\(v) "
     }   // "104 101 108 108 111 "
     */
    public func regex(pattern: String, _ matches: (String) -> String) -> String {
        var replacementString = self
        replacementString.regexInPlace(pattern, matches)
        return replacementString
    }

    /// Range for substring
    public func range(substring: String) -> Range<String.Index>? {
        let range = self.startIndex..<self.startIndex.advancedBy(self.characters.count)
        return self.rangeOfString(substring, options: [], range: range, locale: nil)
    }

    /// Substring at index
    public subscript(i: Int) -> String {
        return String(self[startIndex.advancedBy(i)])
    }

    /// Substring for range
    public subscript(r: Range<Int>) -> String {
        return substringWithRange(startIndex.advancedBy(r.startIndex)..<startIndex.advancedBy(r.endIndex))
    }
    
    /**
     Truncates the string to length characters, optionally appending a trailing string. If the string is shorter
     than the required length, then this function is a non-op.
    
    - parameter length:   The length of string required.
    - parameter trailing: An optional addition to the end of the string (increasing "length"), such as ellipsis.
    
    - returns: The truncated string.
    
    Examples:
    
    ```
    "hello there".truncate(5)                   // "hello"
    "hello there".truncate(5, trailing: "...")  // "hello..."
    ```

    */
    public func truncate(length: Int, trailing: String = "") -> String {
        guard !characters.isEmpty && characters.count > length else { return self }
        return self.substringToIndex(startIndex.advancedBy(length)) + trailing
    }
    
    
    /**
     A bridge for invoking `String.localizedStandardContainsString()`, which is available in iOS 9 and later. If you need to
     support iOS versions prior to iOS 9, use `compatibleStandardContainsString()` as a means to bridge functionality.
     If you can support iOS 9 or greater only, use `localizedStandardContainsString()` directly.
     
     From Apple's Swift 2.1 documentation:
     
     `localizedStandardContainsString()` is the most appropriate method for doing user-level string searches, similar to how searches are done generally in the system. The search is locale-aware, case and diacritic insensitive. The exact list of search options applied may change over time.
     
     - parameter string: The string to determine if is contained by self.
     
     - returns: Returns true if self contains string, taking the current locale into account.
     */
    public func compatibleStandardContainsString(string: String) -> Bool {
        if #available(iOS 9.0, *) {
            return localizedStandardContainsString(string)
        }
        return self.rangeOfString(string, options: [.CaseInsensitiveSearch, .DiacriticInsensitiveSearch], locale: NSLocale.currentLocale()) != nil
    }
    
    /**
     Convert an NSRange to a Range. There is still a mismatch between the regular expression libraries
     and NSString/String. This makes it easier to convert between the two. Using this allows complex
     strings (including emoji, regonial indicattors, etc.) to be manipulated without having to resort
     to NSString instances.
     
     Note that it may not always be possible to convert from an NSRange as they are not exactly the same.
     
     Taken from:
     http://stackoverflow.com/questions/25138339/nsrange-to-rangestring-index
     
     - parameter nsRange: The NSRange instance to covert to a Range.
     
     - returns: The Range, if it was possible to convert. Otherwise nil.
     */
    public func rangeFromNSRange(nsRange : NSRange) -> Range<String.Index>? {
        let from16 = utf16.startIndex.advancedBy(nsRange.location, limit: utf16.endIndex)
        let to16 = from16.advancedBy(nsRange.length, limit: utf16.endIndex)
        if let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self) {
            return from ..< to
        }
        return nil
    }
    
    /**
     Convert a Range to an NSRange. There is still a mismatch between the regular expression libraries
     and NSString/String. This makes it easier to convert between the two. Using this allows complex
     strings (including emoji, regonial indicattors, etc.) to be manipulated without having to resort
     to NSString instances.
     
     Taken from:
     http://stackoverflow.com/questions/25138339/nsrange-to-rangestring-index
     
     - parameter range: The Range instance to conver to an NSRange.
     
     - returns: The NSRange converted from the input. This will always succeed.
     */
    public func NSRangeFromRange(range : Range<String.Index>) -> NSRange {
        let utf16view = self.utf16
        let from = String.UTF16View.Index(range.startIndex, within: utf16view)
        let to = String.UTF16View.Index(range.endIndex, within: utf16view)
        return NSMakeRange(utf16view.startIndex.distanceTo(from), from.distanceTo(to))
    }

}
