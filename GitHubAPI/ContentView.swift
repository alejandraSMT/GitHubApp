//
//  ContentView.swift
//  GitHubAPI
//
//  Created by Alejandra San Martin on 9/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var user: GitHubUser?
    
    var body: some View {
        TabView{
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.fill")
                }
            FollowersView()
                .tabItem{
                    Label("Followers",systemImage: "person.3.fill")
                }
        }.tint(.indigo)
    }

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
