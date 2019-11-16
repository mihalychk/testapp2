//
//  String.Encryption.swift
//  TestSDK
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import Foundation

extension String {

    /// Detects encoding.
    func encoding() -> String.Encoding? {
        let cfEncoding = CFStringConvertIANACharSetNameToEncoding(self as CFString)
        let nsStringEncoding = CFStringConvertEncodingToNSStringEncoding(cfEncoding)
        let encoding = String.Encoding(rawValue: nsStringEncoding)

        return encoding
    }

}
