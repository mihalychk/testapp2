//
//  Tests.CGRect.swift
//  TestApp2Tests
//
//  Created by Mikhail Kalinin on 12.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import XCTest
@testable import TestApp2

class CGRectTests: XCTestCase {

    func testGetCenter() {
        let x = CGFloat.random(in: 0.0...10000.0)
        let y = CGFloat.random(in: 0.0...10000.0)
        let height = CGFloat.random(in: 0.0...10000.0)
        let width = CGFloat.random(in: 0.0...10000.0)

        let rect = CGRect(
            x: x,
            y: y,
            width: width,
            height: height
        )

        let center = rect.center

        XCTAssert(center.x == rect.midX)
        XCTAssert(center.y == rect.midY)
    }

    func testSetCenter() {
        let x = CGFloat.random(in: 0.0...10000.0)
        let y = CGFloat.random(in: 0.0...10000.0)
        let height = CGFloat.random(in: 0.0...10000.0)
        let width = CGFloat.random(in: 0.0...10000.0)

        var rect = CGRect(
            x: x,
            y: y,
            width: width,
            height: height
        )

        let newCenter = CGPoint(
            x: CGFloat.random(in: 0.0...10000.0),
            y: CGFloat.random(in: 0.0...10000.0)
        )
        rect.center = newCenter

        XCTAssert(rect.height == height, "Height has not to be changed")
        XCTAssert(rect.width == width, "Width has not to be changed")

        XCTAssert(rect.origin.x != x, "X has to be changed")
        XCTAssert(rect.origin.y != y, "Y has to be changed")

        let newX = newCenter.x - rect.width * 0.5
        let newY = newCenter.y - rect.height * 0.5

        XCTAssert(rect.origin.x == newX)
        XCTAssert(rect.origin.y == newY)
    }

}
