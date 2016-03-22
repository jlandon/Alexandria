//
//  UITableView+Extensions.swift
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

import Foundation

extension UITableView {
    /**
     Registers a UITableViewCell for use in a UITableView.
     
     - parameter type: The type of cell to register.
     - parameter reuseIdentifier: The reuse identifier for the cell (optional).
     
     By default, the class name of the cell is used as the reuse identifier.
     
     Example:
     ```
     class CustomCell: UITableViewCell {}
     
     let tableView = UITableView()
     
     // registers the CustomCell class with a reuse identifier of "CustomCell"
     tableView.registerCell(CustomCell)
     ```
     */
    public func registerCell<T: UITableViewCell>(type: T.Type, reuseIdentifier: String = T.className) {
        registerClass(T.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    /**
     Dequeues a UITableViewCell for use in a UITableView.
     
     - parameter type: The type of the cell.
     - parameter reuseIdentifier: The reuse identifier for the cell (optional).
     
     - returns: A force-casted UITableViewCell of the specified type.
     
     By default, the class name of the cell is used as the reuse identifier.
     
     Example:
     ```
     class CustomCell: UITableViewCell {}
     
     let tableView = UITableView()
     
     // dequeues a CustomCell class
     let cell = tableView.dequeueReusableCell(CustomCell)
     ```
     */
    public func dequeueReusableCell<T: UITableViewCell>(type: T.Type, reuseIdentifier: String = T.className) -> T {
        return dequeueReusableCellWithIdentifier(reuseIdentifier) as! T
    }
    
    /**
     Dequeues a UITableViewCell for use in a UITableView.
     
     - parameter type: The type of the cell.
     - parameter indexPath: The index path at which to dequeue a new cell.
     - parameter reuseIdentifier: The reuse identifier for the cell (optional).
     
     - returns: A force-casted UITableViewCell of the specified type.
     
     By default, the class name of the cell is used as the reuse identifier.
     
     Example:
     ```
     class CustomCell: UITableViewCell {}
     
     let tableView = UITableView()
     
     // dequeues a CustomCell class
     let cell = tableView.dequeueReusableCell(CustomCell.self, forIndexPath: indexPath)
     ```
     */
    public func dequeueReusableCell<T: UITableViewCell>(type: T.Type, forIndexPath indexPath: NSIndexPath, reuseIdentifier: String = T.className) -> T {
        return dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! T
    }
    
    /**
     Inserts rows into self.
     
     - parameter indices: The rows indices to insert into self.
     - parameter section: The section in which to insert the rows (optional, defaults to 0).
     - parameter animation: The animation to use for the row insertion (optional, defaults to `.Automatic`).
     */
    public func insert(indices: [Int], section: Int = 0, animation: UITableViewRowAnimation = .Automatic) {
        let indexPaths = indices.map { NSIndexPath(forRow: $0, inSection: section) }
        
        beginUpdates()
        insertRowsAtIndexPaths(indexPaths, withRowAnimation: animation)
        endUpdates()
    }
    
    /**
     Deletes rows from self.
     
     - parameter indices: The rows indices to delete from self.
     - parameter section: The section in which to delete the rows (optional, defaults to 0).
     - parameter animation: The animation to use for the row deletion (optional, defaults to `.Automatic`).
     */
    public func delete(indices: [Int], section: Int = 0, animation: UITableViewRowAnimation = .Automatic) {
        let indexPaths = indices.map { NSIndexPath(forRow: $0, inSection: section) }
        
        beginUpdates()
        deleteRowsAtIndexPaths(indexPaths, withRowAnimation: animation)
        endUpdates()
    }
    
    /**
     Reloads rows in self.
     
     - parameter indices: The rows indices to reload in self.
     - parameter section: The section in which to reload the rows (optional, defaults to 0).
     - parameter animation: The animation to use for reloading the rows (optional, defaults to `.Automatic`).
     */
    public func reload(indices: [Int], section: Int = 0, animation: UITableViewRowAnimation = .Automatic) {
        let indexPaths = indices.map { NSIndexPath(forRow: $0, inSection: section) }
        
        beginUpdates()
        reloadRowsAtIndexPaths(indexPaths, withRowAnimation: animation)
        endUpdates()
    }
}


// MARK: - IndexPathTraversing
extension UITableView {
    
    
    /// The minimum ("starting") `NSIndexPath` for traversing a `UITableView` "sequentially".
    public var minimumIndexPath: NSIndexPath {
        return NSIndexPath(forRow: 0, inSection: 0)
    }
    
    /// The maximum ("ending") `NSIndexPath` for traversing a `UITableView` "sequentially".
    public var maximumIndexPath: NSIndexPath {
        let lastSection = max(0, numberOfSections - 1)
        let lastRow = max(0, numberOfRowsInSection(lastSection) - 1)
        return NSIndexPath(forRow: lastRow, inSection: lastSection)
    }
    
    
    /**
     When "sequentially" traversing a `UITableView`, what's the next `NSIndexPath` after the given `NSIndexPath`.
     
     - parameter indexPath: The current indexPath; the path we want to find what comes after.
     
     - returns: The next indexPath, or nil if we're at the maximumIndexPath
     - SeeAlso: `var maximumIndexpath`
     */
    public func nextIndexPathForIndexPath(indexPath: NSIndexPath) -> NSIndexPath? {
        if indexPath == maximumIndexPath {
            return nil
        }
        
        assertIsValidIndexPath(indexPath)
        
        let lastRow = numberOfRowsInSection(indexPath.section)
        if indexPath.item == lastRow  {
            return NSIndexPath(forRow: 0, inSection: indexPath.section + 1)
        } else {
            return NSIndexPath(forRow: indexPath.row + 1, inSection: indexPath.section)
        }
    }
    
    
    /**
     When "sequentially" traversing a `UITableView`, what's the previous `NSIndexPath` before the given `NSIndexPath`.
     
     - parameter indexPath: The current indexPath; the path we want to find what comes before.
     
     - returns: The prior indexPath, or nil if we're at the minimumIndexPath
     - SeeAlso: `var minimumIndexPath`
     */
    public func previousIndexPathForIndexPath(indexPath: NSIndexPath) -> NSIndexPath? {
        if indexPath == minimumIndexPath {
            return nil
        }
        
        assertIsValidIndexPath(indexPath)
        
        if indexPath.item == 0 {
            let lastRow = numberOfRowsInSection(indexPath.section - 1)
            return NSIndexPath(forRow: lastRow, inSection: indexPath.section - 1)
        } else {
            return NSIndexPath(forRow: indexPath.row - 1, inSection: indexPath.section)
        }
    }
    
    private func assertIsValidIndexPath(indexPath: NSIndexPath, file: StaticString = #file, line: UInt = #line) {
        let maxPath = maximumIndexPath
        assert(indexPath.section <= maxPath.section && indexPath.section >= 0,
            "Index path \(indexPath) is outside the bounds set by the minimum (\(minimumIndexPath)) and maximum (\(maxPath)) index path", file: file, line: line)
        let rowCount = numberOfRowsInSection(indexPath.section)
        assert(indexPath.row < rowCount && indexPath.row >= 0,
            "Index path \(indexPath) row index is outside the bounds of the rows (\(rowCount)) in the indexPath's section", file: file, line: line)
    }
}
