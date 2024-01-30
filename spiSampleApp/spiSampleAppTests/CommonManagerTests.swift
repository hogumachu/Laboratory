//
//  CommonManagerTests.swift
//  spiSampleAppTests
//
//  Created by 홍성준 on 1/30/24.
//

import LibraryA
import XCTest

final class CommonManagerTests: XCTestCase {
    
    private var sut: CommonManager!
    
    override func setUp() {
        super.setUp()
        sut = CommonManager.shared
    }
    
    func test_version() {
        XCTAssertEqual(sut.isValidVersion(version: "1.0.0"), true)
    }
    
    func test_authorization() {
        XCTAssertTrue(sut.requestAuthorization())
    }
    
}
