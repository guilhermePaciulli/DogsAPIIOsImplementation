//
//  LoginModulesTests.swift
//  IDdogTests
//
//  Created by Guilherme Paciulli on 02/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import XCTest
import UIKit

@testable import IDdog

class LoginModulesTests: XCTestCase {
    
    var router: LoginRouter!
    var view: LoginView {
        return self.router.view
    }
    
    override func setUp() {
        super.setUp()
        self.router = LoginRouter()
        self.router.presentAsRoot(UIApplication.shared.keyWindow!)
        UserDAO.shared.clearUserFromKeyChain()
    }
    
    
    func testIfLogsInUserSuccessfully() {
        self.view.emailTextField.text = "guiherme@test.com"
        self.view.didPressToConfirmButton(UIButton.init())
        let expectation = self.expectation(description: "check if user logs in")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            expectation.fulfill()
        })
        
        self.waitForExpectations(timeout: 5)
        
        XCTAssertNotNil(UserDAO.shared.fetchUser())
    }
    
    func testIfFailsLogginIn() {
        self.view.emailTextField.text = ""
        self.view.didPressToConfirmButton(UIButton.init())
        
        let expectation = self.expectation(description: "check if user doesn't log in")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            expectation.fulfill()
        })
        
        self.waitForExpectations(timeout: 1)
        
        let presentedView = UIApplication.shared.getTopMostViewController()! as! UIAlertController
        XCTAssertEqual(presentedView.message, "Invalid email")
    }

}
