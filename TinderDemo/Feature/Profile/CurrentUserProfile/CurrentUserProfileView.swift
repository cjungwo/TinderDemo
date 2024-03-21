//
//  CurrentUserProfileView.swift
//  TinderDemo
//
//  Created by JungWoo Choi on 21/3/2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
  @State private var showEditProfile = false
  
  let user: User
  
  var body: some View {
    NavigationStack {
      List {
        CurrentUserProfileHeaderView(user: user)
          .onTapGesture { showEditProfile.toggle() }
        
        // account info
        Section("Account Information") {
          HStack {
            Text("Name")
            
            Spacer()
            
            Text(user.fullName)
          }
          
          HStack {
            Text("Email")
            
            Spacer()
            
            Text("test123@gmail.com")
          }
        }
        
        // legal
        Section("Legal") {
          Text("Term of Service")
        }
        
        // logout / delete
        
        Section {
          Button("Logout") {
            print("DEBUG: Logout")
          }
          .foregroundStyle(.red)
        }
        
        Section {
          Button("Delete Account") {
            print("DEBUG: Delete account")
          }
          .foregroundStyle(.red)
        }
      }
      .navigationTitle("Profile")
      .navigationBarTitleDisplayMode(.inline)
      .fullScreenCover(isPresented: $showEditProfile) {
        EditProfileView(user: user)
      }
    }
  }
}

#Preview {
  CurrentUserProfileView(user: MockData.users[0])
}
