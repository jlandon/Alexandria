//
//  UICollectionView+Extensions.swift
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

extension UICollectionView {
    
    // MARK: Cells
    
    /**
     Registers a UICollectionViewCell for use in a UICollectionView.
     
     - parameter type: The type of cell to register.
     - parameter reuseIdentifier: The reuse identifier for the cell (optional).
     
     By default, the class name of the cell is used as the reuse identifier.
     
     Example:
     ```
     class CustomCell: UICollectionViewCell {}
     
     let collectionView = UICollectionView()
     
     // registers the CustomCell class with a reuse identifier of "CustomCell"
     collectionView.registerCell(CustomCell)
     ```
     */
    public func registerCell<T: UICollectionViewCell>(type: T.Type, reuseIdentifier: String? = nil) {
        registerClass(T.self, forCellWithReuseIdentifier: reuseIdentifier ?? T.className)
    }
    
    /**
     Dequeues a UICollectionViewCell for use in a UICollectionView.
     
     - parameter type: The type of the cell.
     - parameter indexPath: The index path at which to dequeue a new cell.
     - parameter reuseIdentifier: The reuse identifier for the cell (optional).
     
     - returns: A force-casted UICollectionViewCell of the specified type.
     
     By default, the class name of the cell is used as the reuse identifier.
     
     Example:
     ```
     class CustomCell: UICollectionViewCell {}
     
     let collectionView = UICollectionView()
     
     // dequeues a CustomCell class
     let cell = collectionView.dequeueReusableCell(CustomCell.self, forIndexPath: indexPath)
     ```
     */
    public func dequeueReusableCell<T: UICollectionViewCell>(type: T.Type, forIndexPath indexPath: NSIndexPath, reuseIdentifier: String = T.className) -> T {
        return dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! T
    }
    
    // MARK: Headers
    
    /**
     Registers a UICollectionReusableView for use in a UICollectionView section header.
     
     - parameter type: The type of header view to register.
     - parameter reuseIdentifier: The reuse identifier for the header view (optional).
     
     By default, the class name of the header view is used as the reuse identifier.
     
     Example:
     ```
     class CustomHeader: UICollectionReusableView {}
     
     let collectionView = UICollectionView()
     
     // registers the CustomCell class with a reuse identifier of "CustomHeader"
     collectionView.registerHeader(CustomHeader)
     ```
     */
    public func registerHeader<T: UICollectionReusableView>(type: T.Type, reuseIdentifier: String = T.className) {
        registerClass(T.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: reuseIdentifier)
    }
    
    /**
     Dequeues a UICollectionReusableView for use in a UICollectionView section header.
     
     - parameter type: The type of the header view.
     - parameter indexPath: The index path at which to dequeue a new header view.
     - parameter reuseIdentifier: The reuse identifier for the header view (optional).
     
     - returns: A force-casted UICollectionReusableView of the specified type.
     
     By default, the class name of the header view is used as the reuse identifier.
     
     Example:
     ```
     class CustomHeader: UICollectionReusableView {}
     
     let collectionView = UICollectionView()
     
     // dequeues a CustomHeader class
     let footerView = collectionView.dequeueReusableHeader(CustomHeader.self, forIndexPath: indexPath)
     ```
     */
    public func dequeueReusableHeader<T: UICollectionReusableView>(type: T.Type, forIndexPath indexPath: NSIndexPath, reuseIdentifier: String = T.className) -> T {
        return dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: reuseIdentifier, forIndexPath: indexPath) as! T
    }
    
    // MARK: Footers
    
    /**
     Registers a UICollectionReusableView for use in a UICollectionView section footer.
     
     - parameter type: The type of footer view to register.
     - parameter reuseIdentifier: The reuse identifier for the footer view (optional).
     
     By default, the class name of the footer view is used as the reuse identifier.
     
     Example:
     ```
     class CustomFooter: UICollectionReusableView {}
     
     let collectionView = UICollectionView()
     
     // registers the CustomFooter class with a reuse identifier of "CustomFooter"
     collectionView.registerFooter(CustomFooter)
     ```
     */
    public func registerFooter<T: UICollectionReusableView>(type: T.Type, reuseIdentifier: String = T.className) {
        registerClass(T.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: reuseIdentifier)
    }
    
    /**
     Dequeues a UICollectionReusableView for use in a UICollectionView section footer.
     
     - parameter type: The type of the footer view.
     - parameter indexPath: The index path at which to dequeue a new footer view.
     - parameter reuseIdentifier: The reuse identifier for the footer view (optional).
     
     - returns: A force-casted UICollectionReusableView of the specified type.
     
     By default, the class name of the footer view is used as the reuse identifier.
     
     Example:
     ```
     class CustomFooter: UICollectionReusableView {}
     
     let collectionView = UICollectionView()
     
     // dequeues a CustomFooter class
     let footerView = collectionView.dequeueReusableFooter(CustomFooter.self, forIndexPath: indexPath)
     ```
     */
    public func dequeueReusableFooter<T: UICollectionReusableView>(type: T.Type, forIndexPath indexPath: NSIndexPath, reuseIdentifier: String = T.className) -> T {
        return dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionFooter, withReuseIdentifier: reuseIdentifier, forIndexPath: indexPath) as! T
    }
    
    /**
     Inserts rows into self.
     
     - parameter indices: The rows indices to insert into self.
     - parameter section: The section in which to insert the rows (optional, defaults to 0).
     - parameter completion: The completion handler, called after the rows have been inserted (optional).
     */
    public func insert(indices: [Int], section: Int = 0, completion: (Bool) -> Void = { _ in }) {
        let indexPaths = indices.map { NSIndexPath(forRow: $0, inSection: section) }
        performBatchUpdates({ self.insertItemsAtIndexPaths(indexPaths) }, completion: completion)
    }
    
    /**
     Deletes rows from self.
     
     - parameter indices: The rows indices to delete from self.
     - parameter section: The section in which to delete the rows (optional, defaults to 0).
     - parameter completion: The completion handler, called after the rows have been deleted (optional).
     */
    public func delete(indices: [Int], section: Int = 0, completion: (Bool) -> Void = { _ in }) {
        let indexPaths = indices.map { NSIndexPath(forRow: $0, inSection: section) }
        performBatchUpdates({ self.deleteItemsAtIndexPaths(indexPaths) }, completion: completion)
    }
    
    /**
     Reloads rows in self.
     
     - parameter indices: The rows indices to reload in self.
     - parameter section: The section in which to reload the rows (optional, defaults to 0).
     - parameter completion: The completion handler, called after the rows have been reloaded (optional).
     */
    public func reload(indices: [Int], section: Int = 0, completion: (Bool) -> Void = { _ in }) {
        let indexPaths = indices.map { NSIndexPath(forRow: $0, inSection: section) }
        performBatchUpdates({ self.reloadItemsAtIndexPaths(indexPaths) }, completion: completion)
    }
}


// MARK: - IndexPathTraversing

extension UICollectionView {
    
    /// The minimum ("starting") `NSIndexPath` for traversing a `UICollectionView` "sequentially".
    public var minimumIndexPath: NSIndexPath {
        return NSIndexPath(forItem: 0, inSection: 0)
    }

    /// The maximum ("ending") `NSIndexPath` for traversing a `UICollectionView` "sequentially".
    public var maximumIndexPath: NSIndexPath {
        let lastSection = max(0, numberOfSections() - 1)
        let lastItem = max(0, numberOfItemsInSection(lastSection) - 1)
        return NSIndexPath(forItem: lastItem, inSection: lastSection)
    }
    
    
    /**
     When "sequentially" traversing a `UICollectionView`, what's the next `NSIndexPath` after the given `NSIndexPath`.
     
     - parameter indexPath: The current indexPath; the path we want to find what comes after.
     
     - returns: The next indexPath, or nil if we're at the maximumIndexPath
     - SeeAlso: `var maximumIndexpath`
     */
    public func nextIndexPathForIndexPath(indexPath: NSIndexPath) -> NSIndexPath? {
        if indexPath == maximumIndexPath {
            return nil
        }
        
        assertIsValidIndexPath(indexPath)
        
        let lastItem = numberOfItemsInSection(indexPath.section)
        if indexPath.item == lastItem  {
            return NSIndexPath(forItem: 0, inSection: indexPath.section + 1)
        } else {
            return NSIndexPath(forItem: indexPath.item + 1, inSection: indexPath.section)
        }
    }
    
    /**
     When "sequentially" traversing a `UICollectionView`, what's the previous `NSIndexPath` before the given `NSIndexPath`.
     
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
            let lastItem = numberOfItemsInSection(indexPath.section - 1)
            return NSIndexPath(forItem: lastItem, inSection: indexPath.section - 1)
        } else {
            return NSIndexPath(forItem: indexPath.item - 1, inSection: indexPath.section)
        }
    }
    
    private func assertIsValidIndexPath(indexPath: NSIndexPath, file: StaticString = #file, line: UInt = #line) {
        let maxPath = maximumIndexPath
        assert(indexPath.section <= maxPath.section && indexPath.section >= 0,
            "Index path \(indexPath) is outside the bounds set by the minimum (\(minimumIndexPath)) and maximum (\(maxPath)) index path", file: file, line: line)
        let itemCount = numberOfItemsInSection(indexPath.section)
        assert(indexPath.item < itemCount && indexPath.item >= 0,
            "Index path \(indexPath) item index is outside the bounds of the items (\(itemCount)) in the indexPath's section", file: file, line: line)
    }
}
