//
//  XCUIApplication+Extension.swift
//  IDdogUITests
//
//  Created by Guilherme Paciulli on 27/02/19.
//  Copyright © 2019 Guilherme Paciulli. All rights reserved.
//

import Foundation
import XCTest

@testable import IDdog

extension XCUIApplication {
    
    var isDisplayingLoginScreen: Bool {
        return otherElements["LoginView"].exists
    }
    
    var isDisplayingBreedsView: Bool {
        return otherElements["BreedsView"].exists
    }
    
}
