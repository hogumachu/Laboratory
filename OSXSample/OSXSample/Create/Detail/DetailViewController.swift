//
//  DetailViewController.swift
//  OSXSample
//
//  Created by 홍성준 on 3/12/24.
//

import Cocoa

final class DetailViewController: NSViewController {
  
  private let backButton = NSButton()
  private let titleLabel = NSTextField()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupAttributes()
    setupLayout()
  }
  
  func update(text: String) {
    titleLabel.stringValue = text
  }
  
  private func setupLayout() {
    view.addSubview(titleLabel)
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: view.topAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
    ])
    
    view.addSubview(backButton)
    NSLayoutConstraint.activate([
      backButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
      backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
    ])
  }
  
  private func setupAttributes() {
    view.wantsLayer = true
    view.layer?.backgroundColor = NSColor.white.cgColor
    
    backButton.title = "뒤로가기"
    backButton.action = #selector(backButtonTapped)
    backButton.translatesAutoresizingMaskIntoConstraints = false
    
    titleLabel.textColor = .black
    titleLabel.backgroundColor = .clear
    titleLabel.isEditable = false
    titleLabel.isBezeled = false
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
  }
  
  @objc private func backButtonTapped() {
    dismiss(self)
  }
  
}
