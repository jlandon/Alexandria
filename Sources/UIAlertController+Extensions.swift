//
//  UIAlertController+Extensions.swift
//
//  Created by Jonathan Landon on 11/1/16.
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
import UIKit

extension UIAlertController {
    
    /**
     Adds a UIAlertAction, initialized with a title, style, and completion handler.
     
     - parameter title: The text to use for the action title.
     - parameter style: The style to use for the action (optional, defaults to `.default`).
     - parameter handler: A closure to execute when the user selects the action (optional, defaults to `nil`).
     
     - returns: self
     */
    @discardableResult
    public func addAction(title: String?, style: UIAlertActionStyle = .default, handler: ((UIAlertAction) -> Void)? = nil) -> Self {
        addAction(UIAlertAction(title: title, style: style, handler: handler))
        return self
    }
    
    /**
     Creates a UIAlertController instance, styled as an action sheet.
     
     - parameter title: The title for the controller (optional, defaults to `nil`).
     - parameter message: The message for the controller (optional, defaults to `nil`).
     
     - returns: A UIAlertController instance, styled as an action sheet.
     */
    public static func actionSheet(title: String? = nil, message: String? = nil) -> UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    }
    
    /**
     Creates a UIAlertController instance, styled as an alert.
     
     - parameter title: The title for the controller (optional, defaults to `nil`).
     - parameter message: The message for the controller (optional, defaults to `nil`).
     
     - returns: A UIAlertController instance, styled as an alert.
     */
    public static func alert(title: String? = nil, message: String? = nil) -> UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    
    /**
     Presents the UIAlertController inside the specified view controller.
     
     - parameter controller: The controller in which to present the alert controller (optional, defaults to `.current`).
     - parameter animated: Pass `true` to animate the presentation; otherwise, pass `false` (optional, defaults to `true`).
     - parameter completion: The closure to execute after the presentation finishes (optional, defaults to `nil`).
     */
    public func present(in controller: UIViewController? = .current, animated: Bool = true, completion: (() -> Void)? = nil) {
        controller?.present(self, animated: animated, completion: completion)
    }
}
