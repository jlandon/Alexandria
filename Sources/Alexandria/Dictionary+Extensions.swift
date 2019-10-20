//
//  Dictionary+Extensions.swift
//
//  Created by Jonathan Landon on 11/19/15.
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

extension Dictionary {
    /**
     Add dictionary to self in-place.
     
     - parameter dictionary: The dictionary to add to self
     */
    public mutating func formUnion(_ dictionary: Dictionary) {
        dictionary.forEach { updateValue($0.1, forKey: $0.0) }
    }
    
    /**
     Return a dictionary containing the union of two dictionaries
     
     - parameter dictionary: The dictionary to add
     - returns: The combination of self and dictionary
     */
    public func union(_ dictionary: Dictionary) -> Dictionary {
        var completeDictionary = self
        completeDictionary.formUnion(dictionary)
        return completeDictionary
    }
}

/**
 Combine the contents of dictionaries into a single dictionary. Equivalent to `lhs.union(rhs)`.
 
 - parameter lhs: The first dictionary.
 - parameter rhs: The second dictionary.
 - returns: The combination of the two input dictionaries
 */
public func +<Key, Value>(lhs: Dictionary<Key, Value>, rhs: Dictionary<Key, Value>) -> Dictionary<Key, Value> {
    return lhs.union(rhs)
}

/**
 Add the contents of one dictionary to another dictionary. Equivalent to `lhs.unionInPlace(rhs)`.
 
 - parameter lhs: The dictionary in which to add key-values.
 - parameter rhs: The dictionary from which to add key-values.
 */
public func +=<Key, Value>(lhs: inout Dictionary<Key, Value>, rhs: Dictionary<Key, Value>) {
    lhs.formUnion(rhs)
}
