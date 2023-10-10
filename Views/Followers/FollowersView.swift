//
//  FollowersView.swift
//  GitHubAPI
//
//  Created by Alejandra San Martin on 10/10/23.
//

import SwiftUI

struct FollowersView: View {
    @StateObject var followersViewModel = FollowersViewModel()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(followersViewModel.followers, id: \.login){ follower in
                    HStack{
                        AsyncImage(url: URL(string: follower.avatarUrl ?? "")){
                            image in
                            image
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .topLeading)
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                        } placeholder: {
                            Circle()
                                .foregroundColor(.gray)
                                .frame(width: 30,height: 30)
                        }
                        Text(follower.login ?? "XD")
                    }.padding(3)
                }
            }
            .navigationTitle("Followers")
        }
        
    }
}

struct FollowersView_Previews: PreviewProvider {
    static var previews: some View {
        FollowersView()
    }
}
