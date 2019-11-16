//
//  MainCoordinator.Coordinator.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import UIKit

extension MainCoordinator: Coordinator {

    var presentingViewController: UIViewController {
        return [
            detailController,
            mainNavigationController
        ].compactMap { $0 }.first!
    }

    var viewController: UIViewController { return mainNavigationController }

    func makeKeyAndVisible() {
        hookUp()
    }

}
