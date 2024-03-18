//
//  MockData.swift
//  TinderDemo
//
//  Created by JungWoo Choi on 18/3/2024.
//

import Foundation

struct MockData {
  static let users: [User] = [
    .init(
      id: NSUUID().uuidString,
      fullName: "Michele Jackson",
      age: 32, profileImageURLs: ["profile1", "profile2", "profile3"]
    ),
    .init(
      id: NSUUID().uuidString,
      fullName: "Megan Fox",
      age: 34, profileImageURLs: ["profile4", "profile5"]
    ),
    .init(
      id: NSUUID().uuidString,
      fullName: "Ovan Kelly",
      age: 29, profileImageURLs: ["profile6", "profile7", "profile8"]
    )
  ]
}
