//
//  main.swift
//  AssociatedObjectSample
//
//  Created by 홍성준 on 2/23/24.
//

import Foundation

final class SomeManager {
  
  init() {
    print("Init")
  }
  
}

final class SomeClass {}

extension SomeClass {
  
  private static var key = 12_345_678
  
  var manager: SomeManager {
    if let manager = objc_getAssociatedObject(self, &SomeClass.key) as? SomeManager {
      print("Case 1")
      return manager
    } else {
      print("Case 2")
      let manager = SomeManager()
      objc_setAssociatedObject(self, &SomeClass.key, manager, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      return manager
    }
  }
  
  // computed property만 가능
//  lazy var someManager = SomeManager()
//  let someManager = SomeManager()
  
}

let someClass = SomeClass()
print(someClass.manager) // Case 2
print(someClass.manager) // Case 1
print()

let someClass2 = SomeClass()
print(someClass2.manager) // Case 2
print(someClass2.manager) // Case 1
