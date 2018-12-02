//
//  UserDAOTests.swift
//  IDdogTests
//
//  Created by Guilherme Paciulli on 02/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import XCTest

@testable import IDdog

class UserDAOTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
        UserDAO.shared.clearUserFromKeyChain()
    }

    func testIfSavesUserToKeychain() {
        var user: User?
        
        let expectation = self.expectation(description: "User exists")
        UserDAO.shared.createUser(with: "testing@user.com", completion: { result in
            
            user = UserDAO.shared.fetchUser()
            expectation.fulfill()
            
        })
        
        self.waitForExpectations(timeout: 5)
        
        XCTAssertNotNil(user)
        
    }

}
