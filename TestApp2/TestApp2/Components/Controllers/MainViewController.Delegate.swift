//
//  MainViewController.Delegate.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import TestSDK
import UIKit

protocol MainViewControllerDelegate: AnyObject {

    func mainViewController(_ mainViewController: MainViewController, didTapOn item: CollectionItem)

    func mainViewController(_ mainViewController: MainViewController, wantsToLoadImageFor item: CollectionItem)

    func mainViewController(_ mainViewController: MainViewController, wantsToUpdateWith completion: @escaping ([CollectionItem]?) -> Void)

}

extension MainViewController: MainViewControllerDelegate {

    func mainViewController(_ mainViewController: MainViewController, didTapOn item: CollectionItem) {
        guard let delegate = delegate else { Logger.fatal("Delegate should be set") }
        delegate.mainViewController(mainViewController, didTapOn: item)
    }

    func mainViewController(_ mainViewController: MainViewController, wantsToLoadImageFor item: CollectionItem) {
        guard let delegate = delegate else { Logger.fatal("Delegate should be set") }
        delegate.mainViewController(mainViewController, wantsToLoadImageFor: item)
    }

    func mainViewController(_ mainViewController: MainViewController, wantsToUpdateWith completion: @escaping ([CollectionItem]?) -> Void) {
        guard let delegate = delegate else { Logger.fatal("Delegate should be set") }
        delegate.mainViewController(mainViewController, wantsToUpdateWith: completion)
    }

}
