//
//  MainCollectionViewCell.CollectionItem.Observable.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import UIKit

extension MainCollectionViewCell: CollectionItemObservable {

    func itemImageHasBeenUpdated() {
        imageView?.image = item?.image
    }

    func itemProgressHasBeenUpdated() {
        // On cells progress looks ugly
    }

}
