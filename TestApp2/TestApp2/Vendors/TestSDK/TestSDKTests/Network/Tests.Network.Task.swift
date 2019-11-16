//
//  Tests.Network.Task.swift
//  TestSDKTests
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import XCTest
@testable import TestSDK

class NetworkTaskTests: XCTestCase {

    func testEquatable() {
        let dataTask1 = URLSessionDataTask()
        let dataTask2 = URLSessionDataTask()

        let networkTask1 = NetworkTask(with: dataTask1, callbackQueue: DispatchQueue.main)
        let networkTask2 = NetworkTask(with: dataTask2, callbackQueue: DispatchQueue.main)
        let networkTask3 = NetworkTask(with: dataTask1, callbackQueue: DispatchQueue.main)

        XCTAssertNotEqual(networkTask1, networkTask2)
        XCTAssertEqual(networkTask1, networkTask3)
    }

}
