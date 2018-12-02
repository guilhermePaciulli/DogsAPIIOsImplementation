//
//  UView+Extension.swift
//  IDdogTests
//
//  Created by Guilherme Paciulli on 02/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
    func getTopMostViewController() -> UIViewController? {
        if var topController = self.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
}
