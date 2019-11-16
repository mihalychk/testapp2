//
//  Tests.CollectionItem.Observable.swift
//  TestApp2Tests
//
//  Created by Mikhail Kalinin on 12.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import XCTest
@testable import TestApp2

class CollectionItemObservableTests: XCTestCase {

    var collectionItem: CollectionItem?

    var itemObservable: CollectionItemObservableMock?

    override func setUp() {
        let urlString = UUID().uuidString + ".de/" + UUID().uuidString
        let resource = ImageResource(with: urlString)
        collectionItem = CollectionItem(with: resource)

        itemObservable = CollectionItemObservableMock()
        itemObservable?.item = collectionItem
        itemObservable?.subscribeToItemUpdates()
    }

    override func tearDown() {
        itemObservable?.unsubscribeFromItemUpdates()
    }

    func testImageHasBeenUpdated() {
        let updateExpectation = expectation(description: "Update")

        itemObservable?.onImageHasBeenUpdated = {
            updateExpectation.fulfill()
        }

        collectionItem?.image = UIImage()

        waitForExpectations(timeout: 0.125)
    }

    func testProgressHasBeenUpdated() {
        let updateExpectation = expectation(description: "Update")

        itemObservable?.onProgressHasBeenUpdated = {
            updateExpectation.fulfill()
        }

        collectionItem?.progress = Progress()

        waitForExpectations(timeout: 0.125)
    }

}

class CollectionItemObservableMock: CollectionItemObservable, CollectionItemImageObservable, CollectionItemProgressObservable {

    // MARK: - Mock

    var onImageHasBeenUpdated: (() -> Void)?

    var onProgressHasBeenUpdated: (() -> Void)?

    // MARK: - CollectionItemObservable

    var item: CollectionItem?

    // MARK: - CollectionItemImageObservable

    var itemImagesObservation: NSKeyValueObservation?

    func itemImageHasBeenUpdated() {
        onImageHasBeenUpdated?()
    }

    // MARK: - CollectionItemProgressObservable

    var itemProgressObservation: NSKeyValueObservation?

    func itemProgressHasBeenUpdated() {
        onProgressHasBeenUpdated?()
    }

}
