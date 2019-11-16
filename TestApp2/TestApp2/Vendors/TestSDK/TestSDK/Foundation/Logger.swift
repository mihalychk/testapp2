//
//  Logger.swift
//  TestSDK
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import Foundation

public final class Logger {

    public static func verbose(_ message: String) {
        log(level: "[VERBOSE]", message: message)
    }

    public static func info(_ message: String) {
        log(level: "[INFO]", message: message)
    }

    public static func warning(_ message: String) {
        log(level: "[WARNING]", message: message)
    }

    public static func fatal(_ message: String) -> Never {
        let string = "[FATAL] \(message)"
        print(string)
        fatalError(string)
    }

    public static func debug(_ message: String) {
        log(level: "[DEBUG]", message: message)
    }

    private static func log(level: String, message: String) {
        let string = "\(level) \(message)"
        print(string)
    }

    @available(*, unavailable) init() {
        Logger.fatal("init() is not allowed")
    }

}
