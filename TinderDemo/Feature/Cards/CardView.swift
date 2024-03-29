//
//  CardView.swift
//  TinderDemo
//
//  Created by JungWoo Choi on 18/3/2024.
//

import SwiftUI

struct CardView: View {
  @Environment(MatchManager.self) var matchManager
  
  @State var viewModel = CardViewModel(service: CardService())
  
  @State private var showMatchView = false
  
  var body: some View {
    NavigationStack {
      ZStack {
        VStack {
          if !viewModel.cardModels.isEmpty {
            CardStackView()
              .environment(viewModel)
              .environment(matchManager)
          } else {
            AnnounceView(viewModel: viewModel)
          }
        }
        .blur(radius: showMatchView ? 20 : 0)
        
        if showMatchView {
          UserMatchView(show: $showMatchView)
        }
      }
      .onReceive(matchManager.matchedUser.publisher, perform: { user in
        showMatchView = user != nil
        print("DEBUG: CV \(showMatchView)")
      })
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          HStack {
            Image(systemName: "flame")
              .resizable()
              .frame(width: 20, height: 24)
              .foregroundStyle(.red)
            
            Text("Tinder")
              .font(.system(size: 28))
              .foregroundStyle(.primary)
              .fontWeight(.medium)
          }
        }
      }
    }
  }
}

// MARK: - AnnounceView
private struct AnnounceView: View {
  var viewModel: CardViewModel
  
  fileprivate var body: some View {
    VStack(spacing: 20) {
      ZStack {
        Circle()
          .fill(.purple.opacity(0.1))
          .frame(width: 240, height: 240)
        
        Circle()
          .fill(.purple.opacity(0.2))
          .frame(width: 180, height: 180)
        
        Image("profile1")
          .resizable()
          .clipShape(Circle())
          .frame(width: 120, height: 120)
      }
      
      Text("It looks lie you've seen everone. \nClick below to see people you swiped in on again.")
        .multilineTextAlignment(.center)
        .foregroundStyle(.gray)
      
      
      Button {
        viewModel.cardModels.append(CardModel(user: MockData.users[0]))
        viewModel.cardModels.append(CardModel(user: MockData.users[1]))
        viewModel.cardModels.append(CardModel(user: MockData.users[2]))
      } label: {
        Text("Start Over")
          .font(.system(size: 16, weight: .medium))
          .foregroundStyle(.white)
          .frame(width: UIScreen.main.bounds.width - 40, height: 50)
          .background(.red)
          .clipShape(.capsule)
      }
      
      Spacer()
    }
    .padding(.top, 50)
    .padding(.horizontal, 20)
  }
}

#Preview {
  CardView()
    .environment(MatchManager())
}
