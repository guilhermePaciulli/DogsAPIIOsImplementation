//
//  LoginInteractor.swift
//  IDdog
//
//  Created Guilherme Paciulli on 02/12/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class LoginInteractor: NSObject, LoginInteractorInputProtocol {

	// MARK: - Viper Module Properties
    weak var output: LoginInteractorOutputProtocol!

	// MARK: - LoginInteractorInputProtocol
    
    func createUser(with email: String) {
        if self.isInvalidEmail(email) {
            self.output.handleFailureLoggingInUser(with: "Invalid email")
            return
        }
        
        UserDAO.shared.createUser(with: email, completion: { result in
            
            switch result {
            case .success(let user):
                self.output.handleSuccessLoggingInUser(with: user)
            case .failure(let error):
                self.output.handleFailureLoggingInUser(with: error.message)
            }
            
        })
    }
    
    // MARK: - Private Methods
    
    private func isInvalidEmail(_ email: String) -> Bool {
        return !NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}").evaluate(with: email)
    }


}
