//
//  Tests.Data.swift
//  TestSDKTests
//
//  Created by Mikhail Kalinin on 11.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import XCTest
@testable import TestSDK

class DataTests: XCTestCase {

    func testJSON() {
        guard let data = Helper.data(from: "data", ofType: "json") else { XCTFail(); return }

        let json = data.json() as? [String: Any]
        XCTAssertNotNil(json, "Has to be not nil.")

        guard let label = json?["label"] as? String else { XCTFail(); return }
        XCTAssertEqual(label, "Category")

        guard let loanDuration = json?["loanDuration"] as? UInt else { XCTFail(); return }
        XCTAssertEqual(loanDuration, 60)

        guard let score = json?["score"] as? Double else { XCTFail(); return }
        XCTAssertEqual(score, 4.7)

        guard let slideShow = json?["slideShow"] as? Bool else { XCTFail(); return }
        XCTAssertEqual(slideShow, false)
    }

}
