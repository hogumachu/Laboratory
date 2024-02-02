//
//  User.swift
//  SwiftUISample
//
//  Created by 홍성준 on 2/2/24.
//

import Foundation

struct User: Identifiable, Codable {
  let id: String
  let name: String
  let description: String
}
