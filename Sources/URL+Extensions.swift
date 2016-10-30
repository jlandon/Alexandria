//
//  URL+Extensions.swift
//
//  Created by Jonathan Landon on 10/25/16.
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

extension URL: ExpressibleByStringLiteral {
    /// Creates a URL initialized to the given string value.
    public init(stringLiteral value: StringLiteralType) {
        guard let url = URL(string: value) else { fatalError("Could not create URL from: \(value)") }
        self = url
    }
    
    /// Creates a URL initialized to the given value.
    public init(extendedGraphemeClusterLiteral value: StringLiteralType) {
        guard let url = URL(string: value) else { fatalError("Could not create URL from: \(value)") }
        self = url
    }
    
    /// Creates a URL initialized to the given value.
    public init(unicodeScalarLiteral value: StringLiteralType) {
        guard let url = URL(string: value) else { fatalError("Could not create URL from: \(value)") }
        self = url
    }
}

/**
 Append a path component to a url. Equivalent to `lhs.appendingPathComponent(rhs)`.
 
 - parameter lhs: The url.
 - parameter rhs: The path component to append.
 - returns: The original url with the appended path component.
 */
public func +(lhs: URL, rhs: String) -> URL {
    return lhs.appendingPathComponent(rhs)
}
