//
//  BreedsModuleTests.swift
//  IDdogTests
//
//  Created by Guilherme Paciulli on 02/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import XCTest

@testable import IDdog

class BreedsModuleTests: XCTestCase {

    var router: BreedsRouter!
    var view: BreedsView {
        return self.router.view
    }
    
    override func setUp() {
        self.router = BreedsRouter()
        self.router.presentAsRoot(UIApplication.shared.keyWindow!)
    }

    func testFetchingBreeds() {
        let expectation = self.expectation(description: "to fetch breeds")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            
            expectation.fulfill()
        })
        
        self.waitForExpectations(timeout: 2)
        
        XCTAssert(self.view.tableView(self.view.tableView, numberOfRowsInSection: 0) == DogsDAO.shared.fetchDogTypes().count)
        
    }
}
