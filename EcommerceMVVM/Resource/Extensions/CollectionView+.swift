//
//  CollectionView+.swift
//  ECommerce
//
//  Created by hasancan on 8.03.2025.
//

import UIKit

public extension UICollectionViewCell {
    static var identifier: String {
        String(describing: type(of: self))
    }
}
