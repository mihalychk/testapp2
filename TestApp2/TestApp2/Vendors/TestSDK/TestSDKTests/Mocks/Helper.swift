//
//  Helper.swift
//  TestSDKTests
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import Foundation

class Helper {

    static func url(from resource: String, ofType type: String?) -> URL? {
        let bundle = Bundle(for: Helper.self)

        guard let filePath = bundle.path(forResource: resource, ofType: type) else { return nil }

        return URL(string: "file://\(filePath)")
    }

    static func data(from resource: String, ofType type: String?) -> Data? {
        guard let fileURL = url(from: resource, ofType: type) else { return nil }

        return try? Data(contentsOf: fileURL)
    }

}
