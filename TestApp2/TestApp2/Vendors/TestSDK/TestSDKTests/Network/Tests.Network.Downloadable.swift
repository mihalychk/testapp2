//
//  Tests.Network.Downloadable.swift
//  TestSDKTests
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import XCTest
@testable import TestSDK

class NetworkDownloadableTests: XCTestCase {

    func testAppend() {
        let networkDownloadable = NetworkDownloadableMock()

        XCTAssert(networkDownloadable.downloadableData.count == 0)

        let amount = Int.random(in: 20...1000)
        let data = Data(repeating: 0, count: amount)

        networkDownloadable.append(downloadableData: data)
        XCTAssert(networkDownloadable.downloadableData.count == amount)
    }

}

fileprivate class NetworkDownloadableMock: NetworkDownloadable {

    var downloadableData = Data()

}
