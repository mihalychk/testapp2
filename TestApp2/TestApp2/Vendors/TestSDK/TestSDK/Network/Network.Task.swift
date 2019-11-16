//
//  NetworkTask.swift
//  TestSDK
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import Foundation

public class NetworkTask: NetworkDownloadable, NetworkManageableTask, NetworkTaskNotifier, NetworkSubtaskable, QueueableCallbacks {

    // MARK: - NetworkManageableTask

    public var onCancel: (() -> Void)?

    public var onFailure: ((Error) -> Void)?

    public var onFinish: (() -> Void)?

    public var onProgress: ((Progress) -> Void)?

    public var onStart: (() -> Void)?

    public var onSuspend: (() -> Void)?

    public var onSuccess: ((Data, String?, Any?) -> Void)?

    // MARK: - NetworkDownloadable

    public internal(set) var downloadableData: Data = Data()

    // MARK: - NetworkSubtaskable

    public private(set) var subTask: URLSessionDataTask

    // MARK: - QueueableCallbacks

    private(set) var callbackQueue: DispatchQueue

    // MARK: - Init & Deinit

    init(with task: URLSessionDataTask, callbackQueue: DispatchQueue) {
        self.callbackQueue = callbackQueue
        self.subTask = task
    }

}

extension NetworkTask: ManageableTask {

    public func cancel() {
        callbackQueue.async { [weak self] in
            self?.onCancel?()
        }
        subTask.cancel()
    }

    public func resume() {
        // HACK: make progress before connection
        let progress = Progress(totalUnitCount: 1)
        progress.completedUnitCount = 0

        callbackQueue.async { [weak self] in
            self?.onProgress?(progress)
            self?.onStart?()
        }
        subTask.resume()
    }

    public func suspend() {
        callbackQueue.async { [weak self] in
            self?.onSuspend?()
        }
        subTask.suspend()
    }

}

extension NetworkTask: Equatable {

    public static func == (lhs: NetworkTask, rhs: NetworkTask) -> Bool {
        lhs.subTask == rhs.subTask
    }

}

extension NetworkTask: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(subTask)
    }

}
