//
//  FollowersViewModel.swift
//  GitHubAPI
//
//  Created by Alejandra San Martin on 10/10/23.
//

import Foundation

@MainActor
class FollowersViewModel: ObservableObject{
    
    @Published var followers: [GitHubUser] = []
    
    init(){
        self.loadFollowers()
    }
    
    func loadFollowers(){
        Task{
            do {
                self.followers = try await self.fetchFollowers()
            }catch{
                print(error)
            }
        }
    }
    
//    func getFollowers() async throws{
//        let endpoint = "https://api.github.com/users/twostraws/followers"
//
//        // converting to url
//        guard let url = URL(string: endpoint) else {
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url){ [weak self]
//            data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            do{
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let followers = try decoder.decode([GitHubUser].self, from: data)
//
//                self?.followers = followers
//            }catch{
//                print(error)
//            }
//
//        }
//        task.resume()
//    }
    
    func fetchFollowers() async throws -> [GitHubUser]{
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<[GitHubUser],Error>) in
            let endpoint = "https://api.github.com/users/twostraws/followers"
            
            // converting to url
            guard let url = URL(string: endpoint) else {
                return
            }
            
            let task = URLSession.shared.dataTask(with: url){
                data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                do{
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let followers = try decoder.decode([GitHubUser].self, from: data)
                    continuation.resume(returning: followers)
                }catch{
                    continuation.resume(throwing: error)
                }
                
            }
            task.resume()
        }
    }
    
}
