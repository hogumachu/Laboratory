//
//  Open-Closed.swift
//  SOLIDSample
//
//  Created by 홍성준 on 3/2/24.
//

import Foundation

enum Fruit {
  case apple
  case banana
}

final class FruitCalculator {
  
  func calculate(fruit: Fruit) -> Double {
    switch fruit {
    case .apple:
      return 1_000 * 1.1
    case .banana:
      return 2_000 * 1.1
    }
  }
  
}

final class FruitStorage {
  
  var storageA: [Fruit] = []
  var storageB: [Fruit] = []
  
  func store(fruit: Fruit) {
    switch fruit {
    case .apple:
      storageA.append(fruit)
    case .banana:
      storageB.append(fruit)
    }
  }
  
}

protocol Vegetable {
  var cost: Int { get }
  var storageType: Int { get }
}

final class VegetableCalculator {
  
  func calculate(vegetable: Vegetable) -> Double {
    return Double(vegetable.cost) * 1.2
  }
  
}

final class VegetableStorage {
  
  var storages: [Int: [Vegetable]] = [:]
  
  func store(vegetable: Vegetable) {
    if let storage = storages[vegetable.storageType] {
      storages[vegetable.storageType] = storage + [vegetable]
    } else {
      storages[vegetable.storageType] = [vegetable]
    }
  }
  
}
