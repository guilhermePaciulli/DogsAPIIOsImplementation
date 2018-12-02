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
//        sel
    }
    
    func item(at indexPath: IndexPath) -> DogBreed {
        <#code#>
    }
    
    func didSelectItem(at indexPath: Int) {
        <#code#>
    }

    // MARK: - BreedsPresenterInteractorOutputProtocol

	// MARK: - Private Methods

}
