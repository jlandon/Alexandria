//
//  UIViewController+Extensions.swift
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

extension UIViewController {
    
    /// Retrieve the view controller currently on-screen
    ///
    /// Based off code here: http://stackoverflow.com/questions/24825123/get-the-current-view-controller-from-the-app-delegate
    public class var currentViewController: UIViewController? {
        if let controller = UIApplication.sharedApplication().keyWindow?.rootViewController {
            return findCurrentViewController(controller)
        }
        return nil
    }
    
    private class func findCurrentViewController(controller: UIViewController) -> UIViewController {
        if let controller = controller.presentedViewController {
            return findCurrentViewController(controller)
        }
        else if let controller = controller as? UISplitViewController, lastViewController = controller.viewControllers.first where controller.viewControllers.count > 0 {
            return findCurrentViewController(lastViewController)
        }
        else if let controller = controller as? UINavigationController, topViewController = controller.topViewController where controller.viewControllers.count > 0 {
            return findCurrentViewController(topViewController)
        }
        else if let controller = controller as? UITabBarController, selectedViewController = controller.selectedViewController where controller.viewControllers?.count > 0 {
            return findCurrentViewController(selectedViewController)
        }
        else {
            return controller
        }
    }
}