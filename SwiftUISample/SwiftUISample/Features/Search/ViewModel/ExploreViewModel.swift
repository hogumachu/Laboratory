//
//  ExploreViewModel.swift
//  SwiftUISample
//
//  Created by 홍성준 on 2/2/24.
//

import Foundation

final class ExploreViewModel: ObservableObject {
  @Published var users: [User] = []
  
  init() {
    fetchUsers()
  }
  
  func fetchUsers() {
    users = [
      .init(
        id: UUID().uuidString,
        name: "John",
        description: "My name is John"
      ),
      .init(
        id: UUID().uuidString,
        name: "David",
        description: "My name is David"
      ),
      .init(
        id: UUID().uuidString,
        name: "Hoho",
        description: "My name is Hoho"
      ),
    ]
  }
  
}
