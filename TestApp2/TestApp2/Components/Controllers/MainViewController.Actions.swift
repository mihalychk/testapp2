//
//  MainViewController.Actions.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import UIKit

extension MainViewController {

    @objc func on(refreshControl: UIRefreshControl) {
        updateData()
    }

}
