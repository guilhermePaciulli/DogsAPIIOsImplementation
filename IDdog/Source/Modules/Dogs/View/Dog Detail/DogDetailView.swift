//
//  DogDetailView.swift
//  IDdog
//
//  Created by Guilherme Paciulli on 02/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import UIKit

class DogDetailView: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Properties
    var image: UIImage!
    var heroID: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.imageView.image = image
        self.imageView.hero.id = self.heroID
    }
    
    @IBAction func didTouchToDismiss(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
