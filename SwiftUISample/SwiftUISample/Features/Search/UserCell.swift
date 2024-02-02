//
//  UserCell.swift
//  SwiftUISample
//
//  Created by 홍성준 on 2/2/24.
//

import SwiftUI

struct UserCell: View {
  var body: some View {
    HStack(spacing: 12) {
      Image(systemName: "person.circle.fill")
        .resizable()
        .frame(width: 40, height: 40)
        .foregroundStyle(Color(.systemGray5))
      
      VStack(alignment: .leading) {
        Text("User Name")
          .font(.subheadline)
          .fontWeight(.semibold)
        
        Text("Description")
          .font(.footnote)
      }
      
      Spacer()
    }
  }
}

#Preview {
  UserCell()
}
