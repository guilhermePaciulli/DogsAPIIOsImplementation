//
//  DogsProtocols.swift
//  IDdog
//
//  Created Guilherme Paciulli on 02/12/18.
//  Copyright © 2018. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Router
protocol DogsRouterProtocol: class {
    
    func push(to viewController: UIViewController)
    func showDogDetail(for dog: String)
//    func backToBreedsView()
}

// MARK: - Interactor
protocol DogsInteractorInputProtocol {
    func fetchDogs(forCategory category: String)
}

// MARK: - Presenter
protocol DogsPresenterInputProtocol: class {
    
    func fetchDogs()
    func dogFor(_ indexPath: IndexPath) -> String
    func numberOfSections() -> Int
    func didSelectItem(at indexPath: IndexPath)
    
//    func backToBreedsView()
    
}

protocol DogsInteractorOutputProtocol: class {
    
    func handleSuccessFetchedDogs(with results: Dog)
    func handleFailureFetchingDogs(with message: String)

}

// MARK: - View
protocol DogsPresenterOutputProtocol: class {
    func showError(with message: String, completion: @escaping () -> (Void))
    func showLoadingDogs(_ loading: Bool)
    func reloadDogs()
    

}
