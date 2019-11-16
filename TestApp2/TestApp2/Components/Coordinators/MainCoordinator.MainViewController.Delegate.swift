//
//  MainCoordinator.MainViewController.Delegate.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import TestSDK
import UIKit

extension MainCoordinator: MainViewControllerDelegate {

    func mainViewController(_ mainViewController: MainViewController, didTapOn item: CollectionItem) {
        let newItem = CollectionItem(with: item)
        add(detailControllerFor: newItem, animated: true)
    }

    func mainViewController(_ mainViewController: MainViewController, wantsToLoadImageFor item: CollectionItem) {
        guard item.progress == nil && item.image == nil else { return }

        let url = item.imageResource.previewImageURL
        let request = URLRequest(url: url)
        let task = api.create(with: request)

        item.start(download: task)
    }

    func mainViewController(_ mainViewController: MainViewController, wantsToUpdateWith completion: @escaping ([CollectionItem]?) -> Void) {
        guard let url = URL(string: "https://m.mobile.de/svc/a/282903672") else {
            Logger.fatal("Wrong URL.")
        }
        let request = URLRequest(url: url)
        let task = api.create(with: request)
        task.onFailure = { [weak self] error in
            self?.alert(errorWith: error.localizedDescription)
            completion(nil)
        }
        task.onSuccess = { _, _, json in
            completion(MainCoordinator.convert(json))
        }
        task.resume()

    }

    static func convert(_ json: Any?) -> [CollectionItem]? {
        guard
            let result = json as? [String: Any],
            let images = result["images"] as? [[String: Any]]
        else { return nil }

        let items = images.compactMap { rawImage -> CollectionItem? in
            guard let uri = rawImage["uri"] as? String else { return nil }

            let imageResource = ImageResource(with: uri)
            let item = CollectionItem(with: imageResource)

            return item
        }

        return items
    }

}
