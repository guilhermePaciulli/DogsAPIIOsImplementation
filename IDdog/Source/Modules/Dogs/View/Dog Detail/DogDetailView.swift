//
//  DogDetailView.swift
//  IDdog
//
//  Created by Guilherme Paciulli on 02/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import UIKit

class DogDetailView: UIViewController {
    
    var image: UIImage!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.imageView.image = image
    }
    
    @IBAction func didTouchToDismiss(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
