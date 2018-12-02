//
//  Result.swift
//  IDdog
//
//  Created by Guilherme Paciulli on 01/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(DogError)
}

typealias ResultCallback<Value> = (Result<Value>) -> Void
