//
//  BreedsCell.swift
//  IDdog
//
//  Created by Guilherme Paciulli on 02/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import UIKit

class BreedsCell: UITableViewCell {

    // MARK :- IBOutlets
    @IBOutlet weak var breedName: UILabel!
    @IBOutlet weak var breedCard: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.breedCard.layer.cornerRadius = self.breedCard.frame.width / 30
        self.breedCard.clipsToBounds = true
        self.breedCard.dropShadow(color: #colorLiteral(red: 0.01960784314, green: 0.06274509804, blue: 0.07843137255, alpha: 1), opacity: 0.25, offSet: CGSize(width: 0, height: 5), radius: 5, scale: true, shouldFollowPath: false)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setBreed(_ breed: DogBreed) {
        self.breedName.text = breed.breedName
    }

}
