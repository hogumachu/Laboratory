//
//  Single-Responsibility.swift
//  SOLIDSample
//
//  Created by 홍성준 on 3/2/24.
//

import Foundation

final class MVC {
  
  final class ViewController {
    func uiLogic() { /* 생략 */ }
    func businessLogic() { /* 생략 */ }
    func routing() { /* 생략 */ }
  }
  
}

final class MVVM {
  
  final class ViewController {
    func uiLogic() { /* 생략 */ }
    func routing() { /* 생략 */ }
  }
  
  final class ViewModel {
    func businessLogic() { /* 생략 */ }
  }
  
}

final class MVVM_C {
  
  final class ViewController {
    func uiLogic() { /* 생략 */ }
  }
  
  final class ViewModel {
    func businessLogic() { /* 생략 */ }
  }
  
  final class Coordinator {
    func routing() { /* 생략 */ }
  }
  
}

final class RIBs {
  
  final class Router {
    func routing() { /* 생략 */ }
  }
  
  final class Interactor {
    func businessLogic() { /* 생략 */ }
  }
  
  final class Builder {
    func build() { /* 생략 */ }
  }
  
  final class ViewController {
    func uiLogic() { /* 생략 */ }
  }
  
}
