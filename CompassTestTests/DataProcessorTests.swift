//
//  DataProcessorTests.swift
//  CompassTestTests
//
//  Created by Nicolas Bukstein on 16/5/24.
//

import XCTest
@testable import CompassTest

final class DataProcessorTests: XCTestCase {

    private let sut = DataProccesor()

    func testEvery10thCharacterRequestShouldReturnExpectedValue() throws {
        let testString = "123456789X123456789X"
        XCTAssertEqual(sut.every10thCharacterRequest(from: testString), "X X")
    }

    func testWordCounterRequest() throws {
        let testString = "<p> Compass Hello World </p>"
        XCTAssertEqual(
            sut.wordCounterRequest(from:  testString),
            "\"<p>\", \"Compass\", \"Hello\", \"World\", \"</p>\""
        )
    }

}
