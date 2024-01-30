//
//  SPI_Tests.swift
//  spiSampleAppTests
//
//  Created by 홍성준 on 1/30/24.
//

@_spi(Testing) import LibraryA
import XCTest

final class SPI_Tests: XCTestCase {
    
    func test_version() {
        let sut = SomeClass()
        
        XCTAssertEqual(sut.version(), "1.0.0")
    }
    
    func test_identifier() {
        let sut = SomeClass()
        
        XCTAssertEqual(sut.identifier(), "SomeClass")
    }
    
    func test_configuration() {
        let sut = SomeClass()
        sut.configuration = .init(version: "0.0.0", identifier: "TestClass")
        
        XCTAssertEqual(sut.version(), "0.0.0")
        XCTAssertEqual(sut.identifier(), "TestClass")
    }
    
}
