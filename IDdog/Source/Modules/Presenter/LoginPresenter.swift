//
//  LoginPresenter.swift
//  IDdog
//
//  Created Guilherme Paciulli on 02/12/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class LoginPresenter: NSObject, LoginPresenterInputProtocol, LoginInteractorOutputProtocol {

	// MARK: - Viper Module Properties
    weak var view: LoginPresenterOutputProtocol!
    var interactor: LoginInteractorInputProtocol!
    var router: LoginRouterProtocol!

    // MARK: - LoginPresenterInputProtocol

    // MARK: - LoginPresenterInteractorOutputProtocol

	// MARK: - Private Methods

}
