//
//  LoadingUI.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import UIKit

protocol LoadingUI: AnyObject {

    var loadingActivityIndicatorView: UIActivityIndicatorView? { get set }

    func hookUpLoadingActivityIndicatorView()

    func setUpLoadingActivityIndicatorView()

}
