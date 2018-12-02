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
        
        self.breedCard.layer.cornerRadius = self.breedCard.frame.width / 15
        self.breedCard.clipsToBounds = true
        self.breedCard.dropShadow(color: UIColor.black, opacity: 0.8, offSet: CGSize.zero, radius: 20, scale: true)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setBreed(_ breed: DogBreed) {
        self.breedName.text = breed.breedName
    }

}
