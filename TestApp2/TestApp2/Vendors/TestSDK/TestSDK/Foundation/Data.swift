//
//  Data.swift
//  TestSDK
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import Foundation

extension Data {

    // MARK: - Internal

    /// Converts the data value to a JSON dictionary.
    func json() -> Any? {
        guard self.count > 0 else { return nil }

        do {
            return try JSONSerialization.jsonObject(with: self, options: [])
        } catch let error {
            Logger.verbose("Data json serialization error: \(error)")
        }

        return nil
    }

    /// Converts the data value to a string.
    /// - Parameter encoding: data encoding.
    func string(with encoding: String.Encoding? = nil) -> String? {
        let string = String(data: self, encoding: encoding ?? .utf8)

        return string
    }

}
