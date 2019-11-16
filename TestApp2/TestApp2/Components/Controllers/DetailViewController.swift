//
//  DetailViewController.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import TestSDK
import UIKit

class DetailViewController: UIViewController, CollectionItemImageObservable, CollectionItemProgressObservable {

    // MARK: - Outlets

    var detailView: DetailView {
        guard let detailView = view as? DetailView else {
            Logger.fatal("Internal inconsistency, view of controller isn't a DetailView.")
        }
        return detailView
    }

    // MARK: - CollectionItemObservable

    var item: CollectionItem? {
        willSet { if item != newValue { unsubscribeFromItemUpdates() } }
        didSet { if item != oldValue { subscribeToItemUpdates() } }
    }

    // MARK: - CollectionItemImageObservable

    var itemImagesObservation: NSKeyValueObservation?

    // MARK: - CollectionItemProgressObservable

    var itemProgressObservation: NSKeyValueObservation?

    // MARK: - Properties

    weak var delegate: DetailViewControllerDelegate?

    // MARK: - Initializing

    init(with item: CollectionItem) {
        super.init(nibName: nil, bundle: nil)

        self.item = item
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        unsubscribeFromItemUpdates()
    }

    // MARK: - Life-Cycle

    override func loadView() {
        view = DetailView(frame: .zero)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        subscribeToItemUpdates()

        title = NSLocalizedString("Photo", comment: "")

        detailView.doubleTapRecognizer.addTarget(self, action: #selector(on(doubleTapRecognizer:)))

        guard let item = item else { Logger.fatal("Item is not set.") }

        detailViewController(self, wantsToLoadImageFor: item)
    }

}
