//
//  Storage.swift
//  OSXSample
//
//  Created by 홍성준 on 3/12/24.
//

import Foundation

final class Storage {
  
  static let shared = Storage()
  
  private init() {}
  
  private var values: [String] = [
    "ABCDEFG",
    "1234567",
    "ㄱㄴㄷㄹㅁ"
  ]
  
  func fetchAll() -> [String] {
    return values
  }
  
  func save(value: String) {
    values.append(value)
    notifyUpdate()
  }
  
  func remove(value: String) {
    values.removeAll(where: { $0 == value })
    notifyUpdate()
  }
  
  private func notifyUpdate() {
    NotificationCenter.default.post(name: .init("Storage"), object: nil)
  }
  
}
