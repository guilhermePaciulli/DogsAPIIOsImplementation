//
//  User.swift
//  IDdog
//
//  Created by Guilherme Paciulli on 02/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

class User: Codable {
    
    let email: String
    let id: String
    let token: String
    let createdAt: String
    let updatedAt: String
    let v: Int
    
    enum CodingKeys: String, CodingKey {
        case email
        case id = "_id"
        case token, createdAt, updatedAt
        case v = "__v"
    }
    
    init(email: String, id: String, token: String, createdAt: String, updatedAt: String, v: Int) {
        self.email = email
        self.id = id
        self.token = token
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.v = v
    }
}
