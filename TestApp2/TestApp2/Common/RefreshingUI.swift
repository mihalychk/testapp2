//
//  RefreshingUI.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import UIKit

protocol RefreshingUI: AnyObject {

    var refreshControl: UIRefreshControl? { get set }

    var scrollView: UIScrollView? { get }

    func setUpRefreshControl()

}
