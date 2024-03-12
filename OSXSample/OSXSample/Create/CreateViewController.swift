//
//  CreateViewController.swift
//  OSXSample
//
//  Created by 홍성준 on 3/12/24.
//

import AppKit

final class CreateViewController: NSViewController {
  
  private let titleField = NSTextField()
  private let cancelButton = NSButton()
  private let saveButton = NSButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupAttributes()
    setupLayout()
  }
  
  private func setupLayout() {
    view.addSubview(titleField)
    NSLayoutConstraint.activate([
      titleField.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
      titleField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      titleField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
    ])
    
    view.addSubview(saveButton)
    NSLayoutConstraint.activate([
      saveButton.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 20),
      saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
    ])
    
    view.addSubview(cancelButton)
    NSLayoutConstraint.activate([
      cancelButton.topAnchor.constraint(equalTo: saveButton.topAnchor),
      cancelButton.trailingAnchor.constraint(equalTo: saveButton.leadingAnchor, constant: -10)
    ])
  }
  
  private func setupAttributes() {
    titleField.placeholderString = "내용을 입력하세요"
    titleField.translatesAutoresizingMaskIntoConstraints = false
    
    cancelButton.title = "취소"
    cancelButton.action = #selector(cancelButtonTapped)
    cancelButton.translatesAutoresizingMaskIntoConstraints = false
    
    saveButton.title = "저장"
    saveButton.action = #selector(saveButtonTapped)
    saveButton.translatesAutoresizingMaskIntoConstraints = false
  }
  
  @objc private func cancelButtonTapped() {
    dismiss(self)
  }
  
  @objc private func saveButtonTapped() {
    Storage.shared.save(value: titleField.stringValue)
    dismiss(self)
  }
  
}
