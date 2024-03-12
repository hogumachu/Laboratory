//
//  ListCell.swift
//  OSXSample
//
//  Created by 홍성준 on 3/12/24.
//

import Cocoa

final class ListCell: NSTableCellView {
  
  private let textLabel = NSTextField()
  
  override init(frame frameRect: NSRect) {
    super.init(frame: frameRect)
    setupAttributes()
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupAttributes()
    setupLayout()
  }
  
  func update(text: String) {
    textLabel.stringValue = text
  }
  
  private func setupLayout() {
    addSubview(textLabel)
    NSLayoutConstraint.activate([
      textLabel.topAnchor.constraint(equalTo: topAnchor),
      textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
      textLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  private func setupAttributes() {
    textLabel.textColor = .white
    textLabel.backgroundColor = .clear
    textLabel.isEditable = false
    textLabel.translatesAutoresizingMaskIntoConstraints = false
  }
  
}
