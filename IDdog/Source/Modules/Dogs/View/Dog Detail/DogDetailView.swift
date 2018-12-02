//
//  DogDetailView.swift
//  IDdog
//
//  Created by Guilherme Paciulli on 02/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import UIKit
import ImageScrollView

class DogDetailView: UIViewController {

    @IBOutlet var imageScrollView: ImageScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setScroll(toImage image: UIImage) {
        self.imageScrollView.display(image: image)
    }
}
