//
//  CardView.swift
//  TinderDemo
//
//  Created by JungWoo Choi on 18/3/2024.
//

import SwiftUI

struct CardView: View {
  @State var viewModel = CardViewModel(service: CardService())
  
  var body: some View {
    if !viewModel.cardModels.isEmpty {
      CardStackView()
        .environment(viewModel)
    } else {
      AnnounceView(viewModel: viewModel)
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
}
