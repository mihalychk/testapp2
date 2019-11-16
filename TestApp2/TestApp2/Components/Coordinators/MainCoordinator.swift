//
//  MainCoordinator.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 10.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import TestSDK
import UIKit

class MainCoordinator {

    // MARK: - Properties

    let api = SDKApi.default()

    // MARK: - Controllers

    let mainController = MainViewController()

    let mainNavigationController = UINavigationController()

    weak var detailController: DetailViewController?

    // MARK: - Initializing

    init() {
        mainController.delegate = self
    }

    // MARK: - Internal

    func hookUp() {
        mainNavigationController.viewControllers = [
            mainController
        ]
    }

}
