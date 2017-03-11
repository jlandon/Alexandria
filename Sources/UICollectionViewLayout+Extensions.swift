//
//  UICollectionViewLayout+Extensions.swift
//  Alexandria
//
//  Created by Jonathan Landon on 3/11/17.
//
//

import UIKit

extension UICollectionViewFlowLayout {
    
    /**
     Returns a UICollectionViewFlowLayout initialized with the provided scroll direction, item spacing, line spacing, and section inset.
     
     - parameter scrollDirection: The scroll direction of the layout.
     - parameter itemSpacing: The minimum spacing to use between items in the same row (optional, defaults to 10).
     - parameter lineSpacing: The minimum spacing to use between lines of items in the grid (optional, defaults to 10).
     - parameter sectionInset: The margins used to lay out content in a section (optional, defaults to `.zero`).
     
     - returns: A UICollectionViewFlowLayout initialized with the provided scroll direction, item spacing, line spacing, and section inset.
     */
    public convenience init(
        scrollDirection: UICollectionViewScrollDirection,
        itemSpacing: CGFloat = 10,
        lineSpacing: CGFloat = 10,
        sectionInset: UIEdgeInsets = .zero)
    {
        self.init()
        self.scrollDirection = scrollDirection
        self.minimumInteritemSpacing = itemSpacing
        self.minimumLineSpacing = lineSpacing
        self.sectionInset = sectionInset
    }
    
    /**
     Creates a vertical UICollectionViewFlowLayout.
     
     - parameter itemSpacing: The minimum spacing between items in the same row (optional, defaults to 10).
     - parameter lineSpacing: The minimum spacing between successive rows (optional, defaults to 10).
     - parameter sectionInset: The spacing at the outer edges of the section (optional, defaults to `.zero`).
     
     - returns: A vertical UICollectionViewFlowLayout with the specified item spacing, line spacing, and section inset.
     */
    public static func vertical(itemSpacing: CGFloat = 10, lineSpacing: CGFloat = 10, sectionInset: UIEdgeInsets = .zero) -> UICollectionViewFlowLayout {
        return UICollectionViewFlowLayout(scrollDirection: .vertical, itemSpacing: itemSpacing, lineSpacing: lineSpacing, sectionInset: sectionInset)
    }
    
    /**
     Creates a horizontal UICollectionViewFlowLayout.
     
     - parameter itemSpacing: The minimum spacing between items in the same column (optional, defaults to 10).
     - parameter lineSpacing: The minimum spacing between successive columns (optional, defaults to 10).
     - parameter sectionInset: The spacing at the outer edges of the section (optional, defaults to `.zero`).
     
     - returns: A vertical UICollectionViewFlowLayout with the specified item spacing, line spacing, and section inset.
     */
    public static func horizontal(itemSpacing: CGFloat = 10, lineSpacing: CGFloat = 10, sectionInset: UIEdgeInsets = .zero) -> UICollectionViewFlowLayout {
        return UICollectionViewFlowLayout(scrollDirection: .horizontal, itemSpacing: itemSpacing, lineSpacing: lineSpacing, sectionInset: sectionInset)
    }
    
}
