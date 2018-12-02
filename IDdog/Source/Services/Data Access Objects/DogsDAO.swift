//
//  DogsDAO.swift
//  IDdog
//
//  Created by Guilherme Paciulli on 02/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

class DogsDAO {
    
    static let shared = DogsDAO()
    
    private var dogBreedTypes: [DogBreed]
    
    private init() {
        self.dogBreedTypes = []
        self.dogBreedTypes.append(DogBreed(breed: "Labrador"))
        self.dogBreedTypes.append(DogBreed(breed: "Husky"))
        self.dogBreedTypes.append(DogBreed(breed: "Hound"))
        self.dogBreedTypes.append(DogBreed(breed: "Pug"))
    }
    
    func fetchDogs(fromBreed breed: DogBreed, completion: @escaping ResultCallback<DogRequest.Response>) {
        DogAPIClient.shared.send(DogRequest(forBreed: breed), completion: completion)
        
    }
    
    func fetchDogTypes() -> [DogBreed] {
        return self.dogBreedTypes
    }
    
}
