//
//  UserMatchView.swift
//  TinderDemo
//
//  Created by JungWoo Choi on 21/3/2024.
//

import SwiftUI

struct UserMatchView: View {
  @Binding var show: Bool
  @Environment(MatchManager.self) var matchManager
  
  var body: some View {
    ZStack {
      Rectangle()
        .fill(.black.opacity(0.7))
        .ignoresSafeArea()
      
      VStack(spacing: 120) {
        VStack {
          Text("It's a Match!")
            .font(.system(size: 64))
          
          if let matchedUser = matchManager.matchedUser {
            Text("You and \(matchedUser.fullName) have liked each other.")
          }
        }
        .foregroundStyle(.white)
        
        HStack(spacing: 16) {
          Image(MockData.users[0].profileImageURLs[0])
            .resizable()
            .scaledToFill()
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .overlay {
              Circle()
                .stroke(.white, lineWidth: 2)
                .shadow(radius: 4)
            }
          
          if let matchedUser = matchManager.matchedUser {
            Image(matchedUser.profileImageURLs[0])
              .resizable()
              .scaledToFill()
              .frame(width: 150, height: 150)
              .clipShape(Circle())
              .overlay {
                Circle()
                  .stroke(.white, lineWidth: 2)
                  .shadow(radius: 4)
              }
          }
        }
        
        VStack(spacing: 16) {
          Button("Send Message") {
            matchManager.matchedUser = nil
            show.toggle()
          }
          .font(.subheadline)
          .fontWeight(.semibold)
          .foregroundStyle(.white)
          .frame(width: 350, height: 44)
          .background(.pink)
          .clipShape(.capsule)
          
          Button("Keep Swiping") {
            matchManager.matchedUser = nil
            show.toggle()
          }
          .font(.subheadline)
          .fontWeight(.semibold)
          .foregroundStyle(.white)
          .frame(width: 350, height: 44)
          .background(.clear)
          .clipShape(.capsule)
          .overlay {
            Capsule()
              .stroke(.white, lineWidth: 2)
              .shadow(radius: 4)
          }
        }
      }
    }
  }
}

#Preview {
  UserMatchView(show: .constant(true))
    .environment(MatchManager())
}
