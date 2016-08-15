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
    public func registerCell<T: UITableViewCell>(_ type: T.Type, withIdentifier reuseIdentifier: String = String(describing: T.self)) {
        register(T.self, forCellReuseIdentifier: reuseIdentifier)
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
    public func dequeueCell<T: UITableViewCell>(_ type: T.Type = T.self, withIdentifier reuseIdentifier: String = String(describing: T.self)) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: reuseIdentifier) as? T else {
            fatalError("Unknown cell type (\(T.self)) for reuse identifier: \(reuseIdentifier)")
        }
        return cell
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
    public func dequeueCell<T: UITableViewCell>(_ type: T.Type = T.self, withIdentifier reuseIdentifier: String = String(describing: T.self), for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unknown cell type (\(T.self)) for reuse identifier: \(reuseIdentifier)")
        }
        return cell
    }
    
    /**
     Inserts rows into self.
     
     - parameter indices: The rows indices to insert into self.
     - parameter section: The section in which to insert the rows (optional, defaults to 0).
     - parameter animation: The animation to use for the row insertion (optional, defaults to `.Automatic`).
     */
    public func insert(_ indices: [Int], section: Int = 0, animation: UITableViewRowAnimation = .automatic) {
        guard !indices.isEmpty else { return }
        
        let indexPaths = indices.map { IndexPath(row: $0, section: section) }
        
        beginUpdates()
        insertRows(at: indexPaths, with: animation)
        endUpdates()
    }
    
    /**
     Deletes rows from self.
     
     - parameter indices: The rows indices to delete from self.
     - parameter section: The section in which to delete the rows (optional, defaults to 0).
     - parameter animation: The animation to use for the row deletion (optional, defaults to `.Automatic`).
     */
    public func delete(_ indices: [Int], section: Int = 0, animation: UITableViewRowAnimation = .automatic) {
        guard !indices.isEmpty else { return }
        
        let indexPaths = indices.map { IndexPath(row: $0, section: section) }
        
        beginUpdates()
        deleteRows(at: indexPaths, with: animation)
        endUpdates()
    }
    
    /**
     Reloads rows in self.
     
     - parameter indices: The rows indices to reload in self.
     - parameter section: The section in which to reload the rows (optional, defaults to 0).
     - parameter animation: The animation to use for reloading the rows (optional, defaults to `.Automatic`).
     */
    public func reload(_ indices: [Int], section: Int = 0, animation: UITableViewRowAnimation = .automatic) {
        guard !indices.isEmpty else { return }
        
        let indexPaths = indices.map { IndexPath(row: $0, section: section) }
        
        beginUpdates()
        reloadRows(at: indexPaths, with: animation)
        endUpdates()
    }
}

// MARK: - IndexPathTraversing
extension UITableView {
    
    
    /// The minimum ("starting") `IndexPath` for traversing a `UITableView` "sequentially".
    public var minimumIndexPath: IndexPath {
        return IndexPath(row: 0, section: 0)
    }
    
    /// The maximum ("ending") `IndexPath` for traversing a `UITableView` "sequentially".
    public var maximumIndexPath: IndexPath {
        let lastSection = max(0, numberOfSections - 1)
        let lastRow = max(0, numberOfRows(inSection: lastSection) - 1)
        return IndexPath(row: lastRow, section: lastSection)
    }
    
    
    /**
     When "sequentially" traversing a `UITableView`, what's the next `IndexPath` after the given `IndexPath`.
     
     - parameter indexPath: The current indexPath; the path we want to find what comes after.
     
     - returns: The next indexPath, or nil if we're at the maximumIndexPath
     - SeeAlso: `var maximumIndexpath`
     */
    public func indexPath(after indexPath: IndexPath) -> IndexPath? {
        if indexPath == maximumIndexPath {
            return nil
        }
        
        assertIsValid(indexPath: indexPath)
        
        let lastRow = numberOfRows(inSection: indexPath.section)
        if indexPath.item == lastRow  {
            return IndexPath(row: 0, section: indexPath.section + 1)
        } else {
            return IndexPath(row: indexPath.row + 1, section: indexPath.section)
        }
    }
    
    
    /**
     When "sequentially" traversing a `UITableView`, what's the previous `IndexPath` before the given `IndexPath`.
     
     - parameter indexPath: The current indexPath; the path we want to find what comes before.
     
     - returns: The prior indexPath, or nil if we're at the minimumIndexPath
     - SeeAlso: `var minimumIndexPath`
     */
    public func indexPath(before indexPath: IndexPath) -> IndexPath? {
        if indexPath == minimumIndexPath {
            return nil
        }
        
        assertIsValid(indexPath: indexPath)
        
        if indexPath.item == 0 {
            let lastRow = numberOfRows(inSection: indexPath.section - 1)
            return IndexPath(row: lastRow, section: indexPath.section - 1)
        } else {
            return IndexPath(row: indexPath.row - 1, section: indexPath.section)
        }
    }
    
    private func assertIsValid(indexPath: IndexPath, file: StaticString = #file, line: UInt = #line) {
        let maxPath = maximumIndexPath
        assert(
            indexPath.section <= maxPath.section && indexPath.section >= 0,
            "Index path \(indexPath) is outside the bounds set by the minimum (\(minimumIndexPath)) and maximum (\(maxPath)) index path",
            file: file,
            line: line
        )
        let rowCount = numberOfRows(inSection: indexPath.section)
        assert(
            indexPath.row < rowCount && indexPath.row >= 0,
            "Index path \(indexPath) row index is outside the bounds of the rows (\(rowCount)) in the indexPath's section",
            file: file,
            line: line
        )
    }
}
