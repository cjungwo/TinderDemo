//
//  UserInfoView.swift
//  TinderDemo
//
//  Created by JungWoo Choi on 18/3/2024.
//

import SwiftUI

struct UserInfoView: View {
  let user: User
  
    var body: some View {
      VStack(alignment: .leading) {
        HStack {
          Text(user.fullName)
            .font(.title)
            .fontWeight(.heavy)
          
          Text("\(user.age)")
            .font(.title)
            .fontWeight(.semibold)
          
          Spacer()
          
          Button {
            print("DEBUG: dd")
          } label: {
            Image(systemName: "arrow.up.circle")
              .fontWeight(.bold)
              .imageScale(.large)
          }

        }
        
        Text("Actress | Witch")
          .font(.subheadline)
          .lineLimit(2)
      }
      .foregroundStyle(.white)
      .padding()
      .background(
        LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
      )
    }
}

#Preview {
  UserInfoView(user: MockData.users[0])
}
