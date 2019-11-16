//
//  Network.Manager.Session.Delegate.swift
//  TestSDK
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import Foundation

class NetworkManagerSessionDelegate: NSObject {

    weak var manager: NetworkManager?

}

extension NetworkManagerSessionDelegate: URLSessionDelegate {

    @objc(URLSession:dataTask:didReceiveResponse:completionHandler:) func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        guard let networkTask = manager?.get(taskBy: dataTask) else { return }

        networkTask.progress(completed: 1, total: response.expectedContentLength)
        completionHandler(.allow)
    }

    @objc(URLSession:taskIsWaitingForConnectivity:) func urlSession(_ session: URLSession, taskIsWaitingForConnectivity task: URLSessionTask) {
        Logger.warning("Network.Manager.Session.Delegate: taskIsWaitingForConnectivity")
    }

    @objc(URLSession:dataTask:didReceiveData:) func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        guard let networkTask = manager?.get(taskBy: dataTask) else { return }

        let total = networkTask.subTask.response?.expectedContentLength ?? 0
        networkTask.progress(completed: Int64(networkTask.downloadableData.count), total: total)
        networkTask.append(downloadableData: data)
    }

    @objc(URLSession:task:didCompleteWithError:) func urlSession(_ session: URLSession, task: URLSessionDataTask, didCompleteWithError error: Swift.Error?) {
        guard let networkTask = manager?.get(taskBy: task) else { return }

        let total = networkTask.subTask.response?.expectedContentLength ?? 0
        networkTask.progress(completed: total, total: total)

        if error != nil {
            networkTask.failure(error: error!)
        } else {
            guard let statusCode = (networkTask.subTask.response as? HTTPURLResponse)?.statusCode else {
                Logger.fatal("No error and no statusCode, weird, just in case crashing.")
            }
            if statusCode >= 200 && statusCode < 400 {
                networkTask.success()
            } else {
                let error = NSError(domain: NSURLErrorDomain, code: statusCode, userInfo: nil)
                networkTask.failure(error: error)
            }
        }

        networkTask.finish()
        manager?.remove(task: networkTask)
    }

}
