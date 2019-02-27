//
//  LoginTests.swift
//  IDdogUITests
//
//  Created by Guilherme Paciulli on 27/02/19.
//  Copyright © 2019 Guilherme Paciulli. All rights reserved.
//

import XCTest

class LoginTests: XCUITestCase {
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testIfUserLogsIn() {
        XCTAssertTrue(app.isDisplayingLoginScreen)
        
        app.textFields["EmailTextField"].tap()
        app.typeText("teste@teste.com")
        app.otherElements["LoginView"].tap()

        app.buttons["ConfirmButton"].tap()
        
        let expectation = self.expectation(description: "to log in")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            XCTAssertTrue(self.app.isDisplayingBreedsView)
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: nil)
    }

}
