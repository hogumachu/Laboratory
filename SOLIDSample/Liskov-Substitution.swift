//
//  Liskov-Substitution.swift
//  SOLIDSample
//
//  Created by 홍성준 on 3/2/24.
//

import Foundation

protocol Animal {
  var age: Int { get }
  var isMale: Bool { get }
}

class Hospital {
  
  func doSomething(animal: Animal) {
    if animal.age > 10 {
      print("old")
    } else {
      print("young")
    }
  }
  
}

class MyHospital: Hospital {
  
  override func doSomething(animal: Animal) {
    // 사전 조건 강화
    if animal.isMale {
      return
    }
    super.doSomething(animal: animal)
  }
  
}


