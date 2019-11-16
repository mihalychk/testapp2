//
//  Network.Manager.swift
//  TestSDK
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import Foundation

class NetworkManager: NetworkTaskManageable, NetworkSessionHandler, QueueableCallbacks {

    // MARK: - NetworkSessionHandler

    private(set) var sessionConfiguration: URLSessionConfiguration

    private(set) var sessionDelegate: URLSessionDelegate

    private(set) var sessionOperationQueue: OperationQueue

    var session: URLSession?

    // MARK: - NetworkTaskManageable

    var tasks: [NetworkTask] = []

    // MARK: - QueueableCallbacks

    var callbackQueue: DispatchQueue

    init(configuration: URLSessionConfiguration, operationQueue: OperationQueue, callbackQueue: DispatchQueue) {
        sessionConfiguration = configuration
        sessionOperationQueue = operationQueue
        self.callbackQueue = callbackQueue

        let sessionDelegate = NetworkManagerSessionDelegate()
        self.sessionDelegate = sessionDelegate
        sessionDelegate.manager = self
    }

}
