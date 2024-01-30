//
//  SPIManagerTests.swift
//  spiSampleAppTests
//
//  Created by 홍성준 on 1/30/24.
//

@_spi(Testing) import LibraryA
import XCTest

final class SPIManagerTests: XCTestCase {
    
    func test_version() {
        let sut = SPIManager(version: "0.0.0")
        XCTAssertEqual(sut.isValidVersion(version: "0.0.0"), true)
    }
    
    func test_authorization_false() {
        let sut = SPIManager(isAuthorized: false)
        XCTAssertFalse(sut.requestAuthorization())
    }
    
    func test_singleton_version() {
        let sut = SPIManager.shared
        sut.version = "-1"
        XCTAssertEqual(sut.isValidVersion(version: "-1"), true)
    }
    
}
