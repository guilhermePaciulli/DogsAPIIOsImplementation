//
//  DogsProtocols.swift
//  IDdog
//
//  Created Guilherme Paciulli on 02/12/18.
//  Copyright © 2018. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Router
protocol DogsRouterProtocol: class {
    
    func push(to viewController: UIViewController)
    func showDogDetail(for dog: UIImage)
    
    var category: DogBreed! { get }
}

// MARK: - Interactor
protocol DogsInteractorInputProtocol {
    func fetchDogs(forCategory category: DogBreed)
}

// MARK: - Presenter
protocol DogsPresenterInputProtocol: class {
    
    func fetchDogs()
    func dogForIndexPath(_ indexPath: IndexPath) -> URL?
    func dogsForSection(_ section: Int) -> Int
    func numberOfSections() -> Int
    func didSelectDog(dogImage image: UIImage)
    func dogBreedName() -> String
    
}

protocol DogsInteractorOutputProtocol: class {
    
    func handleSuccessFetchedDogs(with results: Dog)
    func handleFailureFetchingDogs(with message: String)

}

// MARK: - View
protocol DogsPresenterOutputProtocol: class {
    func showError(with message: String)
    func showLoadingDogs(_ loading: Bool, completion: @escaping () -> (Void))
    func reloadDogs()
    

}
