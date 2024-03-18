//
//  CardViewModel.swift
//  TinderDemo
//
//  Created by JungWoo Choi on 18/3/2024.
//

import Foundation

@Observable class CardViewModel {
  var cardModels = [CardModel]()
  
  private let service: CardService
  
  init(service: CardService) {
    self.service = service
    Task { await fetchCardModels() }
  }
  
  func fetchCardModels() async {
    do {
      self.cardModels = try await service.fetchCardModels()
    } catch {
      print("DEBUG: Failed to fetch cards with error: \(error)")
    }
  }
}

