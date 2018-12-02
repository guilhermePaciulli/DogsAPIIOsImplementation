//
//  User.swift
//  IDdog
//
//  Created by Guilherme Paciulli on 02/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

class User: Codable {
    let user: UserData
    
    init(user: UserData) {
        self.user = user
    }
}

class UserData: Codable {
    let id, email, token, createdAt: String
    let updatedAt: String
    let v: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case email, token, createdAt, updatedAt
        case v = "__v"
    }
    
    init(id: String, email: String, token: String, createdAt: String, updatedAt: String, v: Int) {
        self.id = id
        self.email = email
        self.token = token
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.v = v
    }
}
