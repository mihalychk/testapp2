//
//  ImageResource.swift
//  TestApp2
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import TestSDK
import Foundation

struct ImageResource {

    let baseURLString: String

    var fullImageURL: URL { return url(with: "_27") }

    var previewImageURL: URL { return url(with: "_2") }

    init(with baseURL: String) {
        baseURLString = "https://" + baseURL
    }

    // MARK: - Private

    private func url(with suffix: String) -> URL {
        guard let url = URL(string: baseURLString + suffix + ".jpg") else {
            Logger.fatal("Wrong URL format.")
        }
        return url
    }

}

extension ImageResource: Equatable {

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.baseURLString == rhs.baseURLString
    }

}

extension ImageResource: Hashable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(baseURLString)
    }

}
