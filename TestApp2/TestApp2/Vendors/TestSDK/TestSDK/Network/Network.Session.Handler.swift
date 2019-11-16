//
//  Network.Session.Handler.swift
//  TestSDK
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import Foundation

protocol NetworkSessionHandler: AnyObject {

    var sessionConfiguration: URLSessionConfiguration { get }

    var sessionDelegate: URLSessionDelegate { get }

    var sessionOperationQueue: OperationQueue { get }

    var session: URLSession? { get set }

    func destroySession()

    func startSession()

}

extension NetworkSessionHandler where Self: NetworkTaskManageable {

    func startSession() {
        guard session == nil else {
            Logger.fatal("Session is already started.")
        }

        session = URLSession(configuration: sessionConfiguration, delegate: sessionDelegate, delegateQueue: sessionOperationQueue)
    }

    func destroySession() {
        tasks.removeAll()
        session?.invalidateAndCancel()
        session = nil
    }

}
