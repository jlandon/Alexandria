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

protocol Actionable: NSObjectProtocol {
    
    init(actionClosure: (Self) -> Void)
    init(frame: CGRect, actionClosure: (Self) -> Void)
    func addTarget(controlEvents controlEvents: UIControlEvents, actionClosure: (Self) -> Void)
    
}

extension Actionable where Self : UIControl {
    
    private var action: Action<Self>? {
        set { objc_setAssociatedObject(self, &AssociatedKeys.ActionName, newValue, .OBJC_ASSOCIATION_RETAIN) }
        get { return objc_getAssociatedObject(self, &AssociatedKeys.ActionName) as? Action }
    }
    
    /**
     Initialize a UIControl, using the given closure as the .TouchUpInside target/action event.
     
     - parameter action: The closure to execute upon control press.
     
     - returns: An initialized UIControl.
     */
    init(actionClosure: (Self) -> Void) {
        self.init()
        action = Action(action: actionClosure)
        addTarget(self, action: #selector(handleAction), forControlEvents: .TouchUpInside)
    }
    
    
    /**
     Initialize a UIControl with the given frame, using the given closure as the .TouchUpInside target/action event.
     
     - parameter frame:  The frame of the control.
     - parameter action: the closure to execute upon control press.
     
     - returns: An initialized UIControl.
     */
    init(frame: CGRect, actionClosure: (Self) -> Void) {
        self.init(frame: frame)
        action = Action(action: actionClosure)
        addTarget(self, action: #selector(handleAction), forControlEvents: .TouchUpInside)
    }
    
    
    /**
     Adds the given closure as the control's target action
     
     - parameter controlEvents: The UIControlEvents upon which to execute this action.
     - parameter action:        The action closure to execute.
     */
    func addTarget(controlEvents controlEvents: UIControlEvents, actionClosure: (Self) -> Void) {
        action = Action(action: actionClosure)
        addTarget(self, action: #selector(handleAction), forControlEvents: controlEvents)
    }
}

private class Action<T: ActionSelectable> {
    var action: (T) -> Void
    
    init(action: (T) -> Void) {
        self.action = action
    }
}

private struct AssociatedKeys {
    static var ActionName = "action"
}

@objc protocol ActionSelectable {
    func handleAction()
}

extension UIControl: ActionSelectable, Actionable {
    func handleAction() {
        guard let action = self.action else {
            fatalError("\n" +
                       "Unsupported UIControl Type: \(self.dynamicType). Add the following extension to properly recall closure:" +
                       "\n\n" +
                       "extension \(self.dynamicType) {\n" +
                       "    override func handleAction() {\n" +
                       "        self.action?.action(self)\n" +
                       "    }\n" +
                       "}" +
                       "\n\n" +
                       "If this is a UIKit control, please open an issue or pull request at http://github.com/ovenbits/Alexandria and we will look into adding support for the extension in a future release. Thank you.")
        }
        action.action(self)
    }
}

// MARK: - UIKit UIControl Subclasses

extension UIButton           { override func handleAction() { self.action?.action(self) } }
extension UIDatePicker       { override func handleAction() { self.action?.action(self) } }
extension UIPageControl      { override func handleAction() { self.action?.action(self) } }
extension UIRefreshControl   { override func handleAction() { self.action?.action(self) } }
extension UISegmentedControl { override func handleAction() { self.action?.action(self) } }
extension UISlider           { override func handleAction() { self.action?.action(self) } }
extension UIStepper          { override func handleAction() { self.action?.action(self) } }
extension UISwitch           { override func handleAction() { self.action?.action(self) } }
extension UITextField        { override func handleAction() { self.action?.action(self) } }
