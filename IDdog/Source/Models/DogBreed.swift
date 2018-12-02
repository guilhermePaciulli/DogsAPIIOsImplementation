//
//  DogBreed.swift
//  IDdog
//
//  Created by Guilherme Paciulli on 02/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

class DogBreed: Codable {
    
    var breedName: String
    
    init(breed: String) {
        self.breedName = breed
    }
    
}
