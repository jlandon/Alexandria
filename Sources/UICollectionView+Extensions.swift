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
    
    /// Returns a UICollectionView with the specified layout.
    public convenience init(layout: UICollectionViewFlowLayout) {
        self.init(frame: .zero, collectionViewLayout: layout)
    }
    
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
    public func registerCell<T: UICollectionViewCell>(_ type: T.Type, withIdentifier reuseIdentifier: String = String(describing: T.self)) {
        register(T.self, forCellWithReuseIdentifier: reuseIdentifier)
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
    public func dequeueCell<T: UICollectionViewCell>(_ type: T.Type = T.self,
                             withIdentifier reuseIdentifier: String = String(describing: T.self),
                                              for indexPath: IndexPath) -> T
    {
        guard let cell = dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unknown cell type (\(T.self)) for reuse identifier: \(reuseIdentifier)")
        }
        return cell
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
    public func registerHeader<T: UICollectionReusableView>(_ type: T.Type, withIdentifier reuseIdentifier: String = String(describing: T.self)) {
        register(T.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: reuseIdentifier)
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
    public func dequeueHeader<T: UICollectionReusableView>(_ type: T.Type = T.self,
                                   withIdentifier reuseIdentifier: String = String(describing: T.self),
                                                    for indexPath: IndexPath) -> T
    {
        guard let header = dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unknown header type (\(T.self)) for reuse identifier: \(reuseIdentifier)")
        }
        return header
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
    public func registerFooter<T: UICollectionReusableView>(_ type: T.Type, withIdentifier reuseIdentifier: String = String(describing: T.self)) {
        register(T.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: reuseIdentifier)
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
    public func dequeueFooter<T: UICollectionReusableView>(_ type: T.Type = T.self,
                                   withIdentifier reuseIdentifier: String = String(describing: T.self),
                                                    for indexPath: IndexPath) -> T
    {
        guard let footer = dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unknown footer type (\(T.self)) for reuse identifier: \(reuseIdentifier)")
        }
        return footer
    }
    
    /**
     Inserts rows into self.
     
     - parameter indices: The rows indices to insert into self.
     - parameter section: The section in which to insert the rows (optional, defaults to 0).
     - parameter completion: The completion handler, called after the rows have been inserted (optional).
     */
    public func insert(_ indices: [Int], section: Int = 0, completion: @escaping (Bool) -> Void = { _ in }) {
        guard !indices.isEmpty else { return }
        
        let indexPaths = indices.map { IndexPath(row: $0, section: section) }
        performBatchUpdates({ self.insertItems(at: indexPaths) }, completion: completion)
    }
    
    /**
     Deletes rows from self.
     
     - parameter indices: The rows indices to delete from self.
     - parameter section: The section in which to delete the rows (optional, defaults to 0).
     - parameter completion: The completion handler, called after the rows have been deleted (optional).
     */
    public func delete(_ indices: [Int], section: Int = 0, completion: @escaping (Bool) -> Void = { _ in }) {
        guard !indices.isEmpty else { return }
        
        let indexPaths = indices.map { IndexPath(row: $0, section: section) }
        performBatchUpdates({ self.deleteItems(at: indexPaths) }, completion: completion)
    }
    
    /**
     Reloads rows in self.
     
     - parameter indices: The rows indices to reload in self.
     - parameter section: The section in which to reload the rows (optional, defaults to 0).
     - parameter completion: The completion handler, called after the rows have been reloaded (optional).
     */
    public func reload(_ indices: [Int], section: Int = 0, completion: @escaping (Bool) -> Void = { _ in }) {
        guard !indices.isEmpty else { return }
        
        let indexPaths = indices.map { IndexPath(row: $0, section: section) }
        performBatchUpdates({ self.reloadItems(at: indexPaths) }, completion: completion)
    }
}


// MARK: - IndexPathTraversing

extension UICollectionView {
    
    /// The minimum ("starting") `IndexPath` for traversing a `UICollectionView` "sequentially".
    public var minimumIndexPath: IndexPath {
        return IndexPath(item: 0, section: 0)
    }

    /// The maximum ("ending") `IndexPath` for traversing a `UICollectionView` "sequentially".
    public var maximumIndexPath: IndexPath {
        let lastSection = max(0, numberOfSections - 1)
        let lastItem = max(0, numberOfItems(inSection: lastSection) - 1)
        return IndexPath(item: lastItem, section: lastSection)
    }
    
    
    /**
     When "sequentially" traversing a `UICollectionView`, what's the next `IndexPath` after the given `IndexPath`.
     
     - parameter indexPath: The current indexPath; the path we want to find what comes after.
     
     - returns: The next indexPath, or nil if we're at the maximumIndexPath
     - SeeAlso: `var maximumIndexpath`
     */
    public func indexPath(after indexPath: IndexPath) -> IndexPath? {
        if indexPath == maximumIndexPath {
            return nil
        }
        
        assertIsValid(indexPath: indexPath)
        
        let lastItem = numberOfItems(inSection: indexPath.section)
        if indexPath.item == lastItem  {
            return IndexPath(item: 0, section: indexPath.section + 1)
        } else {
            return IndexPath(item: indexPath.item + 1, section: indexPath.section)
        }
    }
    
    /**
     When "sequentially" traversing a `UICollectionView`, what's the previous `IndexPath` before the given `IndexPath`.
     
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
            let lastItem = numberOfItems(inSection: indexPath.section - 1)
            return IndexPath(item: lastItem, section: indexPath.section - 1)
        } else {
            return IndexPath(item: indexPath.item - 1, section: indexPath.section)
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
        let itemCount = numberOfItems(inSection: indexPath.section)
        assert(
            indexPath.item < itemCount && indexPath.item >= 0,
            "Index path \(indexPath) item index is outside the bounds of the items (\(itemCount)) in the indexPath's section",
            file: file,
            line: line
        )
    }
}
