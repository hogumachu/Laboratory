//
//  ViewControllerTests.swift
//  UITestSampleAppTests
//
//  Created by 홍성준 on 1/28/24.
//

@testable import UITestSampleApp
import XCTest
import UIKit

final class ViewControllerTests: XCTestCase {
    
    private typealias Identifier = ViewController.AccessibilityIdentifier
    
    private var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        sut = .init()
        sut.viewDidLoad()
    }
    
    func test_초기_score_label의_값은_0이다() throws {
        // given
        let label = try sut.search(type: UILabel.self, accessibilityIdentifier: Identifier.scoreLabel)
        
        // then
        XCTAssertEqual(label.text, "0")
    }
    
    func test_plus_button을_누르면_값이_1_증가한다() throws {
        // given
        let sut = ViewController()
        let button = try sut.search(type: UIButton.self, accessibilityIdentifier: "plus_button")
        let label = try sut.search(type: UILabel.self, accessibilityIdentifier: "score_label")
        
        // when
        button.sendActions(for: .touchUpInside)
        
        // then
        XCTAssertEqual(label.text, "1")
    }
    
    func test_minus_button을_누르면_값이_1_감소한다() throws {
        // given
        let button = try sut.search(type: UIButton.self, accessibilityIdentifier: Identifier.minusButton)
        let label = try sut.search(type: UILabel.self, accessibilityIdentifier: Identifier.scoreLabel)
        
        // when
        button.sendActions(for: .touchUpInside)
        
        // then
        XCTAssertEqual(label.text, "-1")
    }
    
}
