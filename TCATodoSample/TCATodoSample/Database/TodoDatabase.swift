//
//  TodoDatabase.swift
//  TCATodoSample
//
//  Created by 홍성준 on 3/12/24.
//

import Foundation
import SwiftData
import Dependencies

struct TodoDatabase {
  var fetchAll: @Sendable () throws -> [TodoModel]
  var fetch: @Sendable (FetchDescriptor<TodoModel>) throws -> [TodoModel]
  var add: @Sendable (TodoModel) throws -> Void
  var delete: @Sendable (TodoModel) throws -> Void
  
  enum TodoError: Error {
    case add
    case delete
  }
}

extension TodoDatabase: DependencyKey {
  static let liveValue = TodoDatabase(
    fetchAll: {
      do {
        @Dependency(\.database.contenxt) var context
        let todoContext = try context()
        let descriptor = FetchDescriptor<TodoModel>(sortBy: [SortDescriptor(\.createdAt)])
        return try todoContext.fetch(descriptor)
      } catch {
        return []
      }
    },
    fetch: { descriptor in
      do {
        @Dependency(\.database.contenxt) var context
        let todoContext = try context()
        return try todoContext.fetch(descriptor)
      } catch {
        return []
      }
    },
    add: { model in
      do {
        @Dependency(\.database.contenxt) var context
        let todoContext = try context()
        todoContext.insert(model)
      } catch {
        throw TodoError.add
      }
    },
    delete: { model in
      do {
        @Dependency(\.database.contenxt) var context
        let todoContext = try context()
        todoContext.delete(model)
      } catch {
        throw TodoError.delete
      }
    }
  )
}

extension DependencyValues {
  var todoDatabase: TodoDatabase {
    get { self[TodoDatabase.self] }
    set { self[TodoDatabase.self] = newValue }
  }
}

extension TodoDatabase: TestDependencyKey {
  static var previewValue = Self.noop
  
  static let testValue = Self(
    fetchAll: unimplemented("\(Self.self).fetch"),
    fetch: unimplemented("\(Self.self).fetchDescriptor"),
    add: unimplemented("\(Self.self).add"),
    delete: unimplemented("\(Self.self).delete")
  )
  
  static let noop = Self(
    fetchAll: { [] },
    fetch: { _ in [] },
    add: { _ in },
    delete: { _ in }
  )
}
