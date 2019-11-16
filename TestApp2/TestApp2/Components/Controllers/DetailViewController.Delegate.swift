//
//  DetailViewController.Delegate.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import TestSDK
import UIKit

protocol DetailViewControllerDelegate: AnyObject {

    func detailViewController(_ detailViewController: DetailViewController, wantsToLoadImageFor item: CollectionItem)

}

extension DetailViewController: DetailViewControllerDelegate {

    func detailViewController(_ detailViewController: DetailViewController, wantsToLoadImageFor item: CollectionItem) {
        guard let delegate = delegate else { Logger.fatal("Delegate should be set") }
        delegate.detailViewController(detailViewController, wantsToLoadImageFor: item)
    }

}
