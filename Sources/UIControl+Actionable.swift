//
//  UIControl+Actionable.swift
//
//  Created by Alex Corcoran on 6/22/16.
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

extension UIControl {
    
    private final class Action {
        var action: () -> Void
        
        init(action: @escaping () -> Void) {
            self.action = action
        }
    }
    
    private struct AssociatedKeys {
        static var ActionName = "action"
    }
    
    private var action: Action? {
        set { objc_setAssociatedObject(self, &AssociatedKeys.ActionName, newValue, .OBJC_ASSOCIATION_RETAIN) }
        get { return objc_getAssociatedObject(self, &AssociatedKeys.ActionName) as? Action }
    }
    
    /**
     Initialize a UIControl, using the given closure as the .TouchUpInside target/action event.
     
     - parameter action: The closure to execute upon control press.
     
     - returns: An initialized UIControl.
     */
    public convenience init(actionClosure: @escaping () -> Void) {
        self.init()
        action = Action(action: actionClosure)
        addTarget(self, action: #selector(handleAction), for: .touchUpInside)
    }
    
    
    /**
     Initialize a UIControl with the given frame, using the given closure as the .TouchUpInside target/action event.
     
     - parameter frame:  The frame of the control.
     - parameter action: the closure to execute upon control press.
     
     - returns: An initialized UIControl.
     */
    public convenience init(frame: CGRect, actionClosure: @escaping () -> Void) {
        self.init(frame: frame)
        action = Action(action: actionClosure)
        addTarget(self, action: #selector(handleAction), for: .touchUpInside)
    }
    
    
    /**
     Adds the given closure as the control's target action
     
     - parameter controlEvents: The UIControlEvents upon which to execute this action.
     - parameter action:        The action closure to execute.
     */
    public func addTarget(for controlEvents: UIControlEvents, actionClosure: @escaping () -> Void) {
        action = Action(action: actionClosure)
        addTarget(self, action: #selector(handleAction), for: controlEvents)
    }
    
    @objc public func handleAction() {
        action?.action()
    }
}
