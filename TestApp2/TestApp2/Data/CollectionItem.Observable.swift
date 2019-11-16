//
//  CollectionItem.Observable.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import Foundation

protocol CollectionItemObservable: AnyObject {

    var item: CollectionItem? { get }

    func subscribeToItemUpdates()

    func unsubscribeFromItemUpdates()

}

extension CollectionItemObservable where Self: CollectionItemImageObservable & CollectionItemProgressObservable {

    func subscribeToItemUpdates() {
        itemImagesObservation = item?.observe(\.image, options: [ .initial, .new ]) { [weak self] _, _ -> Void in
            self?.itemImageHasBeenUpdated()
        }
        itemProgressObservation = item?.observe(\.progress, options: [ .initial, .new ]) { [weak self] _, _ -> Void in
            self?.itemProgressHasBeenUpdated()
        }
    }

    func unsubscribeFromItemUpdates() {
        itemImagesObservation?.invalidate()
        itemProgressObservation?.invalidate()
    }

}
