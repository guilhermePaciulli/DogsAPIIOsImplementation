//
//  SignUpRequestTest.swift
//  IDdogTests
//
//  Created by Guilherme Paciulli on 02/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import XCTest
@testable import IDdog

class SignUpRequestTest: XCTestCase {
    
    func testSignUpSuccess() {
        let email = "guilherme@test.com"
        var results = ""
        
        let expectation = self.expectation(description: "Email")
        DogAPIClient.shared.send(SignUpRequest(email: email), completion: { result in
            
            switch result {
            case .success(let user):
                results = user.user.email
            case .failure(_):
                break
            }
            
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(results, email)
        
    }
    
    func testSignUpFailure() {
        var results = ""
        
        let expectation = self.expectation(description: "Email")
        DogAPIClient.shared.send(SignUpRequest(email: ""), completion: { result in
            
            switch result {
            case .success(_):
                break
            case .failure(let error):
                results = error.message
            }
            
            expectation.fulfill()
            
        })
        waitForExpectations(timeout: 5, handler: nil)

        XCTAssertEqual(results, "Email is not valid")
    }

}
