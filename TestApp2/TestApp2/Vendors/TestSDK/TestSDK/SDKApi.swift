//
//  SDKApi.swift
//  TestSDK
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import Foundation

public class SDKApi {

    // MARK: - Public

    public class func `default`() -> SDKApi {
        return SDKApi(callbackQueue: DispatchQueue.main)
    }

    public init(callbackQueue: DispatchQueue) {
        self.callbackQueue = callbackQueue

        networkManager = SDKApi.networkManager(with: callbackQueue)
        networkManager.startSession()
    }

    public func create(with request: URLRequest) -> NetworkTask {
        let task = networkManager.createTask(with: request)

        return task
    }

    // MARK: - Internal

    @available(*, unavailable) init() {
        Logger.fatal("init() is not allowed")
    }

    deinit {
        networkManager.destroySession()
    }

    static func networkManager(with callbackQueue: DispatchQueue) -> NetworkManager {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30.0
        configuration.timeoutIntervalForResource = 30.0

        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 1
        operationQueue.qualityOfService = .userInteractive

        return NetworkManager(configuration: configuration, operationQueue: operationQueue, callbackQueue: callbackQueue)
    }

    // MARK: - Private

    private var callbackQueue: DispatchQueue

    private var networkManager: NetworkManager

}
