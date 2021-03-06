//
//  DogsPresenter.swift
//  IDdog
//
//  Created Guilherme Paciulli on 02/12/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit
import Kingfisher

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
    
    func didSelectDog(at indexPath: IndexPath, andHeroID id: String) {
        if let dogs = dogs, let urlImage = URL(string: dogs.list[indexPath.row]) {
            UIImageView().kf.setImage(with: urlImage, completionHandler: { img, _, _, _ in
                if let img = img {
                    self.router.showDogDetail(for: img, andHeroID: id)
                }
                self.router.showDogDetail(for: UIImage(named: "dog404")!, andHeroID: id)
            })
        } else {
            self.router.showDogDetail(for: UIImage(named: "dog404")!, andHeroID: id)
        }
    }
    
    func dogBreedName() -> String {
        return self.router.category.breedName
    }

    // MARK: - DogsPresenterInteractorOutputProtocol
    func handleSuccessFetchedDogs(with results: Dog) {
        self.view.showLoadingDogs(false, completion: {
            self.dogs = results
            self.view.reloadDogs()
        })
    }
    
    func handleFailureFetchingDogs(with message: String) {
        self.view.showLoadingDogs(false, completion: {
            self.dogs = nil
            self.view.reloadDogs()
            self.view.showError(with: message)
        })
    }

	// MARK: - Private Methods

}
