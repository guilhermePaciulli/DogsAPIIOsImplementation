//
//  DogsModuleTests.swift
//  IDdogTests
//
//  Created by Guilherme Paciulli on 02/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import XCTest

@testable import IDdog

class DogsModuleTests: XCTestCase {
    
    var router: DogsRouter!
    var view: DogsView! {
        return self.router.view
    }

    func testIfFetchesDogs() {
        
        let expectation1 = self.expectation(description: "to create user")
        
        
        UserDAO.shared.createUser(with: "testing@test.com", completion: { _ in
            expectation1.fulfill()
        })
        
        self.waitForExpectations(timeout: 5)
        
        let expectation2 = self.expectation(description: "to fetch dogs")
        
        DispatchQueue.main.async {
            self.router = DogsRouter(withCategory: DogsDAO.shared.fetchDogTypes()[0])
            UIApplication.shared.keyWindow!.rootViewController = self.view
            UIApplication.shared.keyWindow?.makeKeyAndVisible()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                
                expectation2.fulfill()
            })
            
        }
        
        self.waitForExpectations(timeout: 10)
        
        XCTAssertGreaterThan(self.view.collectionView.numberOfItems(inSection: 0), 0)
        
    }

}
