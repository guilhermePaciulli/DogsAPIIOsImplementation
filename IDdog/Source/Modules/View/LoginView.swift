//
//  LoginView.swift
//  IDdog
//
//  Created Guilherme Paciulli on 02/12/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class LoginView: UIViewController, LoginPresenterOutputProtocol {

    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    // MARK: - Properties
    var loadingViewController: UIAlertController?
    
    // MARK: - Viper Module Properties
	var presenter: LoginPresenterInputProtocol!

	// MARK: - Override methods
	override func viewDidLoad() {
        super.viewDidLoad()
        
        self.confirmButton.layer.cornerRadius = self.confirmButton.frame.width / 15
        self.confirmButton.clipsToBounds = true
    }

    // MARK: - LoginPresenterOutputProtocol
    func showLoading(_ loading: Bool) {
        if loading {
            self.loadingViewController = self.showLoadingAlertView()
        } else {
            self.loadingViewController?.dismiss(animated: true)
        }
    }
    
    func showError(message: String) {
        let alert = UIAlertController.init(title: "Warning", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: { _ in
            alert.dismiss(animated: true)
        }))
        self.present(alert, animated: true)
        
    }

    @IBAction func didPressToConfirmButton(_ sender: Any) {
    }
    
    // MARK: - Private Methods

}
