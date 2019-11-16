//
//  Subtaskable.swift
//  TestSDK
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import Foundation

protocol Subtaskable {

    associatedtype SubTask

    var subTask: SubTask { get }

}
