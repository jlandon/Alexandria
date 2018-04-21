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
    
    /// Converts self to an NSMutableAttributedString.
    public var attributed: NSMutableAttributedString {
        return NSMutableAttributedString(string: self)
    }
    
    /// Converts self to an NSString.
    public var ns: NSString {
        return self as NSString
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
    public var camelCased: String {
        guard !isEmpty else { return self }
        
        if contains(" ") {
            let first = self[0].lowercased()
            let cammel = capitalized.replacingOccurrences(of: " ", with: "")
            let rest = String(cammel.dropFirst())
            return first + rest
        } else {
            let first = self[0].lowercased()
            let rest = String(dropFirst())
            return first + rest
        }
    }
    
    /**
     The base64 encoded version of self.
     Credit: http://stackoverflow.com/a/29365954
     */
    public var base64Encoded: String? {
        let utf8str = data(using: .utf8)
        return utf8str?.base64EncodedString()
    }
    
    /**
     The decoded value of a base64 encoded string
     Credit: http://stackoverflow.com/a/29365954
     */
    public var base64Decoded: String? {
        guard let data = Data(base64Encoded: self, options: []) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    /**
     Returns true if every character within the string is a numeric character. Empty strings are
     considered non-numeric.
    */
    public var isNumeric: Bool {
        guard !isEmpty else { return false }
        return trimmingCharacters(in: .decimalDigits).isEmpty
    }

    /**
     Replaces all occurences of the pattern on self in-place.

     Examples:

     ```
     "hello".regexInPlace("[aeiou]", "*")      // "h*ll*"
     "hello".regexInPlace("([aeiou])", "<$1>") // "h<e>ll<o>"
     ```
     */
    public mutating func formRegex(_ pattern: String, _ replacement: String) {
        do {
            let expression = try NSRegularExpression(pattern: pattern, options: [])
            let range = NSRange(location: 0, length: count)
            self = expression.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: replacement)
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
    public func regex(_ pattern: String, _ replacement: String) -> String {
        var replacementString = self
        replacementString.formRegex(pattern, replacement)
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
    public mutating func formRegex(_ pattern: String, _ matches: (String) -> String) {

        let expression: NSRegularExpression
        do {
            expression = try NSRegularExpression(pattern: "(\(pattern))", options: [])
        }
        catch {
            print("regex error: \(error)")
            return
        }

        let range = NSMakeRange(0, self.count)

        var startOffset = 0

        let results = expression.matches(in: self, options: [], range: range)

        for result in results {

            var endOffset = startOffset

            for i in 1..<result.numberOfRanges {
                var resultRange = result.range
                resultRange.location += startOffset

                let startIndex = self.index(self.startIndex, offsetBy: resultRange.location)
                let endIndex = self.index(self.startIndex, offsetBy: resultRange.location + resultRange.length)
                let replacementRange = startIndex ..< endIndex
                
                let match = expression.replacementString(for: result, in: self, offset: startOffset, template: "$\(i)")
                let replacement = matches(match)

                self.replaceSubrange(replacementRange, with: replacement)

                endOffset += replacement.count - resultRange.length
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
    public func regex(_ pattern: String, _ matches: (String) -> String) -> String {
        var replacementString = self
        replacementString.formRegex(pattern, matches)
        return replacementString
    }

    /// Substring at index
    public subscript(i: Int) -> String {
        let index = safeIndex(offset: i)
        let contains = index.flatMap(indices.contains) ?? false
        
        return contains ? String(self[index!]) : ""
    }
    
    /// Substring for range
    public subscript(r: Range<Int>) -> String {
        return self[r.lowerBound ... (r.upperBound - 1)]
    }
    
    /// Substring for closed range
    public subscript(r: ClosedRange<Int>) -> String {
        let startIndex = safeIndex(offset: r.lowerBound)
        let endIndex = safeIndex(offset: r.upperBound)
        
        let containsStart = startIndex.flatMap(indices.contains) ?? false
        let containsEnd = endIndex.flatMap(indices.contains) ?? false
        
        switch (containsStart, containsEnd) {
        case (true, true):   return String(self[startIndex! ... endIndex!])
        case (true, false):  return String(self[startIndex!...])
        case (false, true):  return String(self[...endIndex!])
        case (false, false): return ""
        }
    }
    
    /// Substring for countable partial range
    public subscript(r: CountablePartialRangeFrom<Int>) -> String {
        let index = safeIndex(offset: r.lowerBound)
        let contains = index.flatMap(indices.contains) ?? false
        
        return contains ? String(self[index!...]) : ""
    }
    
    /// Substring for partial range through upper bound
    public subscript(r: PartialRangeThrough<Int>) -> String {
        let index = safeIndex(offset: r.upperBound)
        let contains = index.flatMap(indices.contains) ?? false
        
        return contains ? String(self[...index!]) : ""
    }
    
    /// Substring for partial range up to upper bound
    public subscript(r: PartialRangeUpTo<Int>) -> String {
        let index = safeIndex(offset: r.upperBound)
        let contains = index.flatMap(indices.contains) ?? false
        
        return contains ? String(self[..<index!]) : ""
    }
    
    /**
     Truncates the string to length characters, optionally appending a trailing string. If the string is shorter
     than the required length, then this function is a non-op.
    
    - parameter length:   The length of string required.
    - parameter trailing: An optional addition to the end of the string (increasing "length"), such as ellipsis.
    
    - returns: The truncated string.
    
    Examples:
    
    ```
    "hello there".truncated(to: 5)                   // "hello"
    "hello there".truncated(to: 5, trailing: "...")  // "hello..."
    ```

    */
    public func truncated(to length: Int, trailing: String = "") -> String {
        guard !isEmpty && count > length else { return self }
        return self[..<length] + trailing
    }
    
    public mutating func truncate(to length: Int, trailing: String = "") {
        self = truncated(to: length, trailing: trailing)
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
    public func compatibleStandardContains(_ string: String) -> Bool {
        if #available(iOS 9.0, *) {
            return localizedStandardContains(string)
        }
        return range(of: string, options: [.caseInsensitive, .diacriticInsensitive], locale: .current) != nil
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
    public func range(from nsRange: NSRange) -> Range<String.Index>? {
        return Range(nsRange, in: self)
    }
    
    /**
     Convert a Range to an NSRange. There is still a mismatch between the regular expression libraries
     and NSString/String. This makes it easier to convert between the two. Using this allows complex
     strings (including emoji, regonial indicators, etc.) to be manipulated without having to resort
     to NSString instances.
     
     Taken from:
     http://stackoverflow.com/questions/25138339/nsrange-to-rangestring-index
     
     - parameter range: The Range instance to conver to an NSRange.
     
     - returns: The NSRange converted from the input. This will always succeed.
     */
    public func nsRange(from range: Range<String.Index>) -> NSRange {
        return NSRange(range, in: self)
    }

}

private extension String {
    
    func safeIndex(offset: Int) -> String.Index? {
        return index(startIndex, offsetBy: offset.limited(0, .max), limitedBy: endIndex)
    }
    
}
