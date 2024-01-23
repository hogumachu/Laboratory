//
//  CacheSampleTests.swift
//  CacheSampleTests
//
//  Created by 홍성준 on 1/23/24.
//

@testable import CacheSample
import XCTest

final class CacheSampleTests: XCTestCase {
    
    func test_반드시_성공_1()  {
        let result = SomeBuilder().buildTrue()
        XCTAssertEqual(true, result)
    }
    
    func test_반드시_성공_2()  {
        let result = SomeBuilder().buildFalse()
        XCTAssertEqual(false, result)
    }
    
}
