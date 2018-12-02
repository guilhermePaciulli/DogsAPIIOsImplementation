//
//  LoginProtocols.swift
//  IDdog
//
//  Created Guilherme Paciulli on 02/12/18.
//  Copyright © 2018. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Router
protocol LoginRouterProtocol: class {
    func presentAsRoot(_ window: UIWindow)
    func showDogsPage()
}

// MARK: - Interactor
protocol LoginInteractorInputProtocol {
    
    func attemptToLogin()
    func createUser(with email: String)
    
}

// MARK: - Presenter
protocol LoginPresenterInputProtocol: class {
    
    func attemptToLogin()
    func createUser(with email: String)
    func showDogsPage()

}

protocol LoginInteractorOutputProtocol: class {
    
    func handleSuccessLoggingInUser(with result: User)
    func handleFailureLoggingInUser(with error: String)

}

// MARK: - View
protocol LoginPresenterOutputProtocol: class {
    func showLoading(_ loading: Bool)
    func showError(message: String)
}
