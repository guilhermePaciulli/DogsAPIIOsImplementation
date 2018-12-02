//
//  LoginRouter.swift
//  IDdog
//
//  Created Guilherme Paciulli on 02/12/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class LoginRouter: NSObject, LoginRouterProtocol {

	// MARK: - Constants
	private let storyBoardName = "Login"
	private let viewIdentifier = "LoginView"

	// MARK: - Viper Module Properties
	weak var view: LoginView!

	// MARK: - Constructors
	override init() {
		super.init()

		let view = self.viewControllerFromStoryboard()
		let interactor = LoginInteractor()
		let presenter = LoginPresenter()

		presenter.interactor = interactor
		presenter.router = self
		presenter.view = view

		view.presenter = presenter
		interactor.output = presenter

		self.view = view
	}

    // MARK: - LoginRouterProtocol
    func presentAsRoot(_ window: UIWindow) {
        window.rootViewController = self.view
    }
    
    func showDogsPage() {
        fatalError("Implementation not complete")
    }

	// MARK: - Private methods
	private func viewControllerFromStoryboard() -> LoginView {
		let storyboard = UIStoryboard(name: self.storyBoardName, bundle: nil)
		let viewController = storyboard.instantiateViewController(withIdentifier: self.viewIdentifier)

		return viewController as! LoginView
	}
}
