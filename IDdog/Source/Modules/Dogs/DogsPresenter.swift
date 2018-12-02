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

    // MARK: - DogsPresenterInputProtocol

    // MARK: - DogsPresenterInteractorOutputProtocol

	// MARK: - Private Methods

}
