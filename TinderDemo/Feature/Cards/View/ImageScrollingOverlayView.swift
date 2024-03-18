//
//  ImageScrollingOverlayView.swift
//  TinderDemo
//
//  Created by JungWoo Choi on 18/3/2024.
//

import SwiftUI

struct ImageScrollingOverlayView: View {
  @Binding var currentImageIndex: Int
  
  let imageCount: Int
  
  var body: some View {
    HStack {
      Rectangle()
        .onTapGesture {
          updateIamgeIndex(increment: false)
        }
      
      Rectangle()
        .onTapGesture {
          updateIamgeIndex(increment: true)
        }
    }
    .foregroundStyle(.white.opacity(0.01))
  }
}

private extension ImageScrollingOverlayView {
  func updateIamgeIndex(increment: Bool) {
    if increment {
      guard currentImageIndex < imageCount - 1 else { return }
      currentImageIndex += 1
    } else {
      guard currentImageIndex > 0 else { return }
      currentImageIndex -= 1
    }
  }
}

#Preview {
  ImageScrollingOverlayView(currentImageIndex: .constant(0), imageCount: 2)
}
