//
//  NumberFactClient.swift
//  TCATutorial
//
//  Created by 홍성준 on 2/2/24.
//

import ComposableArchitecture
import Foundation

struct NumberFactClient {
  var fetch: (Int) async throws -> String
}

extension NumberFactClient: DependencyKey {
  static let liveValue = NumberFactClient(
    fetch: { number in
      let (data, _) = try await URLSession.shared
        .data(from: URL(string: "http://numbersapi.com/\(number)")!)
      let fact = String(decoding: data, as: UTF8.self)
      return fact
    }
  )
}

extension DependencyValues {
  var numberFact: NumberFactClient {
    get { self[NumberFactClient.self] }
    set { self[NumberFactClient.self] = newValue }
  }
}
