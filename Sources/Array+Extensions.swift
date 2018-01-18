//
//  Array+Extensions.swift
//
//  Created by Ben Kreeger on 5/19/15.
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

extension Array {
    /**
     Returns an Array containing the results of mapping transform over self. The transform provides not only
     each element of the array but also the index of tha item in the array.
     
     ```
     let items: [SomeObject] = existingArray.mapWithIndex { index, response in
         return SomeObject(index: index, description: response.body)
     }
     ```
     
     - parameter f: The transform that given an element of the array and an index returns an element of type T
     
     - returns: The array created by applying the transform to this array.
     */
    public func mapWithIndex<T>(_ fn: (Int, Element) throws -> T) rethrows -> [T] {
        return try zip(startIndex ..< endIndex, self).map(fn)
    }

    /**
     Rotates an array by the number of places indicated by `shift`.
     
     This is useful for infinitely scrolling visuals, but where the data backing those visuals is finite.
     
     ```
     var array = [1, 2, 3, 4, 5]
     
     let x = array.rotated(by: 2)   // x should be [3, 4, 5, 1, 2]
     let y = array.rotated(by: -2)  // y should be [4, 5, 1, 2, 3]
     ```
     
     - parameter shift: The number of indices by which the array should be shifted. Positive shifts right, negative shifts left.
     
     - returns: Returns the rotated array.
     */
    public func rotated(by shift: Int) -> Array {
        guard !isEmpty else { return [] }
        
        var array = self
        if shift > 0 {
            for _ in 1...shift {
                array.append(array.removeFirst())
            }
        } else if shift < 0 {
            for _ in 1...abs(shift) {
                array.insert(array.removeLast(), at: 0)
            }
        }
        return array
    }
    
    /// Rotates self in-place.
    public mutating func rotate(by shift: Int) {
        self = rotated(by: shift)
    }
}

extension Array where Element: Equatable {
    /**
     Removes and returns the specified element from the array
     
     - parameter element: The element to remove from the array
     - returns: The removed element or nil, if the element was not found
     */
    @discardableResult
    public mutating func remove(_ element: Element) -> Element? {
        guard let index = index(of: element) else { return nil }
        return remove(at: index)
    }
    
    
    /**
     Returns the element before the specified element.
     
     ```
     let foo = [1,2,3]
     let two = foo.before(3)
     let one = foo.before(2)
     let nope = foo.before(1)
     ```
     
     - parameter element: The element to index against.
     - returns: The element before the index element, or nil if there isn't one.
    */
    public func before(_ element: Element) -> Element? {
        guard !isEmpty else { return nil }

        if let index = index(of: element) {
            return at(self.index(before: index))
        }
        return nil
    }
    
    
    /**
     Returns the element after the specified element.
     
     ```
     let foo = [1,2,3]
     let twp = foo.after(1)
     let three = foo.after(2)
     let nope = foo.after(3)
     ```

     - parameter element: The element to index against.
     - returns: The element after the index element, or nil if there isn't one.
     */
    public func after(_ element: Element) -> Element? {
        guard !isEmpty else { return nil }
        
        if let index = index(of: element) {
            return at(self.index(after: index))
        }
        return nil
    }

}

extension Array where Element: Hashable {
    
    /**
     Returns an array containing no duplicates.
     
     #### Performance analysis:
     
     Three implementation were explored:
     
     **Set**
     ```
     public func unique() -> [Element] {
        return Array(Set(self))
     }
     ```
     **Reduce**
     ```
     public func unique() -> [Element] {
        return reduce([]) { !$0.contains($1) ? $0 + [$1] : $0 }
     }
     ```
     **For-Loop**
     ```
     public func unique() -> [Element] {
        var array: [Element] = []
        for element in self where !array.contains(element) {
            array.append(element)
        }
        return array
     }
     ```
     
     Performance tests were run on each implementation to determine which performed best.
     Starting with a 20 element array, we ran `unique()` 10,000 times and measured 
     the execution time. This test was run 5 times. The average execution times are shown below.
     
     Set : 1.082s
     
     Reduce : 1.75s
     
     For-Loop : 0.952s
     
     The performance tests showed that the For-Loop implementation was the most performant. Reduce performed
     poorly, and while the Set implementation achieved similar performance to the For-Loop implementation, the
     order of the elements in the array is not preserved when using a Set.
     
     \* Tests were run using Xcode 7.2 and Swift 2.1.
     */
    public func unique() -> [Element] {
        
        var array: [Element] = []
        
        for element in self where !array.contains(element) {
            array.append(element)
        }
        
        return array
    }
    
    /// Removes duplicates from self in-place.
    public mutating func formUnique() {
        self = unique()
    }
}
