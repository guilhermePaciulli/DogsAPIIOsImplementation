//
//  DogRequestTest.swift
//  IDdogTests
//
//  Created by Guilherme Paciulli on 02/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import XCTest

@testable import IDdog

class DogRequestTest: XCTestCase {
    
    override func setUp() {
        UserDAO.shared.clearUserFromKeyChain()
    }

    func testDogRequestFailure() {
        
        var results = ""
        let expectation = self.expectation(description: "Labrador")
        DogAPIClient.shared.send(DogRequest.init(forBreed: DogBreed.init(breed: "labrador")), completion: { result in
            
            switch result {
            case .success(_):
                break
            case .failure(let error):
                results = error.message
            }
            expectation.fulfill()
        })
        
        self.waitForExpectations(timeout: 5)
        XCTAssertEqual(results, "Unauthorized")
        
    }
    
    func testDogRequestSuccess() {
        var results = ""
        
        let expectation = self.expectation(description: "Fetching dogs with auth")
        
        UserDAO.shared.createUser(with: "gui@test.com", completion: { _ in
            
            DogAPIClient.shared.send(DogRequest(forBreed: DogBreed(breed: "labrador")), completion: { result in
                
                switch result {
                case .success(let dogs):
                    results = dogs.category
                case .failure(_):
                    break
                }
                
                expectation.fulfill()
            })
            
        })
        
        self.waitForExpectations(timeout: 10)
        
        XCTAssertEqual(results, "labrador")
        
    }

}
