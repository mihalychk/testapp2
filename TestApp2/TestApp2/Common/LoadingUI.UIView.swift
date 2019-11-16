//
//  LoadingUI.UIView.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import UIKit

extension LoadingUI where Self: UIView {

    func hookUpLoadingActivityIndicatorView() {
        if let loadingActivityIndicatorView = loadingActivityIndicatorView {
            addSubview(loadingActivityIndicatorView)
        }
    }

    func setUpLoadingActivityIndicatorView() {
        loadingActivityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
        loadingActivityIndicatorView?.color = Appearance.interactionColor
        loadingActivityIndicatorView?.hidesWhenStopped = true
    }

}
