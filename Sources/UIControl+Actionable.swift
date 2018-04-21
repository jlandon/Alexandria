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
        var events: UIControlEvents
        
        init(action: @escaping () -> Void, events: UIControlEvents) {
            self.action = action
            self.events = events
        }
    }
    
    private struct AssociatedKeys {
        static var ActionName = "action"
    }
    
    private var actions: [Action] {
        set { objc_setAssociatedObject(self, &AssociatedKeys.ActionName, newValue, .OBJC_ASSOCIATION_RETAIN) }
        get { return (objc_getAssociatedObject(self, &AssociatedKeys.ActionName) as? [Action]) ?? [] }
    }
    
    /**
     Initialize a UIControl, using the given closure as the .TouchUpInside target/action event.
     
     - parameter action: The closure to execute upon control press.
     
     - returns: An initialized UIControl.
     */
    public convenience init(actionClosure: @escaping () -> Void) {
        self.init()
        addTarget(for: .touchUpInside, actionClosure: actionClosure)
    }
    
    
    /**
     Initialize a UIControl with the given frame, using the given closure as the .TouchUpInside target/action event.
     
     - parameter frame:  The frame of the control.
     - parameter action: the closure to execute upon control press.
     
     - returns: An initialized UIControl.
     */
    public convenience init(frame: CGRect, actionClosure: @escaping () -> Void) {
        self.init(frame: frame)
        addTarget(for: .touchUpInside, actionClosure: actionClosure)
    }
    
    
    /**
     Adds the given closure as the control's target action
     
     - parameter controlEvents: The UIControlEvents upon which to execute this action.
     - parameter action:        The action closure to execute.
     */
    public func addTarget(for controlEvents: UIControlEvents, actionClosure: @escaping () -> Void) {
        
        actions.append(Action(action: actionClosure, events: controlEvents))
        
        controlEvents.contains(.touchDown)           ? addTarget(self, action: #selector(touchDown),           for: .touchDown)           : ()
        controlEvents.contains(.touchDownRepeat)     ? addTarget(self, action: #selector(touchDownRepeat),     for: .touchDownRepeat)     : ()
        controlEvents.contains(.touchDragInside)     ? addTarget(self, action: #selector(touchDragInside),     for: .touchDragInside)     : ()
        controlEvents.contains(.touchDragOutside)    ? addTarget(self, action: #selector(touchDragOutside),    for: .touchDragOutside)    : ()
        controlEvents.contains(.touchDragEnter)      ? addTarget(self, action: #selector(touchDragEnter),      for: .touchDragEnter)      : ()
        controlEvents.contains(.touchDragExit)       ? addTarget(self, action: #selector(touchDragExit),       for: .touchDragExit)       : ()
        controlEvents.contains(.touchUpInside)       ? addTarget(self, action: #selector(touchUpInside),       for: .touchUpInside)       : ()
        controlEvents.contains(.touchUpOutside)      ? addTarget(self, action: #selector(touchUpOutside),      for: .touchUpOutside)      : ()
        controlEvents.contains(.touchCancel)         ? addTarget(self, action: #selector(touchCancel),         for: .touchCancel)         : ()
        controlEvents.contains(.valueChanged)        ? addTarget(self, action: #selector(valueChanged),        for: .valueChanged)        : ()
        controlEvents.contains(.editingDidBegin)     ? addTarget(self, action: #selector(editingDidBegin),     for: .editingDidBegin)     : ()
        controlEvents.contains(.editingChanged)      ? addTarget(self, action: #selector(editingChanged),      for: .editingChanged)      : ()
        controlEvents.contains(.editingDidEnd)       ? addTarget(self, action: #selector(editingDidEnd),       for: .editingDidEnd)       : ()
        controlEvents.contains(.editingDidEndOnExit) ? addTarget(self, action: #selector(editingDidEndOnExit), for: .editingDidEndOnExit) : ()
        controlEvents.contains(.allTouchEvents)      ? addTarget(self, action: #selector(allTouchEvents),      for: .allTouchEvents)      : ()
        controlEvents.contains(.allEditingEvents)    ? addTarget(self, action: #selector(allEditingEvents),    for: .allEditingEvents)    : ()
        controlEvents.contains(.applicationReserved) ? addTarget(self, action: #selector(applicationReserved), for: .applicationReserved) : ()
        controlEvents.contains(.systemReserved)      ? addTarget(self, action: #selector(systemReserved),      for: .systemReserved)      : ()
        controlEvents.contains(.allEvents)           ? addTarget(self, action: #selector(allEvents),           for: .allEvents)           : ()
        
        if #available(iOS 9.0, *) {
            controlEvents.contains(.primaryActionTriggered) ? addTarget(self, action: #selector(primaryActionTriggered), for: .primaryActionTriggered) : ()
        }
    }
    
}

extension UIControl {
    
    private func triggerAction(forEvents events: UIControlEvents) {
        actions.filter { $0.events.contains(events) }.forEach { $0.action() }
    }
    
    @objc dynamic private func touchDown() {
        triggerAction(forEvents: .touchDown)
    }
    
    @objc dynamic private func touchDownRepeat() {
        triggerAction(forEvents: .touchDownRepeat)
    }
    
    @objc dynamic private func touchDragInside() {
        triggerAction(forEvents: .touchDragInside)
    }
    
    @objc dynamic private func touchDragOutside() {
        triggerAction(forEvents: .touchDragOutside)
    }
    
    @objc dynamic private func touchDragEnter() {
        triggerAction(forEvents: .touchDragEnter)
    }
    
    @objc dynamic private func touchDragExit() {
        triggerAction(forEvents: .touchDragExit)
    }
    
    @objc dynamic private func touchUpInside() {
        triggerAction(forEvents: .touchUpInside)
    }
    
    @objc dynamic private func touchUpOutside() {
        triggerAction(forEvents: .touchUpOutside)
    }
    
    @objc dynamic private func touchCancel() {
        triggerAction(forEvents: .touchCancel)
    }
    
    @objc dynamic private func valueChanged() {
        triggerAction(forEvents: .valueChanged)
    }
    
    @objc dynamic private func primaryActionTriggered() {
        if #available(iOS 9.0, *) {
            triggerAction(forEvents: .primaryActionTriggered)
        }
    }
    
    @objc dynamic private func editingDidBegin() {
        triggerAction(forEvents: .editingDidBegin)
    }
    
    @objc dynamic private func editingChanged() {
        triggerAction(forEvents: .editingChanged)
    }
    
    @objc dynamic private func editingDidEnd() {
        triggerAction(forEvents: .editingDidEnd)
    }
    
    @objc dynamic private func editingDidEndOnExit() {
        triggerAction(forEvents: .editingDidEndOnExit)
    }
    
    @objc dynamic private func allTouchEvents() {
        triggerAction(forEvents: .allTouchEvents)
    }
    
    @objc dynamic private func allEditingEvents() {
        triggerAction(forEvents: .allEditingEvents)
    }
    
    @objc dynamic private func applicationReserved() {
        triggerAction(forEvents: .applicationReserved)
    }
    
    @objc dynamic private func systemReserved() {
        triggerAction(forEvents: .systemReserved)
    }
    
    @objc dynamic private func allEvents() {
        triggerAction(forEvents: .allEvents)
    }
}
