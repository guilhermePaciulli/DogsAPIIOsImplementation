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
        if self.isValidEmail(testStr: email) {
            self.view.showLoading(true)
            self.interactor.createUser(with: email)
        } else {
            self.view.showError(message: "Invalid email")
        }
    }

    // MARK: - LoginPresenterInteractorOutputProtocol
    func handleSuccessLoggingInUser(with result: User) {
        self.view.showLoading(false)
        self.router.showDogsPage()
    }
    
    func handleFailureLoggingInUser(with error: String) {
        self.view.showLoading(false)
        self.view.showError(message: error)
    }

	// MARK: - Private Methods
    
    private func isValidEmail(testStr:String) -> Bool {
        return NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}").evaluate(with: testStr)
    }

}
