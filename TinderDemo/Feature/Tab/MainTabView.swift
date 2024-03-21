//
//  MainTabBarView.swift
//  TinderDemo
//
//  Created by JungWoo Choi on 18/3/2024.
//

import SwiftUI

struct MainTabView: View {
  var body: some View {
    TabView {
      CardView()
        .tabItem {
          Image(systemName: "flame")
        }
        .tag(0)
      
      Text("Search View")
        .tabItem {
          Image(systemName: "magnifyingglass")
        }
        .tag(1)
      
      Text("Inbox View")
        .tabItem {
          Image(systemName: "bubble")
        }
        .tag(2)
      
      CurrentUserProfileView(user: MockData.users[0])
        .tabItem {
          Image(systemName: "person")
        }
        .tag(3)
    }
    .tint(.primary)
  }
}

#Preview {
  MainTabView()
    .environment(MatchManager())
}
