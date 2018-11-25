//
//  MyGithub.swift
//  MVPDemoSwift
//
//  Created by Md Anwar Hossain on 25/11/18.
//  Copyright © 2018 Md Anwar Hossain. All rights reserved.
//

import Foundation
struct MyGithub: Codable {
    
    let name: String?
    let location: String?
    let followers: Int?
    let avatarUrl: URL?
    let repos: Int?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case location
        case followers
        case repos = "public_repos"
        case avatarUrl = "avatar_url"
        
    }
}
