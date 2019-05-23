//
//  MovieCells.swift
//  Popcorn
//
//  Created by Joseph Sugira on 5/21/19.
//  Copyright © 2019 Nelly Sugu. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet private weak var cardsCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardsCollectionView.register(UINib(nibName: "MovieCardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieCard")
    }
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int){
        cardsCollectionView.dataSource = dataSourceDelegate
        cardsCollectionView.delegate = dataSourceDelegate
        cardsCollectionView.tag = row
        cardsCollectionView.reloadData()
    }
    
}

