//
//  Int+Extensions.swift
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

extension Int {
    /// Determine if self is even (equivalent to `self % 2 == 0`)
    public var isEven: Bool {
        return (self % 2 == 0)
    }

    /// Determine if self is odd (equivalent to `self % 2 != 0`)
    public var isOdd: Bool {
        return (self % 2 != 0)
    }
    
    /// Determine if self is positive (equivalent to `self > 0`)
    public var isPositive: Bool {
        return (self > 0)
    }
    
    /// Determine if self is negative (equivalent to `self < 0`)
    public var isNegative: Bool {
        return (self < 0)
    }
    
    /**
     Convert self to a Double.
     
     Most useful when operating on Int optionals.
     
     For example:
     ```
     let number: Int? = 5
     
     // instead of
     var double: Double?
     if let number = number {
        double = Double(number)
     }
     
     // use
     let double = number?.toDouble
     ```
     */
    public var toDouble: Double {
        return Double(self)
    }
    
    /**
     Convert self to a Float.
     
     Most useful when operating on Int optionals.
     
     For example:
     ```
     let number: Int? = 5
     
     // instead of
     var float: Float?
     if let number = number {
        float = Float(number)
     }
     
     // use
     let float = number?.toFloat
     ```
     */
    public var toFloat: Float {
        return Float(self)
    }
    
    /**
     Convert self to a CGFloat.
     
     Most useful when operating on Int optionals.
     
     For example:
     ```
     let number: Int? = 5
     
     // instead of
     var cgFloat: CGFloat?
     if let number = number {
        cgFloat = CGFloat(number)
     }
     
     // use
     let cgFloat = number?.toCGFloat
     ```
     */
    public var toCGFloat: CGFloat {
        return CGFloat(self)
    }
    
    /**
     Convert self to a String.
     
     Most useful when operating on Int optionals.
     
     For example:
     ```
     let number: Int? = 5
     
     // instead of
     var string: String?
     if let number = number {
        string = String(number)
     }
     
     // use
     let string = number?.toString
     ```
     */
    public var toString: String {
        return String(self)
    }
    
    
    /**
     Convert self to an abbreviated String.
     
     Examples:
     ```
     Value : 598 -> 598
     Value : -999 -> -999
     Value : 1000 -> 1K
     Value : -1284 -> -1.3K
     Value : 9940 -> 9.9K
     Value : 9980 -> 10K
     Value : 39900 -> 39.9K
     Value : 99880 -> 99.9K
     Value : 399880 -> 0.4M
     Value : 999898 -> 1M
     Value : 999999 -> 1M
     Value : 1456384 -> 1.5M
     Value : 12383474 -> 12.4M
     ```
     
     - author: http://stackoverflow.com/a/35504720/1737738
     */
    public var toAbbreviatedString: String {
        typealias Abbreviation = (threshold: Double, divisor: Double, suffix: String)
        let abbreviations: [Abbreviation] = [(0, 1, ""),
                                            (1000.0, 1000.0, "K"),
                                            (100_000.0, 1_000_000.0, "M"),
                                            (100_000_000.0, 1_000_000_000.0, "B")]
        // you can add more !
        
        let startValue = Double(abs(self))
        let abbreviation: Abbreviation = {
            var prevAbbreviation = abbreviations[0]
            for tmpAbbreviation in abbreviations where tmpAbbreviation.threshold <= startValue {
                prevAbbreviation = tmpAbbreviation
            }
            return prevAbbreviation
        }()
        
        let numFormatter = NSNumberFormatter()
        let value = Double(self) / abbreviation.divisor
        numFormatter.positiveSuffix = abbreviation.suffix
        numFormatter.negativeSuffix = abbreviation.suffix
        numFormatter.allowsFloats = true
        numFormatter.minimumIntegerDigits = 1
        numFormatter.minimumFractionDigits = 0
        numFormatter.maximumFractionDigits = 1
        
        return numFormatter.stringFromNumber(NSNumber(double: value)) ?? "\(self)"
    }

    
    /**
     Repeat a block `self` times.
     
     - parameter block: The block to execute (includes the current execution index)
     */
    public func repeatBlock(@noescape block: (Int) throws -> ()) rethrows {
        guard self > 0 else { return }
        try (1...self).forEach(block)
    }
    
    /// Generate a random Int bounded by a closed interval range.
    public static func random(range: ClosedInterval<Int>) -> Int {
        return range.start + Int(arc4random_uniform(UInt32(range.end - range.start + 1)))
    }
    
    /// Generate a random Int bounded by a range from min to max.
    public static func random(min min: Int, max: Int) -> Int {
        return random(min...max)
    }
}
