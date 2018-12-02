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
    }

    override func tearDown() {
    }

    func testDogRequestFailure() {
        
        var results = ""
        let expectation = self.expectation(description: "Labrador")
        DogAPIClient.shared.send(DogRequest.init(forBreed: DogBreed.init(breed: "Labrador")), completion: { result in
            
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

}
