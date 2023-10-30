//
//  HourlyCollectionViewCell.swift
//  WeatherApp
//
//  Created by Никита Суровцев on 8.10.23.
//

import UIKit

class HourlyCollectionViewCell: UICollectionViewCell{
    

    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var imageHourly: UIImageView!
    @IBOutlet weak var temperatureHourly: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageHourly.image = UIImage(named: "cloud")
        hours.text = "10"
        hours.font = .boldSystemFont(ofSize: 16)
        hours.textColor = .black
        temperatureHourly.text = "11°C"
        temperatureHourly.textColor = .black
        temperatureHourly.font = .boldSystemFont(ofSize: 16)
    }

}
