//
//  PullableToRefresh.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import UIKit

protocol PullableToRefresh: AnyObject {

    var loadingUIView: LoadingUI & RefreshingUI { get }

    func setUp(loadingUIWith pullAction: Selector)

    func stopLoading()

}
