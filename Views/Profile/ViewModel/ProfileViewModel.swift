//
//  ProfileViewModel.swift
//  GitHubAPI
//
//  Created by Alejandra San Martin on 10/10/23.
//

import Foundation

@MainActor
class ProfileViewModel: ObservableObject {
    
    @Published var user: GitHubUser?
    
    init(){
        loadUser()
    }
    
    func loadUser() {
        Task{
            do {
                self.user = try await self.getUser()
            }catch{
                print(error)
            }
        }
    }
    
    func getUser() async throws -> GitHubUser {
        
        let endpoint = "https://api.github.com/users/twostraws"
        
        // converting to url
        guard let url = URL(string: endpoint) else {
            throw GHError.invalidURL
        }
        
        // get data * from * URL
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // response, 200 succesful else throw error
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GHError.invalidResponse
        }
        
        // decoder json, convert snake case to camel case if necessary
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GitHubUser.self, from: data)
        } catch {
            throw GHError.invalidData
        }
    }
    
}
