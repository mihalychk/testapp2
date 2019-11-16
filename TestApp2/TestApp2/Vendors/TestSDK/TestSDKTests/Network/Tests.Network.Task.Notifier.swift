//
//  Tests.Network.Task.Notifier.swift
//  TestSDKTests
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import XCTest
@testable import TestSDK

class NetworkTaskNotifierTests: XCTestCase {

    func testFailure() {
        let failureExpectation = expectation(description: "Failure")

        let errorToSend = NetworkTaskNotifierError()
        let notifier = NetworkTaskNotifierMock()
        notifier.onFailure = { error in
            guard let error = error as? NetworkTaskNotifierError else { XCTFail(); return }
            XCTAssert(error == errorToSend)
            failureExpectation.fulfill()
        }
        notifier.failure(error: errorToSend)

        waitForExpectations(timeout: 0.125)
    }

    func testFinish() {
        let finishExpectation = expectation(description: "Finish")

        let notifier = NetworkTaskNotifierMock()
        notifier.onFinish = {
            finishExpectation.fulfill()
        }
        notifier.finish()

        waitForExpectations(timeout: 0.125)
    }

    func testProgress() {
        let progressExpectation = expectation(description: "Progress")

        let total = Int64.random(in: 100...10000)
        let completed = Int64.random(in: 0...total)

        let notifier = NetworkTaskNotifierMock()
        notifier.onProgress = { progress in
            XCTAssert(progress.completedUnitCount == completed)
            XCTAssert(progress.totalUnitCount == total)
            progressExpectation.fulfill()
        }
        notifier.progress(completed: completed, total: total)

        waitForExpectations(timeout: 0.125)
    }

}

fileprivate struct NetworkTaskNotifierError: Error, Equatable {

}

fileprivate class NetworkTaskNotifierMock: NetworkTaskNotifier, NetworkManageableTask, QueueableCallbacks {

    var onCancel: (() -> Void)?

    var onFailure: ((Error) -> Void)?

    var onFinish: (() -> Void)?

    var onProgress: ((Progress) -> Void)?

    var onStart: (() -> Void)?

    var onSuspend: (() -> Void)?

    var onSuccess: ((Data, String?, Any?) -> Void)?

    var callbackQueue = DispatchQueue.global(qos: .default)

    func cancel() { }

    func resume() { }

    func success() { }

    func suspend() { }

}
