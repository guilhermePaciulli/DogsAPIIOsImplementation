//
//  BreedsRouter.swift
//  IDdog
//
//  Created Guilherme Paciulli on 02/12/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class BreedsRouter: NSObject, BreedsRouterProtocol {

	// MARK: - Constants
	private let storyBoardName = "Breeds"
	private let viewIdentifier = "BreedsView"

	// MARK: - Viper Module Properties
	weak var view: BreedsView!

	// MARK: - Constructors
	override init() {
		super.init()

		let view = self.viewControllerFromStoryboard()
		let interactor = BreedsInteractor()
		let presenter = BreedsPresenter()

		presenter.interactor = interactor
		presenter.router = self
		presenter.view = view

		view.presenter = presenter
		interactor.output = presenter

		self.view = view
	}

    // MARK: - BreedsRouterProtocol
    func present(with viewController: UIViewController) {
        let navigationController = UINavigationController(rootViewController: self.view)
        viewController.present(navigationController, animated: true, completion: nil)
    }
    
    func moveToBreed(_ breed: DogBreed) {
    }

	// MARK: - Private methods
	private func viewControllerFromStoryboard() -> BreedsView {
		let storyboard = UIStoryboard(name: self.storyBoardName, bundle: nil)
		let viewController = storyboard.instantiateViewController(withIdentifier: self.viewIdentifier)
        
		return viewController as! BreedsView
	}
}
