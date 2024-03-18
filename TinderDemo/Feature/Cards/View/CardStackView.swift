//
//  CardStackView.swift
//  TinderDemo
//
//  Created by JungWoo Choi on 18/3/2024.
//

import SwiftUI

struct CardStackView: View {
  @State var viewModel = CardViewModel(service: CardService())
  
  var body: some View {
    ZStack {
      ForEach(viewModel.cardModels) { card in
        CardView(viewModel: viewModel, model: card)
      }
    }
  }
}

#Preview {
    CardStackView()
}
