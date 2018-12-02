//
//  DogCell.swift
//  IDdog
//
//  Created by Guilherme Paciulli on 02/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import UIKit

class DogCell: UICollectionViewCell {
    
    // MARK :- IBOutlets
    @IBOutlet weak var dogCard: UIView!
    @IBOutlet weak var dogImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.dogCard.layer.cornerRadius = self.dogCard.frame.width / 10
        self.dogCard.clipsToBounds = true
        self.dogCard.dropShadow(color: #colorLiteral(red: 0.01960784314, green: 0.06274509804, blue: 0.07843137255, alpha: 1), opacity: 0.25, offSet: CGSize(width: 0, height: 5), radius: 5, scale: true, shouldFollowPath: false)
    }
    
    func setDog(image dogImage: UIImage) {
        self.dogImage.image = dogImage
    }
    
}
