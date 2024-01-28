//
//  ViewController.swift
//  UITestSampleApp
//
//  Created by 홍성준 on 1/28/24.
//

import UIKit

final class ViewController: UIViewController {
    
    enum AccessibilityIdentifier {
        static let scoreLabel = "score_label"
        static let plusButton = "plus_button"
        static let minusButton = "minus_button"
    }
    
    private var score = 0
    
    private let scoreLabel = UILabel()
    private let plusButton = UIButton()
    private let minusButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttributes()
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(scoreLabel)
        view.addSubview(plusButton)
        view.addSubview(minusButton)
        
        NSLayoutConstraint.activate([
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scoreLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            plusButton.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 20),
            plusButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
            
            minusButton.topAnchor.constraint(equalTo: plusButton.topAnchor),
            minusButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10)
        ])
    }
    
    private func setupAttributes() {
        view.backgroundColor = .white
        
        scoreLabel.text = "\(score)"
        scoreLabel.accessibilityIdentifier = AccessibilityIdentifier.scoreLabel
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        plusButton.setTitle("더하기", for: .normal)
        plusButton.configuration = .filled()
        plusButton.accessibilityIdentifier = AccessibilityIdentifier.plusButton
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.addTarget(self, action: #selector(increase), for: .touchUpInside)
        
        minusButton.setTitle("빼기", for: .normal)
        minusButton.configuration = .bordered()
        minusButton.accessibilityIdentifier = AccessibilityIdentifier.minusButton
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.addTarget(self, action: #selector(decrease), for: .touchUpInside)
    }
    
    @objc private func increase() {
        score += 1
        scoreLabel.text = "\(score)"
    }
    
    @objc private func decrease() {
        score -= 1
        scoreLabel.text = "\(score)"
    }
    
}
