//
//  CardImageIndicatorView.swift
//  TinderDemo
//
//  Created by JungWoo Choi on 18/3/2024.
//

import SwiftUI

struct CardImageIndicatorView: View {
  let currentImageIndex: Int
  let imageCount: Int
  
  var body: some View {
    HStack {
      ForEach(0..<imageCount, id: \.self) { index in
          Capsule()
          .foregroundStyle(currentImageIndex == index ? .white : .gray)
          .frame(width: imageIndicatorWidth, height: 4)
          .padding(.top, 8)
      }
    }
  }
}

extension CardImageIndicatorView {
  var imageIndicatorWidth: CGFloat {
    return SizeConstant.cardWidth / CGFloat(imageCount) - 28
  }
}

#Preview {
  CardImageIndicatorView(currentImageIndex: 1, imageCount: 3)
}
