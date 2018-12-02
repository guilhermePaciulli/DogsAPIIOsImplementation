//
//  DogsRouter.swift
//  IDdog
//
//  Created Guilherme Paciulli on 02/12/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class DogsRouter: NSObject, DogsRouterProtocol {
    
	// MARK: - Constants
	private let storyBoardName = "Dogs"
	private let viewIdentifier = "DogsView"

	// MARK: - Viper Module Properties
	weak var view: DogsView!
    
    // MARK: - Properties
    var category: DogBreed!

	// MARK: - Constructors
    init(withCategory breed: DogBreed) {
		super.init()

		let view = self.viewControllerFromStoryboard()
		let interactor = DogsInteractor()
		let presenter = DogsPresenter()

		presenter.interactor = interactor
		presenter.router = self
		presenter.view = view

		view.presenter = presenter
		interactor.output = presenter

		self.view = view
        self.category = breed
	}

    // MARK: - DogsRouterProtocol
    func push(to viewController: UIViewController) {
        viewController.navigationController?.pushViewController(self.view, animated: true)
    }
    
    func showDogDetail(for dog: UIImage) {
    }

	// MARK: - Private methods
	private func viewControllerFromStoryboard() -> DogsView {
		let storyboard = UIStoryboard(name: self.storyBoardName, bundle: nil)
		let viewController = storyboard.instantiateViewController(withIdentifier: self.viewIdentifier)

		return viewController as! DogsView
	}
}
