//
//  MatchManager.swift
//  TinderDemo
//
//  Created by JungWoo Choi on 21/3/2024.
//

import Foundation

@Observable class MatchManager {
  var matchedUser: User?
  
  func checkForMatch(withUser user: User) {
    let didMatch = Bool.random()
    
    if didMatch {
      matchedUser = user
    }
  }
}
