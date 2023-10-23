//
//  WeatherCubesCollectionViewCell.swift
//  WeatherApp
//
//  Created by Никита Суровцев on 22.10.23.
//

import UIKit

class WeatherCubesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var randomImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        randomImage.image = UIImage(named: "UV")
    }

}
