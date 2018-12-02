//
//  Result.swift
//  IDdog
//
//  Created by Guilherme Paciulli on 01/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}

public typealias ResultCallback<Value> = (Result<Value>) -> Void
