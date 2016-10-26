//
//  URL+Extensions.swift
//  Alexandria
//
//  Created by Jonathan Landon on 10/25/16.
//
//

import Foundation

extension URL: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        guard let url = URL(string: value) else { fatalError("Could not create URL from: \(value)") }
        self = url
    }
    
    public init(extendedGraphemeClusterLiteral value: StringLiteralType) {
        guard let url = URL(string: value) else { fatalError("Could not create URL from: \(value)") }
        self = url
    }
    
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
