//
//  UIButton+Extensions.swift
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

extension UIButton {
    private class ButtonAction {
        var action: UIButton -> Void
        
        init(action: UIButton -> Void) {
            self.action = action
        }
    }
    
    private struct AssociatedKeys {
        static var ActionName = "action"
    }
    
    private var buttonAction: ButtonAction? {
        set { objc_setAssociatedObject(self, &AssociatedKeys.ActionName, newValue, .OBJC_ASSOCIATION_RETAIN) }
        get { return objc_getAssociatedObject(self, &AssociatedKeys.ActionName) as? ButtonAction }
    }
    
    
    /**
     Initialize a UIButton, using the given closure as the .TouchUpInside target/action event.
     
     - parameter action: The closure to execute upon button press.
     
     - returns: An initialized UIButton.
     */
    public convenience init(action: UIButton -> Void) {
        self.init()
        buttonAction = ButtonAction(action: action)
        addTarget(self, action: #selector(UIButton.handleAction(_:)), forControlEvents: .TouchUpInside)
    }
    
    
    /**
     Initialize a UIButton with the given frame, using the given closure as the .TouchUpInside target/action event.
     
     - parameter frame:  The frame of the button.
     - parameter action: the closure to execute upon button press.
     
     - returns: An initialized UIButton.
     */
    public convenience init(frame: CGRect, action: UIButton -> Void) {
        self.init(frame: frame)
        buttonAction = ButtonAction(action: action)
        addTarget(self, action: #selector(UIButton.handleAction(_:)), forControlEvents: .TouchUpInside)
    }
    
    
    /**
     Adds the given closure as the button's target action
     
     - parameter controlEvents: The UIControlEvents upon which to execute this action.
     - parameter action:        The action closure to execute.
     */
    public func addTarget(controlEvents controlEvents: UIControlEvents, action: UIButton -> Void) {
        buttonAction = ButtonAction(action: action)
        addTarget(self, action: #selector(UIButton.handleAction(_:)), forControlEvents: controlEvents)
    }
    
    dynamic private func handleAction(button: UIButton) {
        buttonAction?.action(button)
    }
    
    /**
     Sets the background color to use for the specified button state.
     
     - parameter color: The background color to use for the specified state.
     - parameter state: The state that uses the specified image.
     */
    public func setBackgroundColor(color: UIColor, forState state: UIControlState) {
        setBackgroundImage(UIImage(color: color), forState: state)
    }
}
