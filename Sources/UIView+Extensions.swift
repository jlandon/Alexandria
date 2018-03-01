//
//  UIView+Extensions.swift
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

extension UIView {
    
    /// UIView animation without the long variable names
    public class func animate(_ duration: TimeInterval,
                                 _ delay: TimeInterval,
                               _ damping: CGFloat,
                              _ velocity: CGFloat,
                               _ options: UIViewAnimationOptions,
                            _ animations: @escaping () -> Void,
                            _ completion: @escaping (Bool) -> Void = { _ in })
    {
        UIView.animate(withDuration: duration,
                              delay: delay,
             usingSpringWithDamping: damping,
              initialSpringVelocity: velocity,
                            options: options,
                         animations: animations,
                         completion: completion
        )
    }
    
    /// UIView animation without the long variable names or completion block
    public class func animate(_ duration: TimeInterval,
                                 _ delay: TimeInterval,
                               _ damping: CGFloat,
                              _ velocity: CGFloat,
                               _ options: UIViewAnimationOptions,
                            _ animations: @escaping () -> Void)
    {
        UIView.animate(withDuration: duration,
                              delay: delay,
             usingSpringWithDamping: damping,
              initialSpringVelocity: velocity,
                            options: options,
                         animations: animations,
                         completion: nil
        )
    }
    
    /**
    The frame size, not to be confused with the bounds size
    
    For more information on the difference between a view's bounds and frame, see:
    
    - http://www.andrewgertig.com/2013/08/ios-bounds-vs-frame
    - http://ashfurrow.com/blog/you-probably-dont-understand-frames-and-bounds/
    */
    public var size: CGSize {
        set { frame.size = newValue }
        get { return frame.size }
    }
    /**
    The frame height, not to be confused with the bounds height
    
    For more information on the difference between a view's bounds and frame, see:
    
    - http://www.andrewgertig.com/2013/08/ios-bounds-vs-frame
    - http://ashfurrow.com/blog/you-probably-dont-understand-frames-and-bounds/
    */
    public var height: CGFloat {
        set { frame.size.height = newValue }
        get { return frame.height }
    }
    /**
    The frame width, not to be confused with the bounds width
    
    For more information on the difference between a view's bounds and frame, see:
    
    - http://www.andrewgertig.com/2013/08/ios-bounds-vs-frame
    - http://ashfurrow.com/blog/you-probably-dont-understand-frames-and-bounds/
    */
    public var width: CGFloat {
        set { frame.size.width = newValue }
        get { return frame.width }
    }
    /**
    The frame origin, not to be confused with the bounds origin
    
    For more information on the difference between a view's bounds and frame, see:
    
    - http://www.andrewgertig.com/2013/08/ios-bounds-vs-frame
    - http://ashfurrow.com/blog/you-probably-dont-understand-frames-and-bounds/
    */
    public var origin: CGPoint {
        set { frame.origin = newValue }
        get { return frame.origin }
    }
    /**
    The frame origin.x, not to be confused with the bounds origin.x
    
    For more information on the difference between a view's bounds and frame, see:
    
    - http://www.andrewgertig.com/2013/08/ios-bounds-vs-frame
    - http://ashfurrow.com/blog/you-probably-dont-understand-frames-and-bounds/
    */
    public var originX: CGFloat {
        set { frame.origin.x = newValue }
        get { return origin.x }
    }
    /**
    The frame origin.y, not to be confused with the bounds origin.y
    
    For more information on the difference between a view's bounds and frame, see:
    
    - http://www.andrewgertig.com/2013/08/ios-bounds-vs-frame
    - http://ashfurrow.com/blog/you-probably-dont-understand-frames-and-bounds/
    */
    public var originY: CGFloat {
        set { frame.origin.y = newValue }
        get { return origin.y }
    }
    /**
    The frame maxY, not to be confused with the bounds maxY
    
    For more information on the difference between a view's bounds and frame, see:
    
    - http://www.andrewgertig.com/2013/08/ios-bounds-vs-frame
    - http://ashfurrow.com/blog/you-probably-dont-understand-frames-and-bounds/
    */
    public var maxY: CGFloat {
        set { originY = newValue - height }
        get { return frame.maxY }
    }
    /**
    The frame maxX, not to be confused with the bounds maxX
    
    For more information on the difference between a view's bounds and frame, see:
    
    - http://www.andrewgertig.com/2013/08/ios-bounds-vs-frame
    - http://ashfurrow.com/blog/you-probably-dont-understand-frames-and-bounds/
    */
    public var maxX: CGFloat {
        set { originX = newValue - width }
        get { return frame.maxX }
    }
    /**
    The frame minY, not to be confused with the bounds minY
    
    For more information on the difference between a view's bounds and frame, see:
    
    - http://www.andrewgertig.com/2013/08/ios-bounds-vs-frame
    - http://ashfurrow.com/blog/you-probably-dont-understand-frames-and-bounds/
    */
    public var minY: CGFloat {
        set { originY = newValue }
        get { return frame.minY }
    }
    /**
    The frame minX, not to be confused with the bounds minX
    
    For more information on the difference between a view's bounds and frame, see:
    
    - http://www.andrewgertig.com/2013/08/ios-bounds-vs-frame
    - http://ashfurrow.com/blog/you-probably-dont-understand-frames-and-bounds/
    */
    public var minX: CGFloat {
        set { originX = newValue }
        get { return frame.minX }
    }
    /**
    The frame center.x, not to be confused with the bounds center.x
    
    For more information on the difference between a view's bounds and frame, see:
    
    - http://www.andrewgertig.com/2013/08/ios-bounds-vs-frame
    - http://ashfurrow.com/blog/you-probably-dont-understand-frames-and-bounds/
    */
    public var centerX: CGFloat {
        set {
            var center = self.center
            center.x = newValue
            self.center = center
        }
        get { return center.x }
    }
    /**
    The frame center.y, not to be confused with the bounds center.y
    
    For more information on the difference between a view's bounds and frame, see:
    
    - http://www.andrewgertig.com/2013/08/ios-bounds-vs-frame
    - http://ashfurrow.com/blog/you-probably-dont-understand-frames-and-bounds/
    */
    public var centerY: CGFloat {
        set {
            var center = self.center
            center.y = newValue
            self.center = center
        }
        get { return center.y }
    }
    /**
    The midpoint of the view's bounds
    
    Implementation:
    
    return CGPoint(x: bounds.width/2, y: bounds.height/2)
    */
    public var boundsCenter: CGPoint {
        return CGPoint(x: bounds.width/2, y: bounds.height/2)
    }
    
    /// Creates a UIImage representation of the view
    public func snapshot() -> UIImage? {
        defer { UIGraphicsEndImageContext() }
        
        UIGraphicsBeginImageContextWithOptions(size, isOpaque, 0)
        if let context = UIGraphicsGetCurrentContext() {
            layer.render(in: context)
        }
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    /**
     Constrain the current view to another view.
     
     - parameter attribute: The layout attribute of self to constrain.
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter otherView: The other view to be constrained to.
     - parameter otherAttribute: The layout attribute for the other view.
     - parameter multiplier: The multiplier to use for the constraint (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     - parameter identifier: The identifier for the constraint (optional).
     
     - returns: The created constraint for self.
     */
    @discardableResult
    public func constrain(_ attribute: NSLayoutAttribute,
                           _ relation: NSLayoutRelation = .equal,
                         to otherView: UIView,
                     _ otherAttribute: NSLayoutAttribute,
                     times multiplier: CGFloat = 1,
                        plus constant: CGFloat = 0,
                  atPriority priority: UILayoutPriority = .required,
                           identifier: String? = nil) -> NSLayoutConstraint
    {
        translatesAutoresizingMaskIntoConstraints = false
                        
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: attribute,
            relatedBy: relation,
            toItem: otherView,
            attribute: otherAttribute,
            multiplier: multiplier,
            constant: constant
        )
        constraint.priority = priority
        constraint.identifier = identifier
        constraint.isActive = true
                        
        return constraint
    }
    
    /**
     Constrain the current view to a layout support such as `topLayoutGuide` or `bottomLayoutGuide`.
     
     - parameter attribute: The layout attribute of self to constrain.
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter support: The support to be constrained to.
     - parameter otherAttribute: The layout attribute for the support.
     - parameter multiplier: The multiplier to use for the constraint (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     - parameter identifier: The identifier for the constraint (optional).
     
     - returns: The created constraint for self.
     */
    @discardableResult
    public func constrain(_ attribute: NSLayoutAttribute,
                           _ relation: NSLayoutRelation = .equal,
                    toSupport support: UILayoutSupport,
                     _ otherAttribute: NSLayoutAttribute,
                     times multiplier: CGFloat = 1,
                        plus constant: CGFloat = 0,
                  atPriority priority: UILayoutPriority = .required,
                           identifier: String? = nil) -> NSLayoutConstraint
    {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: attribute,
            relatedBy: relation,
            toItem: support,
            attribute: otherAttribute,
            multiplier: multiplier,
            constant: constant
        )
        constraint.priority = priority
        constraint.identifier = identifier
        constraint.isActive = true
        
        return constraint
    }
    
    /**
     Constrain the current view to a layout guide such as `safeAreaLayoutGuide` or `layoutMarginsGuide`.
     
     - parameter attribute: The layout attribute of self to constrain.
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter guide: The guide to be constrained to.
     - parameter otherAttribute: The layout attribute for the support.
     - parameter multiplier: The multiplier to use for the constraint (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     - parameter identifier: The identifier for the constraint (optional).
     
     - returns: The created constraint for self.
     */
    @available(iOS 9.0, *) @discardableResult
    public func constrain(_ attribute: NSLayoutAttribute,
                          _ relation: NSLayoutRelation = .equal,
                          toGuide guide: UILayoutGuide,
                          _ otherAttribute: NSLayoutAttribute,
                          times multiplier: CGFloat = 1,
                          plus constant: CGFloat = 0,
                          atPriority priority: UILayoutPriority = .required,
                          identifier: String? = nil) -> NSLayoutConstraint
    {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: attribute,
            relatedBy: relation,
            toItem: guide,
            attribute: otherAttribute,
            multiplier: multiplier,
            constant: constant
        )
        constraint.priority = priority
        constraint.identifier = identifier
        constraint.isActive = true
        
        return constraint
    }
    
    /**
     Constrain an attribute of the current view.
     
     - parameter attribute: The layout attribute of self to constrain.
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter multiplier: The multiplier to use for the constraint (optional, defaults to 1).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     - parameter identifier: The identifier for the constraint (optional).
     
     - returns: The created constraint for self.
     */
    @discardableResult
    public func constrain(_ attribute: NSLayoutAttribute,
                           _ relation: NSLayoutRelation = .equal,
                          to constant: CGFloat,
                     times multiplier: CGFloat = 1,
                  atPriority priority: UILayoutPriority = .required,
                           identifier: String? = nil) -> NSLayoutConstraint
    {
        translatesAutoresizingMaskIntoConstraints = false
                        
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: attribute,
            relatedBy: relation,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: multiplier,
            constant: constant
        )
        constraint.priority = priority
        constraint.identifier = identifier
        constraint.isActive = true
        
        return constraint
    }
    
    /**
     Constrain the edges of self its superview, with optional insets.
     
     - parameter top: The top insets (optional, defaults to 0).
     - parameter leading: The leading insets (optional, defaults to 0).
     - parameter bottom: The bottom insets (optional, defaults to 0).
     - parameter trailing: The trailing insets (optional, defaults to 0).
     
     - returns: All four created constraints (top, leading, bottom, and trailing edges) for self.
     */
    @discardableResult
    public func constrainEdgesToSuperview(top: CGFloat = 0, leading: CGFloat = 0, bottom: CGFloat = 0, trailing: CGFloat = 0) -> (top: NSLayoutConstraint, leading: NSLayoutConstraint, bottom: NSLayoutConstraint, trailing: NSLayoutConstraint) {
        
        guard let superview = superview else { fatalError("Unable to add constraints, because the view has no superview") }
        
        let topConstraint    = constrain(.top, to: superview, .top, plus: top)
        let leadingConstraint   = constrain(.leading, to: superview, .leading, plus: leading)
        let bottomConstraint = constrain(.bottom, to: superview, .bottom, plus: -bottom)
        let trailingConstraint  = constrain(.trailing, to: superview, .trailing, plus: -trailing)
        
        return (topConstraint, leadingConstraint, bottomConstraint, trailingConstraint)
    }
    
    /**
     Constrain the width of the current view.
     
     - parameter value: The width value.
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @discardableResult
    public func constrainWidth(to value: CGFloat,
                             _ relation: NSLayoutRelation = .equal,
                       times multiplier: CGFloat = 1,
                    atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.width, relation, to: value, times: multiplier, atPriority: priority)
        return self
    }
    
    /**
     Constrain the height of the current view.
     
     - parameter value: The height value.
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @discardableResult
    public func constrainHeight(to value: CGFloat,
                              _ relation: NSLayoutRelation = .equal,
                        times multiplier: CGFloat = 1,
                     atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.height, relation, to: value, times: multiplier, atPriority: priority)
        return self
    }
    
    /**
     Constrain the width of the current view to another view.
     
     - parameter view: The view by which to constrain self
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .Width).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @discardableResult
    public func constrainWidth(to view: UIView,
                           _ attribute: NSLayoutAttribute = .width,
                              relation: NSLayoutRelation = .equal,
                      times multiplier: CGFloat = 1,
                         plus constant: CGFloat = 0,
                   atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.width, relation, to: view, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain the height of the current view to another view.
     
     - parameter view: The view by which to constrain self
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .Height).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @discardableResult
    public func constrainHeight(to view: UIView,
                            _ attribute: NSLayoutAttribute = .height,
                               relation: NSLayoutRelation = .equal,
                       times multiplier: CGFloat = 1,
                          plus constant: CGFloat = 0,
                    atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.height, relation, to: view, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain the left constraint of the current view.
     
     - parameter view: The view by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .Left).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @discardableResult
    public func pinLeft(to view: UIView,
                    _ attribute: NSLayoutAttribute = .left,
                       relation: NSLayoutRelation = .equal,
               times multiplier: CGFloat = 1,
                  plus constant: CGFloat = 0,
            atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.left, relation, to: view, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain the right constraint of the current view.
     
     - parameter view: The view by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .Right).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @discardableResult
    public func pinRight(to view: UIView,
                     _ attribute: NSLayoutAttribute = .right,
                        relation: NSLayoutRelation = .equal,
                times multiplier: CGFloat = 1,
                   plus constant: CGFloat = 0,
             atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.right, relation, to: view, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain the top constraint of the current view.
     
     - parameter view: The view by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .Top).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @discardableResult
    public func pinTop(to view: UIView,
                   _ attribute: NSLayoutAttribute = .top,
                      relation: NSLayoutRelation = .equal,
              times multiplier: CGFloat = 1,
                 plus constant: CGFloat = 0,
           atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.top, relation, to: view, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain the bottom constraint of the current view.
     
     - parameter view: The view by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .Bottom).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @discardableResult
    public func pinBottom(to view: UIView,
                      _ attribute: NSLayoutAttribute = .bottom,
                         relation: NSLayoutRelation = .equal,
                 times multiplier: CGFloat = 1,
                    plus constant: CGFloat = 0,
              atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.bottom, relation, to: view, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain the leading constraint of the current view.
     
     - parameter view: The view by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .Leading).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @discardableResult
    public func pinLeading(to view: UIView,
                       _ attribute: NSLayoutAttribute = .leading,
                          relation: NSLayoutRelation = .equal,
                  times multiplier: CGFloat = 1,
                     plus constant: CGFloat = 0,
               atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.leading, relation, to: view, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain the trailing constraint of the current view.
     
     - parameter view: The view by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .Trailing).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @discardableResult
    public func pinTrailing(to view: UIView,
                        _ attribute: NSLayoutAttribute = .trailing,
                           relation: NSLayoutRelation = .equal,
                   times multiplier: CGFloat = 1,
                      plus constant: CGFloat = 0,
                atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.trailing, relation, to: view, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain the center X constraint of the current view.
     
     - parameter view: The view by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .CenterX).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @discardableResult
    public func pinCenterX(to view: UIView,
                       _ attribute: NSLayoutAttribute = .centerX,
                          relation: NSLayoutRelation = .equal,
                  times multiplier: CGFloat = 1,
                     plus constant: CGFloat = 0,
               atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.centerX, relation, to: view, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain the center Y constraint of the current view.
     
     - parameter view: The view by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .CenterY).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @discardableResult
    public func pinCenterY(to view: UIView,
                       _ attribute: NSLayoutAttribute = .centerY,
                          relation: NSLayoutRelation = .equal,
                  times multiplier: CGFloat = 1,
                     plus constant: CGFloat = 0,
               atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.centerY, relation, to: view, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain self to fit its content for the specified layout constraint axes.
     
     - parameter axes: The axes on which to constrain self (variadic).
     - parameter priority: The layout priority for content hugging and compression (optional, defaults to `.required`)
     */
    public func constrainSize(toFit axes: UILayoutConstraintAxis..., priority: UILayoutPriority = .required) {
        axes.forEach {
            setContentHuggingPriority(priority, for: $0)
            setContentCompressionResistancePriority(priority, for: $0)
        }
    }
    
    /**
     Add self to a superview.
     
     - parameter toSuperview: The superview in which to add self.
     */
    @nonobjc @discardableResult
    public func add(toSuperview superview: UIView) -> Self {
        superview.addSubview(self)
        return self
    }
    
    /**
     Add self as an arranged subview of a UIStackView.
     
     - parameter toStackview: The stackview in which to add self as an arranged subview.
     */
    @available(iOS 9.0, *) @discardableResult
    public func add(toStackview stackview: UIStackView) -> Self {
        stackview.addArrangedSubview(self)
        return self
    }
    
    /**
     Returns a UIView object that has been added as a subview to the given superview.
     
     - parameter superview: The view in which to add self as a subview.
     
     - returns: A UIView initialized and added as a subview to the given superview.
     */
    public convenience init(superview: UIView) {
        self.init()
        superview.addSubview(self)
    }
}


extension UIView {

/*
    View snapshotting. 
    
    Comes from: Richard Turton http://commandshift.co.uk/blog/2016/03/13/better-snapshots/
    
    In case Richard's page ever goes away:

        In my talk at RWDevCon 2016 I described a way to handle custom view controller transitions in 
        a way that didn’t lead to messing up your view controllers and leaving yourself with a lot of 
        horrible cleanup code.
    
        The secret to painless custom transitions is to do a lot of snapshots. In the talk I mentioned 
        some utility methods for making snapshots, but there wasn’t time in the session to cover the 
        details. Instead, I’ve written about them here.
    
        A sensible view controller transition doesn’t move, fade or otherwise manipulate any of the 
        view controller’s views. That way lies madness. The correct way to handle them is:
    
            * Create a canvas view, which fills the container view of the transition context
            * Snapshot everything you’re interested in moving
            * Move the snapshots around, then animate them to their final positions
            * Remove the canvas when you’re done
    
        This has numerous advantages:
    
            * No cleanup code or resetting of view properties
            * You can take advantage of autolayout in your view controllers, but move the snapshots 
              around by animating the center property, which makes much more sense when doing transitions 
              and means you don’t need outlets to all your constraints
            * Keeps the view controller very loosely coupled to the transition
    
        Making a snapshot from a UIView is simple and fast:
    
            `let snapshot = view.snapshotViewAfterScreenUpdates(false)`

        The resulting view has the same bounds as the original, but has a frame origin at zero, which is usually useless.
    
        For transitions, what is usually required is for the snapshot to be added to the canvas view, at the 
        same position on the screen. This is done with an extension on UIView:
    
            > see `addSnapshotOfView(_:afterUpdates:)` below
    
        You call the function like this:
    
            `let snapshot = canvas.addSnapshotOfView(view, afterUpdates: false)`
    
        For an array of views, another method in the extension:
        
            > see `addSnapshotOfView(_:afterUpdates:)` below
    
        Snapshotting is so common and so useful when doing transitions, and these extension methods make 
        your transition code much more readable and obvious.
    

    Thank you, Richard!
*/
    
    
    /**
    Take a snapshot of the given view, adding it to `self` which is treated as the canvas-view. Will place the
    snapshot view within self (canvas view) at the snapshotted view's same position on screen.
    
    `let snapshot = canvas.addSnapshotOfView(view, afterUpdates: false)`
    
    - parameter view:         The view to snapshot
    - parameter afterUpdates: A Boolean value (default: false) that specifies whether the snapshot should be taken after recent changes have been incorporated. Pass the value false to capture the screen in its current state, which might not include recent changes.
    
    - returns: The snapshotted view (already added to the caller).
    
    - author: Richard Turton http://commandshift.co.uk/blog/2016/03/13/better-snapshots/
    */
    @nonobjc public func addSnapshot(of view: UIView, afterUpdates: Bool = false) -> UIView? {
        let snapshot = view.snapshotView(afterScreenUpdates: afterUpdates)
        snapshot?.add(toSuperview: self)
        snapshot?.frame = convert(view.bounds, from: view)
        return snapshot
    }
    
    
    /**
     Convenience for calling `addSnapshotOfView(_:afterUpdates:)` over an array of views.
     
     - parameter views:        The views to snapshot.
     - parameter afterUpdates: A Boolean value (default: false) that specifies whether the snapshot should be taken after recent changes have been incorporated. Pass the value false to capture the screen in its current state, which might not include recent changes.
     
     - returns: The snapshotted views.
     
     - author: Richard Turton http://commandshift.co.uk/blog/2016/03/13/better-snapshots/
     */
    @nonobjc public func addSnapshot(of views: [UIView], afterUpdates: Bool = false) -> [UIView] {
        return views.flatMap { addSnapshot(of: $0, afterUpdates: afterUpdates) }
    }

}

// Swift-only shadowing of `.pin___(to:)` method signatures to the obj-c friendly `.pin___(toSupport:)` functions.
extension UIView {
    
    /**
     Constrain the left constraint of the current view.
     
     - parameter support: The support by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .Left).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @nonobjc
    @discardableResult
    public func pinLeft(to support: UILayoutSupport,
                           _ attribute: NSLayoutAttribute = .left,
                             relation: NSLayoutRelation = .equal,
                             times multiplier: CGFloat = 1,
                                   plus constant: CGFloat = 0,
                                        atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.left, relation, toSupport: support, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain the right constraint of the current view.
     
     - parameter support: The support by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .Right).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @nonobjc
    @discardableResult
    public func pinRight(to support: UILayoutSupport,
                            _ attribute: NSLayoutAttribute = .right,
                              relation: NSLayoutRelation = .equal,
                              times multiplier: CGFloat = 1,
                                    plus constant: CGFloat = 0,
                                         atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.right, relation, toSupport: support, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain the top constraint of the current view.
     
     - parameter support: The support by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .Top).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @nonobjc
    @discardableResult
    public func pinTop(to support: UILayoutSupport,
                          _ attribute: NSLayoutAttribute = .top,
                            relation: NSLayoutRelation = .equal,
                            times multiplier: CGFloat = 1,
                                  plus constant: CGFloat = 0,
                                       atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.top, relation, toSupport: support, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain the bottom constraint of the current view.
     
     - parameter support: The support by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .Bottom).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @nonobjc
    @discardableResult
    public func pinBottom(to support: UILayoutSupport,
                             _ attribute: NSLayoutAttribute = .bottom,
                               relation: NSLayoutRelation = .equal,
                               times multiplier: CGFloat = 1,
                                     plus constant: CGFloat = 0,
                                          atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.bottom, relation, toSupport: support, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain the leading constraint of the current view.
     
     - parameter support: The support by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .Leading).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @nonobjc
    @discardableResult
    public func pinLeading(to support: UILayoutSupport,
                              _ attribute: NSLayoutAttribute = .leading,
                                relation: NSLayoutRelation = .equal,
                                times multiplier: CGFloat = 1,
                                      plus constant: CGFloat = 0,
                                           atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.leading, relation, toSupport: support, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain the trailing constraint of the current view.
     
     - parameter support: The support by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .Trailing).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @nonobjc
    @discardableResult
    public func pinTrailing(to support: UILayoutSupport,
                               _ attribute: NSLayoutAttribute = .trailing,
                                 relation: NSLayoutRelation = .equal,
                                 times multiplier: CGFloat = 1,
                                       plus constant: CGFloat = 0,
                                            atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.trailing, relation, toSupport: support, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain the center X constraint of the current view.
     
     - parameter support: The support by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .CenterX).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @nonobjc
    @discardableResult
    public func pinCenterX(to support: UILayoutSupport,
                              _ attribute: NSLayoutAttribute = .centerX,
                                relation: NSLayoutRelation = .equal,
                                times multiplier: CGFloat = 1,
                                      plus constant: CGFloat = 0,
                                           atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.centerX, relation, toSupport: support, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain the center Y constraint of the current view.
     
     - parameter support: The support by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .CenterY).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @nonobjc
    @discardableResult
    public func pinCenterY(to support: UILayoutSupport,
                              _ attribute: NSLayoutAttribute = .centerY,
                                relation: NSLayoutRelation = .equal,
                                times multiplier: CGFloat = 1,
                                      plus constant: CGFloat = 0,
                                           atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.centerY, relation, toSupport: support, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
}

// Swift-only shadowing of `.pin___(to:)` method signatures to the obj-c friendly `.pin___(toGuide:)` functions.
extension UIView {
    
    /**
     Constrain the left constraint of the current view.
     
     - parameter guide: The guide by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .Left).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @available(iOS 9.0, *)
    @nonobjc
    @discardableResult
    public func pinLeft(to guide: UILayoutGuide,
                        _ attribute: NSLayoutAttribute = .left,
                        relation: NSLayoutRelation = .equal,
                        times multiplier: CGFloat = 1,
                        plus constant: CGFloat = 0,
                        atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.left, relation, toGuide: guide, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain the right constraint of the current view.
     
     - parameter guide: The guide by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .Right).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @available(iOS 9.0, *)
    @nonobjc
    @discardableResult
    public func pinRight(to guide: UILayoutGuide,
                         _ attribute: NSLayoutAttribute = .right,
                         relation: NSLayoutRelation = .equal,
                         times multiplier: CGFloat = 1,
                         plus constant: CGFloat = 0,
                         atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.right, relation, toGuide: guide, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain the top constraint of the current view.
     
     - parameter guide: The guide by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .Top).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @available(iOS 9.0, *)
    @nonobjc
    @discardableResult
    public func pinTop(to guide: UILayoutGuide,
                       _ attribute: NSLayoutAttribute = .top,
                       relation: NSLayoutRelation = .equal,
                       times multiplier: CGFloat = 1,
                       plus constant: CGFloat = 0,
                       atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.top, relation, toGuide: guide, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain the bottom constraint of the current view.
     
     - parameter guide: The guide by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .Bottom).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @available(iOS 9.0, *)
    @nonobjc
    @discardableResult
    public func pinBottom(to guide: UILayoutGuide,
                          _ attribute: NSLayoutAttribute = .bottom,
                          relation: NSLayoutRelation = .equal,
                          times multiplier: CGFloat = 1,
                          plus constant: CGFloat = 0,
                          atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.bottom, relation, toGuide: guide, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain the leading constraint of the current view.
     
     - parameter guide: The guide by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .Leading).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @available(iOS 9.0, *)
    @nonobjc
    @discardableResult
    public func pinLeading(to guide: UILayoutGuide,
                           _ attribute: NSLayoutAttribute = .leading,
                           relation: NSLayoutRelation = .equal,
                           times multiplier: CGFloat = 1,
                           plus constant: CGFloat = 0,
                           atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.leading, relation, toGuide: guide, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain the trailing constraint of the current view.
     
     - parameter guide: The guide by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .Trailing).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @available(iOS 9.0, *)
    @nonobjc
    @discardableResult
    public func pinTrailing(to guide: UILayoutGuide,
                            _ attribute: NSLayoutAttribute = .trailing,
                            relation: NSLayoutRelation = .equal,
                            times multiplier: CGFloat = 1,
                            plus constant: CGFloat = 0,
                            atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.trailing, relation, toGuide: guide, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain the center X constraint of the current view.
     
     - parameter guide: The guide by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .CenterX).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @available(iOS 9.0, *)
    @nonobjc
    @discardableResult
    public func pinCenterX(to guide: UILayoutGuide,
                           _ attribute: NSLayoutAttribute = .centerX,
                           relation: NSLayoutRelation = .equal,
                           times multiplier: CGFloat = 1,
                           plus constant: CGFloat = 0,
                           atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.centerX, relation, toGuide: guide, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
    /**
     Constrain the center Y constraint of the current view.
     
     - parameter guide: The guide by which to constrain self.
     - parameter attribute: The layout attribute of self to constrain (optional, defaults to .CenterY).
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter multiplier: The constraint multiplier (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     
     - returns: self
     */
    @available(iOS 9.0, *)
    @nonobjc
    @discardableResult
    public func pinCenterY(to guide: UILayoutGuide,
                           _ attribute: NSLayoutAttribute = .centerY,
                           relation: NSLayoutRelation = .equal,
                           times multiplier: CGFloat = 1,
                           plus constant: CGFloat = 0,
                           atPriority priority: UILayoutPriority = .required) -> Self
    {
        constrain(.centerY, relation, toGuide: guide, attribute, times: multiplier, plus: constant, atPriority: priority)
        return self
    }
    
}

extension UIView {
    
    /**
     Constrain the current view to the `safeAreaLayoutGuide` of another view.
     
     Note: If the target iOS version is less than 11.0, the view will be constrained directly to the other view, not that view's `safeAreaLayoutGuide`.
     
     - parameter attribute: The layout attribute of self to constrain.
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter otherView: The other view to be constrained to.
     - parameter otherAttribute: The layout attribute for the other view.
     - parameter multiplier: The multiplier to use for the constraint (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     - parameter identifier: The identifier for the constraint (optional).
     
     - returns: self
     */
    @discardableResult
    public func pinSafely(
        _ attribute: NSLayoutAttribute,
        _ relation: NSLayoutRelation = .equal,
        to otherView: UIView,
        _ otherAttribute: NSLayoutAttribute? = nil,
        times multiplier: CGFloat = 1,
        plus constant: CGFloat = 0,
        atPriority priority: UILayoutPriority = .required,
        identifier: String? = nil) -> Self
    {
        constrainSafely(attribute, relation, to: otherView, otherAttribute, times: multiplier, plus: constant, atPriority: priority, identifier: identifier)
        return self
    }
    
    /**
     Constrain the current view to the `safeAreaLayoutGuide` of another view.
     
     Note: If the target iOS version is less than 11.0, the view will be constrained directly to the other view, not that view's `safeAreaLayoutGuide`.
     
     - parameter attribute: The layout attribute of self to constrain.
     - parameter relation: The layout relation of self (optional, defaults to .Equal).
     - parameter otherView: The other view to be constrained to.
     - parameter otherAttribute: The layout attribute for the other view.
     - parameter multiplier: The multiplier to use for the constraint (optional, defaults to 1).
     - parameter constant: The constant to use for the constraint (optional, defaults to 0).
     - parameter priority: The priority for the constraint (optional, defaults to `.required`).
     - parameter identifier: The identifier for the constraint (optional).
     
     - returns: The created constraint for self.
     */
    @discardableResult
    public func constrainSafely(_ attribute: NSLayoutAttribute,
                         _ relation: NSLayoutRelation = .equal,
                         to otherView: UIView,
                         _ otherAttribute: NSLayoutAttribute? = nil,
                         times multiplier: CGFloat = 1,
                         plus constant: CGFloat = 0,
                         atPriority priority: UILayoutPriority = .required,
                         identifier: String? = nil) -> NSLayoutConstraint
    {
        if #available(iOS 11, *) {
            return constrain(attribute, relation, toGuide: otherView.safeAreaLayoutGuide, otherAttribute ?? attribute, times: multiplier, plus: constant, atPriority: priority, identifier: identifier)
        }
        else {
            return constrain(attribute, relation, to: otherView, otherAttribute ?? attribute, times: multiplier, plus: constant, atPriority: priority, identifier: identifier)
        }
    }
    
}

extension UILayoutPriority {
    
    public static func +(lhs: UILayoutPriority, rhs: Float) -> UILayoutPriority {
        return UILayoutPriority(lhs.rawValue + rhs)
    }
    
    public static func -(lhs: UILayoutPriority, rhs: Float) -> UILayoutPriority {
        return UILayoutPriority(lhs.rawValue - rhs)
    }
    
}
