//
//  TinderDemoApp.swift
//  TinderDemo
//
//  Created by JungWoo Choi on 18/3/2024.
//

import SwiftUI

@main
struct TinderDemoApp: App {
  @State var matchManager = MatchManager()
  
    var body: some Scene {
        WindowGroup {
            MainTabView()
            .environment(matchManager)
        }
    }
}
