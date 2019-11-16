//
//  MainCoordinator.Controllers.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import UIKit

extension MainCoordinator {

    func add(detailControllerFor item: CollectionItem, animated: Bool) {
        let detailController = DetailViewController(with: item)
        detailController.delegate = self
        self.detailController = detailController

        mainNavigationController.pushViewController(detailController, animated: animated)
    }

}
