//
//  UserStatView.swift
//  SwiftUISample
//
//  Created by 홍성준 on 2/2/24.
//

import SwiftUI

struct UserStatView: View {
  let value: Int
  let title: String
  var body: some View {
    VStack {
      Text("\(value)")
        .font(.subheadline)
        .fontWeight(.bold)
      
      Text(title)
        .font(.caption)
        .foregroundStyle(.gray)
    }
    .frame(width: 80, alignment: .center)
  }
}

#Preview {
    UserStatView(value: 1, title: "Hello")
}
