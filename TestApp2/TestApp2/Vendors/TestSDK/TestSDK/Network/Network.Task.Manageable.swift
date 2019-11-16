//
//  Network.Task.Manageable.swift
//  TestSDK
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import Foundation

protocol NetworkTaskManageable: TaskManageable {

    typealias Task = NetworkTask

    func createTask(with request: URLRequest) -> Task

    func get(taskBy subTask: URLSessionDataTask) -> Task?

}

extension NetworkTaskManageable {

    func append(task: Task) {
        tasks.append(task)
    }

    func get(taskBy subTask: URLSessionDataTask) -> Task? {
        let result = tasks.first { (task: Task) -> Bool in
            return subTask == task.subTask
        }

        return result
    }

    @discardableResult func remove(task: Task) -> Bool {
        if let index = tasks.firstIndex(of: task) {
            tasks.remove(at: index)

            return true
        }

        return false
    }

}

extension NetworkTaskManageable where Self: NetworkSessionHandler & QueueableCallbacks {

    func createTask(with request: URLRequest) -> Task {
        guard let session = session else {
            Logger.fatal("Session is not initialized, please startSession() before calling this method.")
        }

        let sessionTask = session.dataTask(with: request)
        let task = NetworkTask(with: sessionTask, callbackQueue: callbackQueue)

        append(task: task)

        return task
    }

}
