//
//  UserCell.swift
//  SwiftUISample
//
//  Created by 홍성준 on 2/2/24.
//

import SwiftUI

struct UserCell: View {
  let user: User
  
  var body: some View {
    HStack(spacing: 12) {
      Image(systemName: "person.circle.fill")
        .resizable()
        .frame(width: 40, height: 40)
        .foregroundStyle(Color(.systemGray5))
      
      VStack(alignment: .leading) {
        Text(user.name)
          .font(.subheadline)
          .fontWeight(.semibold)
        
        Text(user.description)
          .font(.footnote)
      }
      
      Spacer()
    }
  }
}

#Preview {
  UserCell(user: .init(
    id: UUID().uuidString,
    name: "User Name",
    description: "Description"
  ))
}
