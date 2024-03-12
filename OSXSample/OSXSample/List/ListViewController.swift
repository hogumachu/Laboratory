//
//  ListViewController.swift
//  OSXSample
//
//  Created by 홍성준 on 3/12/24.
//

import Cocoa

final class ListViewController: NSViewController {
  
  private let titleLabel = NSTextField()
  private let tableView = NSTableView()
  private let createButton = NSButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupAttributes()
    setupLayout()
    setupNotification()
  }
  
  private func setupLayout() {
    view.addSubview(titleLabel)
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: view.topAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
    ])
    
    view.addSubview(createButton)
    NSLayoutConstraint.activate([
      createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      createButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
    ])
    
    view.addSubview(tableView)
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: createButton.topAnchor)
    ])
  }
  
  private func setupAttributes() {
    view.wantsLayer = true
    view.layer?.backgroundColor = NSColor.black.cgColor
    
    titleLabel.stringValue = "제목"
    titleLabel.isBezeled = false
    titleLabel.isEditable = false
    titleLabel.textColor = .white
    titleLabel.backgroundColor = .clear
    titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    
    tableView.register(as: ListCell.self)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    createButton.title = "추가"
    createButton.action = #selector(createButtonTapped)
    createButton.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private func setupNotification() {
    NotificationCenter.default.addObserver(forName: .init("Storage"), object: nil, queue: .main) { [weak self] _ in
      self?.tableView.reloadData()
    }
  }
  
  @objc private func createButtonTapped() {
    let viewController = CreateViewController()
    presentAsSheet(viewController)
  }
  
}

extension ListViewController: NSTableViewDelegate {
  
  func tableViewSelectionDidChange(_ notification: Notification) {
    let value = Storage.shared.fetchAll()[tableView.selectedRow]
    let viewController = DetailViewController()
    viewController.update(text: value)
    presentAsSheet(viewController)
  }
  
}

extension ListViewController: NSTableViewDataSource {
  
  func numberOfRows(in tableView: NSTableView) -> Int {
    return Storage.shared.fetchAll().count
  }
  
  func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
    let cell = tableView.dequeue(for: self, as: ListCell.self) ?? ListCell()
    cell.update(text: Storage.shared.fetchAll()[row])
    return cell
  }
  
}

