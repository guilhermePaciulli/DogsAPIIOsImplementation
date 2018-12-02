//
//  DogsInteractor.swift
//  IDdog
//
//  Created Guilherme Paciulli on 02/12/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class DogsInteractor: NSObject, DogsInteractorInputProtocol {

	// MARK: - Viper Module Properties
    weak var output: DogsInteractorOutputProtocol!

	// MARK: - DogsInteractorInputProtocol
    func fetchDogs(forCategory category: DogBreed) {
        DogsDAO.shared.fetchDogs(fromBreed: category, completion: { result in
            
            switch result {
            case .success(let dog):
                self.output.handleSuccessFetchedDogs(with: dog)
            case .failure(let error):
                self.output.handleFailureFetchingDogs(with: error.message)
            }
            
        })
    }

}
