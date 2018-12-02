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
    func createUser(with email: String) {
        self.view.showLoading(true, completion: {
            self.interactor.createUser(with: email)
        })
    }

    // MARK: - LoginPresenterInteractorOutputProtocol
    func handleSuccessLoggingInUser(with result: User) {
        self.view.showLoading(false, completion: {
            self.router.showDogsPage()
        })
    }
    
    func handleFailureLoggingInUser(with error: String) {
        self.view.showLoading(false, completion: {
            self.view.showError(message: error)
        })
    }
}
