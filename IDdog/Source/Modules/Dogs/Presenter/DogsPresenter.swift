//
//  DogsPresenter.swift
//  IDdog
//
//  Created Guilherme Paciulli on 02/12/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class DogsPresenter: NSObject, DogsPresenterInputProtocol, DogsInteractorOutputProtocol {

	// MARK: - Viper Module Properties
    weak var view: DogsPresenterOutputProtocol!
    var interactor: DogsInteractorInputProtocol!
    var router: DogsRouterProtocol!
    
    // MARK: - Properties
    var dogs: Dog?

    // MARK: - DogsPresenterInputProtocol
    
    func fetchDogs() {
        self.dogs = nil
        self.view.showLoadingDogs(true, completion: {
            self.interactor.fetchDogs(forCategory: self.router.category)
        })
    }
    
    func dogsForSection(_ section: Int) -> Int {
        if let dogs = dogs {
            return dogs.list.count
        }
        return 0
    }
    
    func dogForIndexPath(_ indexPath: IndexPath) -> URL? {
        if let dogs = dogs {
            return URL(string: dogs.list[indexPath.row])
        }
        return nil
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func didSelectDog(dogImage image: UIImage) {
        self.router.showDogDetail(for: image)
    }

    // MARK: - DogsPresenterInteractorOutputProtocol
    func handleSuccessFetchedDogs(with results: Dog) {
    }
    
    func handleFailureFetchingDogs(with message: String) {
    }

	// MARK: - Private Methods

}
