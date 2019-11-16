//
//  MainCollectionViewCell.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell, CollectionViewCell, CollectionItemImageObservable, CollectionItemProgressObservable {

    // MARK: - Outlets

    @IBOutlet private(set) weak var imageView: UIImageView?

    // MARK: - CollectionViewCell

    static let reuseIdentifier = String(describing: MainCollectionViewCell.self)

    // MARK: - CollectionItemImageObservable

    var itemImagesObservation: NSKeyValueObservation?

    // MARK: - CollectionItemProgressObservable

    var itemProgressObservation: NSKeyValueObservation?

    // MARK: - Properties

    var item: CollectionItem? {
        willSet {
            if item != newValue {
                unsubscribeFromItemUpdates()
            }
        }
        didSet {
            if item != oldValue {
                subscribeToItemUpdates()
            }
        }
    }

    // MARK: - Life-Cycle

    override func awakeFromNib() {
        super.awakeFromNib()

        setUpSelf()
        setUpBackgroundView()
        setUpSelectedBackgroundView()
    }

    // MARK: - Private

    private func setUpSelf() {
        backgroundColor = .clear

        layer.cornerRadius = 4.0
        layer.masksToBounds = true
    }

    private func setUpBackgroundView() {
        backgroundView = UIView(frame: .zero)
        backgroundView?.backgroundColor = Appearance.cellBackgroundColor
    }

    private func setUpSelectedBackgroundView() {
        selectedBackgroundView = UIView(frame: .zero)
        selectedBackgroundView?.backgroundColor = Appearance.interactionColor
    }

}
