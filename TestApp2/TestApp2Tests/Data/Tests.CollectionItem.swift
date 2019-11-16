//
//  Tests.CollectionItem.swift
//  TestApp2Tests
//
//  Created by Mikhail Kalinin on 12.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import XCTest
@testable import TestApp2

class CollectionItemTests: XCTestCase {

    func testEquatable() {
        let urlString1 = UUID().uuidString + ".com/" + UUID().uuidString
        let urlString2 = UUID().uuidString + ".de/" + UUID().uuidString

        let resource1 = ImageResource(with: urlString1)
        let item1 = CollectionItem(with: resource1)
        let item2 = CollectionItem(with: resource1)

        XCTAssertEqual(item1, item2)

        let resource2 = ImageResource(with: urlString2)
        let item3 = CollectionItem(with: resource2)

        XCTAssertNotEqual(item1, item3)
    }

}
