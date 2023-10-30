//
//  WeatherCubesCollectionViewCell.swift
//  WeatherApp
//
//  Created by Никита Суровцев on 22.10.23.
//

import UIKit

class WeatherCubesCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var view: UIView!
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var dailyQuantity: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.borderWidth = 0.01
        view.layer.cornerRadius = 30
    }

}
