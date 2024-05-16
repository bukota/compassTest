//
//  CompassTestUITests.swift
//  CompassTestUITests
//
//  Created by Nicolas Bukstein on 16/5/24.
//

import XCTest

final class CompassTestUITests: XCTestCase {

    func testTapFetchShouldShowwProgressView() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["FetchButton"].tap()
        XCTAssertTrue(app.activityIndicators["ProgressView"].exists)
    }

}
