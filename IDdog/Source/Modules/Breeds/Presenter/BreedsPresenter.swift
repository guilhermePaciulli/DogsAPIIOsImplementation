//
//  BreedsPresenter.swift
//  IDdog
//
//  Created Guilherme Paciulli on 02/12/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class BreedsPresenter: NSObject, BreedsPresenterInputProtocol, BreedsInteractorOutputProtocol {

	// MARK: - Viper Module Properties
    weak var view: BreedsPresenterOutputProtocol!
    var interactor: BreedsInteractorInputProtocol!
    var router: BreedsRouterProtocol!
    
    // MARK: - Properties
    private var breeds: [DogBreed] = []

    // MARK: - BreedsPresenterInputProtocol
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfBreeds(in section: Int) -> Int {
        return self.breeds.count
    }
    
    func loadBreeds() {
        self.breeds = []
        self.view.loadBreeds()
        self.view.showLoadingBreeds(loading: true, completion: {
            self.interactor.fetchBreeds()
        })
    }
    
    func item(at indexPath: IndexPath) -> DogBreed {
        return self.breeds[indexPath.row]
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        self.router.moveToBreed(self.breeds[indexPath.row])
    }

    // MARK: - BreedsPresenterInteractorOutputProtocol
    func handleSuccessFetchedBreeds(with result: [DogBreed]) {
        self.breeds = result
        self.view.showLoadingBreeds(loading: false, completion: {
            self.view.loadBreeds()
        })
    }
    
    func handleFailureBreedFetching(message: String) {
        self.breeds = []
        self.view.showLoadingBreeds(loading: false, completion: {
            self.view.showError(message: message)
            self.view.loadBreeds()
        })
    }

	// MARK: - Private Methods

}
