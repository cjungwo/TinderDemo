//
//  MainTabBarView.swift
//  TinderDemo
//
//  Created by JungWoo Choi on 18/3/2024.
//

import SwiftUI

struct MainTabView: View {
  var body: some View {
    VStack(alignment: .leading) {
      
      HStack {
        Image(systemName: "flame")
          .resizable()
          .frame(width: 24, height: 24)
          .foregroundStyle(.red)
        
        Text("Tinder")
          .font(.system(size: 18))
          .fontWeight(.bold)
      }
      .padding(.horizontal, 20)
      .padding(.top, 20)
      
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
        
        Text("Profile View")
          .tabItem {
            Image(systemName: "person")
          }
          .tag(3)
      }
      .tint(.primary)
    }
  }
}

#Preview {
  MainTabView()
}
