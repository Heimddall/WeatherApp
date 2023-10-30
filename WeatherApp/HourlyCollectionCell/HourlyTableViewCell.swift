//
//  HourlyTableViewCell.swift
//  WeatherApp
//
//  Created by Никита Суровцев on 8.10.23.
//

import UIKit

class HourlyTableViewCell: UITableViewCell, WeatherApiWorkerDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let apiWorker = WeatherApiWorker()
    var lastResponseForecast: RealtimeWeatherResponse?
    var hourlyTemp = [Double]()
    var hourlyImage = [String]()
    
    func gotRealtimeWeather(response: RealtimeWeatherResponse) {
        lastResponseForecast = response
        
        if let forecast = lastResponseForecast?.forecastWeather.forecastday[0]{
             hourlyTemp = forecast.hourlyWeather.map { HourlyWeather in
                return HourlyWeather.hourlyTempC
            }
       
            hourlyImage = forecast.hourlyWeather.map{ HourlyWeather in
                return HourlyWeather.hourlyCondition.hourlyIconUrl
            }
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.hourlyCollectionView.reloadData()
        }
    }
    
    @IBOutlet weak var hourlyCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let hourlyCollectionViewCellNib = UINib(nibName: "HourlyCollectionViewCell", bundle: Bundle.main)
        hourlyCollectionView.register(hourlyCollectionViewCellNib, forCellWithReuseIdentifier: "hourlyCollectionViewCell")
        
        hourlyCollectionView.dataSource = self
        hourlyCollectionView.delegate = self
        
        apiWorker.delegate = self
        apiWorker.makeCurrentWeatherRequest()
        
        setupScrollDirection()
        
        DispatchQueue.main.async { [weak self] in
            self?.hourlyCollectionView.reloadData()
        }
        
        collectionView.backgroundColor = .clear
        
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
        let hour = indexPath.row
        
        cell.hours.text = "\(hour):00"
        
        if hourlyTemp.indices.contains(hour) {
                cell.temperatureHourly.text = "\(hourlyTemp[hour])"
            } else {
                cell.temperatureHourly.text = "N/A"
            }
        
        if hourlyImage.indices.contains(hour) {
                let imageURLString = "https:" + hourlyImage[hour]
                if let imageURL = URL(string: imageURLString) {
                    URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
                        if let data = data, let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                cell.imageHourly.image = image
                            }
                        } else {
                            print("Failed to load image: \(error?.localizedDescription ?? "Unknown error")")
                        }
                    }.resume()
                }
            } else {
                cell.imageHourly.image = nil
            }

            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = 90
        let cellHeight = 150
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

