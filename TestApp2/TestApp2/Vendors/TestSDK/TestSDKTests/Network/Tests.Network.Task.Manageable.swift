//
//  Tests.Network.Task.Manageable.swift
//  TestSDKTests
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import XCTest
@testable import TestSDK

class NetworkTaskManageableTests: XCTestCase {

    private var taskManageable: NetworkTaskManageableMock?

    private var request: URLRequest?

    override func setUp() {
        taskManageable = NetworkTaskManageableMock()

        guard let url = URL(string: "https://\(UUID().uuidString).com") else { XCTFail(); return }

        request = URLRequest(url: url)
    }

    func testCreate() {
        XCTAssert(taskManageable!.tasks.count == 0)

        let task = taskManageable!.createTask(with: request!)

        XCTAssert(taskManageable!.tasks.count == 1)
        XCTAssert(taskManageable!.tasks.contains(task))
    }

    func testGet() {
        let task = taskManageable!.createTask(with: request!)
        let gotTask = taskManageable!.get(taskBy: task.subTask)

        XCTAssertEqual(gotTask, task)
    }

    func testRemove() {
        let task = taskManageable!.createTask(with: request!)
        let result = taskManageable!.remove(task: task)

        XCTAssert(result)
        XCTAssert(taskManageable!.tasks.count == 0)
    }

    func testAdd() {
        let task = taskManageable!.createTask(with: request!)

        taskManageable!.remove(task: task)
        taskManageable!.append(task: task)

        XCTAssert(taskManageable!.tasks.count == 1)
        XCTAssert(taskManageable!.tasks.contains(task))
    }

}

fileprivate class URLSessionDelegateMock: NSObject, URLSessionDelegate { }

fileprivate class NetworkTaskManageableMock: NetworkTaskManageable, NetworkSessionHandler, QueueableCallbacks {

    var tasks: [NetworkTask] = []

    var sessionConfiguration: URLSessionConfiguration = .default

    var sessionDelegate: URLSessionDelegate = URLSessionDelegateMock()

    var sessionOperationQueue: OperationQueue = .main

    var session: URLSession? = .shared

    func destroySession() { }

    func startSession() { }

    var callbackQueue: DispatchQueue = .main

}
