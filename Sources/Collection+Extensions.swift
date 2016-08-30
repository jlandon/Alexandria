//
//  CollectionType+Extensions.swift
//
//  Created by Jonathan Landon on 9/22/15.
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

extension Collection where Self.Index == Self.Indices.Iterator.Element {
    /**
     Returns an optional element. If the `index` does not exist in the collection, the subscript returns nil.
     
     - parameter safe: The index of the element to return, if it exists.
     
     - returns: An optional element from the collection at the specified index.
     */
    public subscript(safe i: Index) -> Self.Iterator.Element? {
        return at(i)
    }
    
    /**
     Returns an optional element. If the `index` does not exist in the collection, the function returns nil.
     
     - parameter index: The index of the element to return, if it exists.
     
     - returns: An optional element from the collection at the specified index.
     */
    public func at(_ i: Index) -> Self.Iterator.Element? {
        return indices.contains(i) ? self[i] : nil
    }
}

public extension Collection {
    
    /**
     Creats a shuffled version of this array using the Fisher-Yates (fast and uniform) shuffle.
     Non-mutating. From http://stackoverflow.com/a/24029847/194869
     
     - returns: A shuffled version of this array.
     */
    public func shuffled() -> [Generator.Element] {
        var list = Array(self)
        list.shuffle()
        return list
    }
}

public extension MutableCollection where Index == Int, IndexDistance == Int {
    /**
     Shuffle the array using the Fisher-Yates (fast and uniform) shuffle. Mutating.
     From http://stackoverflow.com/a/24029847/194869
     */
    public mutating func shuffle() {
        // Empty and single-element collections don't shuffle.
        guard count > 1 else { return }
        
        for i in 0 ..< (count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
    
    /**
     Returns a random element from the collection.
     
     - returns: A random element from the collection.
     */
    public func random() -> Generator.Element {        
        let index = Int(arc4random_uniform(UInt32(count)))
        return self[index]
    }
}
