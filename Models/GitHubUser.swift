//
//  GitHubUser.swift
//  GitHubAPI
//
//  Created by Alejandra San Martin on 10/10/23.
//

import Foundation

struct GitHubUser: Codable{
    let login: String?
    let avatarUrl: String?
    let bio: String?
    let followers: Int?
    let following: Int?
}
