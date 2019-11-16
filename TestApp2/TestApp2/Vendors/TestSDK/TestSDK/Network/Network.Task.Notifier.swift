//
//  Network.Task.Notifier.swift
//  TestSDK
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import Foundation

protocol NetworkTaskNotifier: AnyObject {

    func failure(error: Error)

    func finish()

    func progress(completed: Int64, total: Int64)

    func success()

}

extension NetworkTaskNotifier where Self: NetworkManageableTask & QueueableCallbacks {

    func failure(error: Error) {
        callbackQueue.sync { [weak self] in
            self?.onFailure?(error)
        }
    }

    func finish() {
        callbackQueue.sync { [weak self] in
            self?.onFinish?()
        }
    }

    func progress(completed: Int64, total: Int64) {
        let progress = Progress(totalUnitCount: total)
        progress.completedUnitCount = completed

        callbackQueue.sync { [weak self] in
            self?.onProgress?(progress)
        }
    }

}

extension NetworkTaskNotifier where Self: NetworkManageableTask & QueueableCallbacks & NetworkSubtaskable & NetworkDownloadable {

    func success() {
        let data = downloadableData
        let mimeType = subTask.response?.mimeType?.lowercased() ?? ""

        var json: Any?
        var string: String?

        switch mimeType {
        case "application/json":
            let encoding = subTask.response?.textEncodingName?.encoding()
            string = data.string(with: encoding)
            json = data.json()
        default:
            break
        }

        callbackQueue.sync { [weak self] in
            self?.onSuccess?(data, string, json)
        }
    }

}
