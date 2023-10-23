//
//  WeatherCubsTableViewCell.swift
//  WeatherApp
//
//  Created by Никита Суровцев on 22.10.23.
//

import UIKit

class WeatherCubsTableViewCell: UITableViewCell {

    @IBOutlet weak var cubesCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let weatherCubesCollectionViewCellNib = UINib(nibName: "WeatherCubesCollectionViewCell" , bundle: Bundle.main)
        cubesCollectionView.register(weatherCubesCollectionViewCellNib, forCellWithReuseIdentifier: "weatherCube")
        
        cubesCollectionView.dataSource = self
        cubesCollectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension WeatherCubsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = cubesCollectionView.dequeueReusableCell(withReuseIdentifier: "weatherCube", for: indexPath) as? WeatherCubesCollectionViewCell else {
            return UICollectionViewCell()}
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.frame.width - 60) / 2
        let cellHeight = 150.0
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
