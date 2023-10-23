//
//  ForecastTableViewCell.swift
//  WeatherApp
//
//  Created by Никита Суровцев on 15.10.23.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var imageLineBetweenMinAndMaxTemp: UIImageView!
    @IBOutlet weak var maxTempDay: UILabel!
    @IBOutlet weak var minTempWeekDay: UILabel!
    @IBOutlet weak var weekDayIcon: UIImageView!
    @IBOutlet weak var weekDay: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        weekDayIcon.contentMode = .scaleToFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
