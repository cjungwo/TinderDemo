//
//  CardService.swift
//  TinderDemo
//
//  Created by JungWoo Choi on 18/3/2024.
//

import Foundation

struct CardService {
  func fetchCardModels() async throws -> [CardModel] {
    let users = MockData.users
    return users.map({ CardModel(user: $0) })
  }
}
