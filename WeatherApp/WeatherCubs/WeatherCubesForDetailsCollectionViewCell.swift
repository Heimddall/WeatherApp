//
//  WeatherCubesForDetailsCollectionViewCell.swift
//  WeatherApp
//
//  Created by Никита Суровцев on 16.10.23.
//

import UIKit

class WeatherCubesForDetailsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageExample: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        imageExample.image = UIImage(named: "UV")
    }

    
}
