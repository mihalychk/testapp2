//
//  TestApp2UITests.swift
//  TestApp2UITests
//
//  Created by Mikhail Kalinin on 10.10.19.
//  Copyright © 2019 Mikhail Kalinin. All rights reserved.
//

import XCTest

class TestApp2UITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExampleFlow() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let collectionView = app.collectionViews.element
        let cells = app.collectionViews.cells

        XCTAssertTrue(collectionView.waitForExistence(timeout: 4.0))
        XCTAssertTrue(cells.element.waitForExistence(timeout: 4.0))

        cells.firstMatch.tap()

        let scrollView = app.scrollViews.element
        let image = app.images.element

        XCTAssertTrue(scrollView.waitForExistence(timeout: 4.0))
        XCTAssertTrue(image.waitForExistence(timeout: 4.0))

        scrollView.pinch(withScale: 10.0, velocity: 10.0)
        scrollView.doubleTap()

        app.navigationBars.buttons.element(boundBy: 0).tap()

        XCTAssertTrue(collectionView.waitForExistence(timeout: 4.0))
    }

}
