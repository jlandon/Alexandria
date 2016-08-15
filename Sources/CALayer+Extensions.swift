//
//  CALayer+Extensions.swift
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

private final class AnimationDelegate: NSObject, CAAnimationDelegate {
    
    private var completion: (Bool) -> Void
    
    init(completion: @escaping (Bool) -> Void) {
        self.completion = completion
    }

    fileprivate func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        completion(flag)
    }
}

extension CALayer {
    
    /**
    Add the specified animation object to the layer's render tree with a completion closure.
    
    - parameter animation: The animation to be added to the render tree.
    - parameter key: A string that identifier the animation.
    - parameter completion: A closure that is executed upon completion of the animation.
    */
    public func add(_ animation: CAAnimation, forKey key: String?, withCompletion completion: @escaping (Bool) -> Void) {
        animation.delegate = AnimationDelegate(completion: completion)
        add(animation, forKey: key)
    }
}
