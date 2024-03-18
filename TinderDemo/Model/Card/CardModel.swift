//
//  CardModel.swift
//  TinderDemo
//
//  Created by JungWoo Choi on 18/3/2024.
//

import Foundation

struct CardModel {
  let user: User
}

extension CardModel: Identifiable {
  var id: String { return user.id}
}
