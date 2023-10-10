//
//  ProfileView.swift
//  GitHubAPI
//
//  Created by Alejandra San Martin on 10/10/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var profileViewModel = ProfileViewModel()
    
    var body: some View {
        VStack (spacing: 20){
            
            AsyncImage(url: URL(string: profileViewModel.user?.avatarUrl ?? "")){
                image in
                image
                    .resizable()
                    .frame(width: 180, height: 180, alignment: .topLeading)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: 180,height: 180)
            }
            
            Text(profileViewModel.user?.login ?? "Username")
                .bold()
                .font(.title)
            HStack(spacing: 80){
                VStack{
                    Text("Followers")
                    Text("\(profileViewModel.user?.followers ?? 0)")
                }
                VStack{
                    Text("Following")
                    Text("\(profileViewModel.user?.following ?? 0)")
                }
            }
            VStack(alignment: .leading){
                Text("Biography")
                    .font(.title3)
                    .bold()
                    .padding(.bottom,5)
                Text(profileViewModel.user?.bio ?? "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.")
            }.padding(20)
        }
        .padding(10)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
