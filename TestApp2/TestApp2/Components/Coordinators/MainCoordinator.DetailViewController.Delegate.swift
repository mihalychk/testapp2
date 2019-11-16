//
//  MainCoordinator.DetailViewController.Delegate.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import UIKit

extension MainCoordinator: DetailViewControllerDelegate {

    func detailViewController(_ detailViewController: DetailViewController, wantsToLoadImageFor item: CollectionItem) {
        let url = item.imageResource.fullImageURL
        let request = URLRequest(url: url)
        let task = api.create(with: request)

        item.start(download: task)
    }

}
