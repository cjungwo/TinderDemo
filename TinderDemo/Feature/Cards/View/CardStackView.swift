//
//  CardStackView.swift
//  TinderDemo
//
//  Created by JungWoo Choi on 18/3/2024.
//

import SwiftUI

struct CardStackView: View {
  @Environment(CardViewModel.self) var viewModel
  
  var body: some View {
    VStack(spacing: 16) {
      ZStack {
        ForEach(viewModel.cardModels) { card in
          CardCellView(model: card)
        }
      }
      
      if !viewModel.cardModels.isEmpty {
        SwipeActionButtonsView()
      }
    }
  }
}

#Preview {
    CardStackView()
    .environment(CardViewModel(service: CardService()))
    .environment(MatchManager())
}
