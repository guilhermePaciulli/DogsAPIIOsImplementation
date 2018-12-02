//
//  SignUpRequest.swift
//  IDdog
//
//  Created by Guilherme Paciulli on 02/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

class SignUpRequest: APIRequest {
    typealias Response = User
    
    var path: String {
        return "signup"
    }
    
    var type: RequestType {
        return .post
    }
    
    var params: [String : String]?
    
    var email: String
    
    init(email: String) {
        self.email = email
    }
    
}
