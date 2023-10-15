//
//  HourlyTableViewCell.swift
//  WeatherApp
//
//  Created by Никита Суровцев on 8.10.23.
//

import UIKit

class HourlyTableViewCell: UITableViewCell {

    @IBOutlet weak var hourlyCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        let hourlyCollectionViewCellNib = UINib(nibName: "HourlyCollectionViewCell", bundle: Bundle.main)
        hourlyCollectionView.register(hourlyCollectionViewCellNib, forCellWithReuseIdentifier: "hourlyCollectionViewCell")
        
        hourlyCollectionView.dataSource = self
        hourlyCollectionView.delegate = self
        
        setupScrollDirection()
        
    }
    
    func setupScrollDirection() {
        if let layout = hourlyCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension HourlyTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = hourlyCollectionView.dequeueReusableCell(withReuseIdentifier: "hourlyCollectionViewCell", for: indexPath) as? HourlyCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = 90
        let cellHeight = 150
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
    
