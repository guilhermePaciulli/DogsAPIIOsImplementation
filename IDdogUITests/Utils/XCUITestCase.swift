//
//  XCTestCase+Extension.swift
//  IDdogUITests
//
//  Created by Guilherme Paciulli on 27/02/19.
//  Copyright © 2019 Guilherme Paciulli. All rights reserved.
//

import Foundation
import XCTest


class XCUITestCase: XCTestCase {
    
    lazy var app: XCUIApplication = {
        let app = XCUIApplication()
        app.launchArguments.append("--uitesting")
        return app
    }()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        app.launch()
        
    }
    
}
