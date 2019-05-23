//
//  MovieCardCollectionViewCell.swift
//  Popcorn
//
//  Created by Joseph Sugira on 5/22/19.
//  Copyright © 2019 Nelly Sugu. All rights reserved.
//

import UIKit

class MovieCardCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        pictureImageView.layer.cornerRadius = 20
        pictureImageView.clipsToBounds = true
        pictureImageView.layer.borderWidth = 3
        pictureImageView.layer.borderColor = UIColor.white.cgColor
    }

}
