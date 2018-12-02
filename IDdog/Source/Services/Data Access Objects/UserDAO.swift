//
//  UserDAO.swift
//  IDdog
//
//  Created by Guilherme Paciulli on 02/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

class UserDAO {
    
    static let shared = UserDAO()
    
    private init() {}
    
    private let userKeyChainKey = "userKey"
    
    func createUser(with email: String, completion: @escaping ResultCallback<SignUpRequest.Response>) {
        DogAPIClient.shared.send(SignUpRequest(email: email), completion: { result in
            
            switch result {
            case .success(let user):
                guard let userData = try? JSONEncoder().encode(user) else {
                    fatalError("Error when saving user to keychain")
                }
                _ = KeyChainManager.shared.save(key: self.userKeyChainKey, data: userData)
            case .failure(_):
                break
            }
            completion(result)
        })
    }
    
    func fetchUser() -> User? {
        if let userSaved = KeyChainManager.shared.load(key: self.userKeyChainKey) {
            guard let user = try? JSONDecoder().decode(User.self, from: userSaved) else {
                fatalError("Error when retrieving user from keychain")
            }
            return user
        }
        return nil
    }
    
    // Test auxiliar function
    func clearUserFromKeyChain() {
        _  = KeyChainManager.shared.delete(key: self.userKeyChainKey)
    }
    
    
}
