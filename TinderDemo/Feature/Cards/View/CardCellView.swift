//
//  CardView.swift
//  TinderDemo
//
//  Created by JungWoo Choi on 18/3/2024.
//

import SwiftUI

struct CardCellView: View {
  @Environment(CardViewModel.self) var viewModel
  
  @State private var xOffset: CGFloat = 0
  @State private var degrees: Double = 0
  @State private var currentImageIndex = 0
  
  let model: CardModel
  
  var body: some View {
    ZStack(alignment: .bottom) {
      ZStack(alignment: .top) {
        Image(user.profileImageURLs[currentImageIndex])
          .resizable()
          .scaledToFill()
          .frame(
            width: SizeConstant.cardWidth,
            height: SizeConstant.cardHeight
          )
          .overlay {
            ImageScrollingOverlayView(
              currentImageIndex: $currentImageIndex,
              imageCount: imageCount
            )
          }
        
        CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: imageCount)
        
        SwipeActionIndicatorView(xOffset: $xOffset)
      }
      
      UserInfoView(user: user)
    }
    .onReceive(viewModel.buttonSwipeAction.publisher, perform: { action in
      onReceiveSwipeAction(action)
    })
    .frame(
      width: SizeConstant.cardWidth,
      height: SizeConstant.cardHeight
    )
    .clipShape(RoundedRectangle(cornerRadius: 10))
    .offset(x: xOffset)
    .rotationEffect(.degrees(degrees))
    .animation(.snappy, value: xOffset)
    .gesture(
      DragGesture()
        .onChanged(onDragChanged)
        .onEnded(onDragEnded)
    )
  }
}

private extension CardCellView {
  var user: User {
    return model.user
  }
  
  var imageCount: Int {
    return user.profileImageURLs.count
  }
  
  func returnToCenter() {
    xOffset = 0
    degrees = 0
  }
  
  func swipeRight() {
    withAnimation {
      xOffset = 500
      degrees = 12
    } completion: {
      viewModel.removeCard(model)
      viewModel.buttonSwipeAction = nil
    }
  }
  
  func swipeLeft() {
    withAnimation{
      xOffset = -500
      degrees = -12
    } completion: {
      viewModel.removeCard(model)
      viewModel.buttonSwipeAction = nil
    }
  }
  
  func onReceiveSwipeAction(_ action: SwipeAction?) {
    guard let action else { return }
    
    let topCard = viewModel.cardModels.last
    
    if topCard == model {
      switch action {
      case .reject:
        swipeLeft()
      case .like:
        swipeRight()
      }
    }
  }
}

private extension CardCellView {
  func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
    xOffset = value.translation.width
    degrees = Double(value.translation.width / 25)
  }
  func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
    let width = value.translation.width
    
    if abs(width) < abs(SizeConstant.screenCutoff) {
      returnToCenter()
      return
    }
    
    if width >= SizeConstant.screenCutoff {
      swipeRight()
    } else {
      swipeLeft()
    }
  }
}

#Preview {
  CardCellView(
    model: CardModel(user: MockData.users[0])
  )
  .environment(CardViewModel(service: CardService()))
}
