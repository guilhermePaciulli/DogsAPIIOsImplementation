//
//  DogRequest.swift
//  IDdog
//
//  Created by Guilherme Paciulli on 02/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

class DogRequest: APIRequest {
    
    var path: String {
        return "feed"
    }
    
    var type: RequestType {
        return .get
    }
    
    var params: [String : String]?
    
    typealias Response = Dog
    
    var breed: DogBreed
    
    init(forBreed breed: DogBreed) {
        self.breed = breed
        self.params = ["category": breed.breedName.lowercased()]
    }
}
