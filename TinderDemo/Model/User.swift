//
//  User.swift
//  TinderDemo
//
//  Created by JungWoo Choi on 18/3/2024.
//

import Foundation

struct User: Identifiable, Hashable {
  let id: String
  let fullName: String
  var age: Int
  var profileImageURLs: [String]
}
