//
//  BrowseViewController.swift
//  Popcorn
//
//  Created by Joseph Sugira on 5/21/19.
//  Copyright © 2019 Nelly Sugu. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let movieTitles = ["Top Rated", "Upcoming Movies", "Now Playing"]
    let movies = [
        [
            [
                "url": "https://image.tmdb.org/t/p/w500/kcga7xuiQVqM9WHfWnAbidxU7hd.jpg",
                "title": "John Wick: Chapter 3 – Parabellum",
                "rating": 3
            ],
            [
                "url": "https://image.tmdb.org/t/p/w500/kZMCbp0o46Tsg43omSHNHJKNTx9.jpg",
                "title": "Catarina and the others",
                "rating": 2
            ],
            [
                "url": "https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg",
                "title": "Avengers: Endgame",
                "rating": 4
            ],
            [
                "url": "https://image.tmdb.org/t/p/w500/wgQ7APnFpf1TuviKHXeEe3KnsTV.jpg",
                "title": "Pokémon Detective Pikachu",
                "rating": 3
            ]
        ],
        [
            [
                "url": "https://image.tmdb.org/t/p/w500/kcga7xuiQVqM9WHfWnAbidxU7hd.jpg",
                "title": "John Wick: Chapter 3 – Parabellum",
                "rating": 3
            ],
            [
                "url": "https://image.tmdb.org/t/p/w500/kZMCbp0o46Tsg43omSHNHJKNTx9.jpg",
                "title": "Catarina and the others",
                "rating": 2
            ],
            [
                "url": "https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg",
                "title": "Avengers: Endgame",
                "rating": 4
            ],
            [
                "url": "https://image.tmdb.org/t/p/w500/wgQ7APnFpf1TuviKHXeEe3KnsTV.jpg",
                "title": "Pokémon Detective Pikachu",
                "rating": 3
            ]
        ],
        [
            [
                "url": "https://image.tmdb.org/t/p/w500/kcga7xuiQVqM9WHfWnAbidxU7hd.jpg",
                "title": "John Wick: Chapter 3 – Parabellum",
                "rating": 3
            ],
            [
                "url": "https://image.tmdb.org/t/p/w500/kZMCbp0o46Tsg43omSHNHJKNTx9.jpg",
                "title": "Catarina and the others",
                "rating": 2
            ],
            [
                "url": "https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg",
                "title": "Avengers: Endgame",
                "rating": 4
            ],
            [
                "url": "https://image.tmdb.org/t/p/w500/wgQ7APnFpf1TuviKHXeEe3KnsTV.jpg",
                "title": "Pokémon Detective Pikachu",
                "rating": 3
            ]
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        

        tableView.tableFooterView = UIView()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BrowseViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        cell.titleLabel.text = movieTitles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 257
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? MovieCell else {return}
        
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}

extension BrowseViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCard", for: indexPath) as! MovieCardCollectionViewCell
        
        let movieInfo = movies[collectionView.tag][indexPath.row]
        
        let urlString = movieInfo["url"] as! String
        let imageUrl = URL(string: urlString)
        
        DispatchQueue.global(qos: .userInitiated).async {
            let imageData = NSData(contentsOf: imageUrl!)!
            
            DispatchQueue.main.async {
                let image = UIImage(data: imageData as Data)
                cell.pictureImageView.image = image
            }
        }
        
        cell.titleLabel.text = (movieInfo["title"] as! String)
        
        var ratingLabel = ""
        let ratingCount = movieInfo["rating"] as! Int
        for _ in 0..<ratingCount {
            ratingLabel += "⭑"
        }
        
        if ratingLabel.count < 5{
            for _ in ratingLabel.count..<5{
                ratingLabel += "☆"
            }
        }
        cell.ratingLabel.text = ratingLabel
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
