//
//  BreedsInteractor.swift
//  IDdog
//
//  Created Guilherme Paciulli on 02/12/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class BreedsInteractor: NSObject, BreedsInteractorInputProtocol {

	// MARK: - Viper Module Properties
    weak var output: BreedsInteractorOutputProtocol!

	// MARK: - BreedsInteractorInputProtocol
    func fetchBreeds() {
        self.output.handleSuccessFetchedBreeds(with: DogsDAO.shared.fetchDogTypes())
    }

}
