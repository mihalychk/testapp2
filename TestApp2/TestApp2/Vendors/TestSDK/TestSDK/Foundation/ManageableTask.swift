//
//  ManageableTask.swift
//  TestSDK
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import Foundation

protocol ManageableTask: AnyObject {

    func cancel()

    func resume()

    func suspend()

}
