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

    // MARK: - BreedsPresenterInputProtocol

    // MARK: - BreedsPresenterInteractorOutputProtocol

	// MARK: - Private Methods

}
