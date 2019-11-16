//
//  DetailViewController.Actions.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import UIKit

extension DetailViewController {

    @objc func on(doubleTapRecognizer: UITapGestureRecognizer) {
        detailView.scrollView.setZoomScale(1.0, animated: true)
    }

}
