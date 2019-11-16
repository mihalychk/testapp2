//
//  MainViewController.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import TestSDK
import UIKit

class MainViewController: UIViewController {

    // MARK: - Outlets

    var mainView: MainView {
        guard let mainView = view as? MainView else {
            Logger.fatal("Internal inconsistency, view of controller isn't a MainView.")
        }
        return mainView
    }

    // MARK: - Properties

    weak var delegate: MainViewControllerDelegate?

    // MARK: - Life-Cycle

    override func loadView() {
        view = MainView(frame: .zero)

        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = NSLocalizedString("Gallery", comment: "")

        mainView.refreshControl?.addTarget(self, action: #selector(on(refreshControl:)), for: .valueChanged)
        mainView.loadingActivityIndicatorView?.startAnimating()

        updateData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if let indexPaths = mainView.collectionView.indexPathsForSelectedItems {
            for indexPath in indexPaths {
                mainView.collectionView.deselectItem(at: indexPath, animated: true)
            }
        }
    }

    // MARK: - Internal

    private(set) var items: [CollectionItem]? { didSet { mainView.collectionView.reloadData() } }

    func updateData() {
        mainViewController(self) { [weak self] items in
            self?.items = items
            self?.stopLoading()
        }
    }

    func get(itemFor indexPath: IndexPath) -> CollectionItem {
        guard let item = items?[indexPath.item] else {
            Logger.fatal("Internal inconsistency.")
        }

        return item
    }

}
