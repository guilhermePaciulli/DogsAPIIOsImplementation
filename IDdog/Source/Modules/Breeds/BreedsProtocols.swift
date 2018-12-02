//
//  BreedsProtocols.swift
//  IDdog
//
//  Created Guilherme Paciulli on 02/12/18.
//  Copyright © 2018. All rights reserved.
//

import Foundation

// MARK: - Router
protocol BreedsRouterProtocol: class {

}

// MARK: - Interactor
protocol BreedsInteractorInputProtocol {
    
    func fetchBreeds()

}

// MARK: - Presenter
protocol BreedsPresenterInputProtocol: class {
    
    func numberOfSections() -> Int
    func numberOfBreeds(in section: Int) -> Int
    
    func loadBreeds()
    
    func item(at indexPath: IndexPath) -> DogBreed
    func didSelectItem(at indexPath: Int)

}

protocol BreedsInteractorOutputProtocol: class {
    
    func handleSuccessFetchedBreeds(with result: [DogBreed])
    func handleFailureBreedFetching(message: String)
    
}

// MARK: - View
protocol BreedsPresenterOutputProtocol: class {
    func loadBreeds()
    func showError(message: String)
    func showLoadingBreeds(loading: Bool, completion: @escaping () -> (Void))
}
