//
//  CollectionViewCell.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import TestSDK
import UIKit

protocol CollectionViewCell: AnyObject {

    static var reuseIdentifier: String { get }

    static func register(collectionView: UICollectionView)

    static func dequeueReusableCell(in collectionView: UICollectionView, for indexPath: IndexPath) -> Self

}

extension CollectionViewCell {

    static func register(collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }

    static func dequeueReusableCell(in collectionView: UICollectionView, for indexPath: IndexPath) -> Self {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Self.reuseIdentifier, for: indexPath) as? Self else {
            Logger.fatal("Internal inconsistency.")
        }

        return cell
    }

}
