//
//  RefreshingUI.UIView.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import UIKit

extension RefreshingUI where Self: UIView {

    func setUpRefreshControl() {
        refreshControl = UIRefreshControl(frame: .zero)
        refreshControl?.tintColor = Appearance.interactionColor
    }

}
