//
//  DogsDAOTests.swift
//  IDdogTests
//
//  Created by Guilherme Paciulli on 02/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import XCTest

@testable import IDdog

class DogsDAOTests: XCTestCase {

    override func setUp() {
        UserDAO.shared.clearUserFromKeyChain()
    }

    override func tearDown() {
        UserDAO.shared.clearUserFromKeyChain()
    }

    func testDogTypes() {
        XCTAssertEqual(DogsDAO.shared.fetchDogTypes().last!.breedName, "Pug")
    }
    
    func testFetchingDogs() {
        
        let breed = DogsDAO.shared.fetchDogTypes()[0]
        var results = ""
        
        let expectation = self.expectation(description: "Dog fetching")
        UserDAO.shared.createUser(with: "gui@test.com", completion: { _ in
            DogsDAO.shared.fetchDogs(fromBreed: breed, completion: { result in
                
                switch result {
                case .failure(_):
                    break
                case .success(let value):
                    results = value.category
                }
                
                expectation.fulfill()
            })
            
        })
        
        self.waitForExpectations(timeout: 10)
        
        XCTAssertEqual(results, breed.breedName.lowercased())
        
    }
}
