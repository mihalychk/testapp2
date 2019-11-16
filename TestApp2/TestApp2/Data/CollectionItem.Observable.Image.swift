//
//  CollectionItem.Observable.Image.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import Foundation

protocol CollectionItemImageObservable: AnyObject {

    var itemImagesObservation: NSKeyValueObservation? { get set }

    func itemImageHasBeenUpdated()

}

