//
//  PullableToRefresh.UIViewController.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import UIKit

extension PullableToRefresh where Self: UIViewController {

    func setUp(loadingUIWith pullAction: Selector) {
        loadingUIView.refreshControl?.addTarget(self, action: pullAction, for: .valueChanged)
        loadingUIView.loadingActivityIndicatorView?.startAnimating()
    }

    func stopLoading() {
        if loadingUIView.scrollView?.refreshControl == nil {
            loadingUIView.scrollView?.refreshControl = loadingUIView.refreshControl
        }
        loadingUIView.refreshControl?.endRefreshing()
        loadingUIView.loadingActivityIndicatorView?.stopAnimating()
    }

}
