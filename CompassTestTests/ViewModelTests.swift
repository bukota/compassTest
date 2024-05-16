//
//  ViewModelTests.swift
//  CompassTestTests
//
//  Created by Nicolas Bukstein on 16/5/24.
//

import XCTest
@testable import CompassTest

final class ViewModelTests: XCTestCase {

    private let sut = ViewModel()

    func testInitValues() throws {
        XCTAssertFalse(sut.hasData)
        XCTAssertFalse(sut.isLoading)
    }

    func testFetchContentThenShouldSetIsLoadingAndThenReturnSomeData() async throws {
        let task = Task { await sut.fetchContent() }
        await Task.yield()
        XCTAssertTrue(sut.isLoading)
        await task.value
        XCTAssertTrue(sut.hasData)
    }

    

}
