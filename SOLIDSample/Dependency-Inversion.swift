//
//  Dependency-Inversion.swift
//  SOLIDSample
//
//  Created by 홍성준 on 3/2/24.
//

import Foundation

final class Repository {
  func create(value: Int) { /* 생략 */ }
  func read(value: Int) -> Int {  1 }
  func update(value: Int) { /* 생략 */ }
  func delete(value: Int) { /* 생략 */ }
}

final class ViewModel {
  private let repository: Repository
  
  init(repository: Repository) {
    self.repository = repository
  }
}

/// ViewModel -> Repository (의존)



protocol MyRepository {
  func create(value: Int)
  func read(value: Int) -> Int
  func update(value: Int)
  func delete(value: Int)
}

final class SwiftDataRepository: MyRepository {
  func create(value: Int) { /* 생략 */ }
  func read(value: Int) -> Int {  1 }
  func update(value: Int) { /* 생략 */ }
  func delete(value: Int) { /* 생략 */ }
}

final class CoreDataRepository: MyRepository {
  func create(value: Int) { /* 생략 */ }
  func read(value: Int) -> Int {  1 }
  func update(value: Int) { /* 생략 */ }
  func delete(value: Int) { /* 생략 */ }
}

final class RealmDataRepository: MyRepository {
  func create(value: Int) { /* 생략 */ }
  func read(value: Int) -> Int {  1 }
  func update(value: Int) { /* 생략 */ }
  func delete(value: Int) { /* 생략 */ }
}

final class MemoryRepository: MyRepository {
  func create(value: Int) { /* 생략 */ }
  func read(value: Int) -> Int {  1 }
  func update(value: Int) { /* 생략 */ }
  func delete(value: Int) { /* 생략 */ }
}

final class MyViewModel {
  private let repository: MyRepository
  
  init(repository: MyRepository) {
    self.repository = repository
  }
}

/// MyViewModel -> MyRepository(인터페이스)
let repository = SwiftDataRepository()
let myViewModel = MyViewModel(repository: repository)
