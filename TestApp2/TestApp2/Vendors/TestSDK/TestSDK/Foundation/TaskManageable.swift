//
//  TaskManageable.swift
//  TestSDK
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import Foundation

protocol TaskManageable: AnyObject {

    associatedtype Task

    var tasks: [Task] { get set }

    func append(task: Task)

    @discardableResult func remove(task: Task) -> Bool

}
