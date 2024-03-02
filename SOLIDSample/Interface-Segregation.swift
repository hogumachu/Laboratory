//
//  Interface-Segregation.swift
//  SOLIDSample
//
//  Created by 홍성준 on 3/2/24.
//

import Foundation

protocol HomeUseCase {
  func requestValues() -> [String]
  func addSomething(value: String)
  func removeSomething(value: String)
}

final class HomeDetailViewModel {
  
  private let useCase: HomeUseCase
  
  init(useCase: HomeUseCase) {
    self.useCase = useCase
  }
  
  // 모두 접근 가능
  func doSomething() {
    useCase.requestValues()
    useCase.addSomething(value: "A")
    useCase.removeSomething(value: "A")
  }
  
}


typealias MyUseCase = MyProfileUseCase & FriendUseCase

protocol MyProfileUseCase {
  func requestName() -> String
  func requestAge() -> Int
}

protocol FriendUseCase {
  func requestFriends() -> [String]
}

final class MyUseCaseImp: MyUseCase {
  
  func requestName() -> String {
    return "A"
  }
  
  func requestAge() -> Int {
    return 1
  }
  
  func requestFriends() -> [String] {
    return ["B", "C"]
  }
  
  
}

final class MyProfileViewModel {
  
  private let useCase: MyProfileUseCase
  
  init(useCase: MyProfileUseCase) {
    self.useCase = useCase
  }
  
  func doSomething() {
    useCase.requestName()
    useCase.requestAge()
  }
  
}

final class MyFriendViewModel {
  
  private let useCase: FriendUseCase
  
  init(useCase: FriendUseCase) {
    self.useCase = useCase
  }
  
  func doSomething() {
    useCase.requestFriends()
  }
  
}

let useCase = MyUseCaseImp()
let profileViewModel = MyProfileViewModel(useCase: useCase)
let friendViewModel = MyFriendViewModel(useCase: useCase)

