//
//  Tests.ImageResource.swift
//  TestApp2Tests
//
//  Created by Mikhail Kalinin on 12.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import XCTest
@testable import TestApp2

class ImageResourceTests: XCTestCase {

    var resource: ImageResource?

    var urlString: String?

    override func setUp() {
        urlString = UUID().uuidString + ".com/" + UUID().uuidString
        resource = ImageResource(with: urlString!)
    }

    func testBaseURL() {
        XCTAssertEqual(resource!.baseURLString, "https://" + urlString!)
    }

    func testFullImageURL() {
        XCTAssertEqual(resource!.fullImageURL.absoluteString, "https://" + urlString! + "_27.jpg")
    }

    func testPreviewImageURL() {
        XCTAssertEqual(resource!.previewImageURL.absoluteString, "https://" + urlString! + "_2.jpg")
    }

    func testEquatable() {
        let anotherResource1 = ImageResource(with: urlString!)

        XCTAssertEqual(resource!, anotherResource1)

        let urlString2 = UUID().uuidString + ".net/" + UUID().uuidString
        let anotherResource2 = ImageResource(with: urlString2)

        XCTAssertNotEqual(resource!, anotherResource2)
    }

}
