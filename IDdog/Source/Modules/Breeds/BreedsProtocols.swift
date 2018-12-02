//
//  BreedsProtocols.swift
//  IDdog
//
//  Created Guilherme Paciulli on 02/12/18.
//  Copyright © 2018. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Router
protocol BreedsRouterProtocol: class {
    
    func present(with viewController: UIViewController)
    func presentAsRoot(_ window: UIWindow)
    func moveToBreed(_ breed: DogBreed)
    
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
    func didSelectItem(at indexPath: IndexPath)

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
