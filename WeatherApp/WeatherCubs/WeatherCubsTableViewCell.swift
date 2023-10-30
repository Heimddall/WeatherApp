//
//  WeatherCubsTableViewCell.swift
//  WeatherApp
//
//  Created by Никита Суровцев on 22.10.23.
//

import UIKit

class WeatherCubsTableViewCell: UITableViewCell, WeatherApiWorkerDelegate {
    
    private let apiWorker = WeatherApiWorker()
    var lastResponseCubes: RealtimeWeatherResponse?
    
    let cubesLabels = ["Max wind, mph", "Total precipitation, mm", "Visibility, km", "Humidity, %", "Chance of rain, %", "UV"]
    
    var maxWindKph = ""
    var maxWindMph = ""
    var totalPrecipitationMm = ""
    var totalPrecipitationIn = ""
    var visibilityKm = ""
    var visibilityMiles = ""
    var humidity = ""
    var dailyChanceOfRain = ""
    var uvFactor = ""
    
    var dailyWeatherValues:[String] = []
    
    func gotRealtimeWeather(response: RealtimeWeatherResponse) {
        lastResponseCubes = response
        
        if let dailyWeather = lastResponseCubes?.currentWeather {
            maxWindKph = String(dailyWeather.windInKilometerPerHour)
            maxWindMph = String(dailyWeather.windInMilesPerHour)
            totalPrecipitationMm = String(dailyWeather.precipitationInMilliMeters)
            totalPrecipitationIn = String(dailyWeather.precipitationInInches)
            visibilityKm = String(dailyWeather.visibleInKiloMeters)
            visibilityMiles = String(dailyWeather.visibleInMiles)
            humidity = String(dailyWeather.humidity)
            uvFactor = String(dailyWeather.uvFactor)
        }
        
        if let forecast = lastResponseCubes?.forecastWeather.forecastday[0]{
            dailyChanceOfRain = String(forecast.dayWeather.dailyChanceOfRain)
        }
        
        dailyWeatherValues.append(contentsOf: [maxWindKph, totalPrecipitationMm, visibilityKm, humidity, dailyChanceOfRain, uvFactor])
        
        print("\(dailyWeatherValues) FUCCKNJLDHLKJDBLJMBDLJBFL<NBDLJBFLJFBLMNB<MDBLJDHLK:CBNLNLHF:KJHN:MCN>JDHLKJFH:KFJN><XNJDHLKJFB>MCB<MJDBLJHFLJFBCB<>JDBJ<FHB<FB<MNFBJHFLFJB>F")
        
        DispatchQueue.main.async { [weak self] in
            self?.cubesCollectionView.reloadData()
        }
    }
    
    

    @IBOutlet weak var cubesCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let weatherCubesCollectionViewCellNib = UINib(nibName: "WeatherCubesCollectionViewCell" , bundle: Bundle.main)
        cubesCollectionView.register(weatherCubesCollectionViewCellNib, forCellWithReuseIdentifier: "weatherCube")
        
        cubesCollectionView.dataSource = self
        cubesCollectionView.delegate = self
        
        apiWorker.delegate = self
        apiWorker.makeCurrentWeatherRequest()
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        cubesCollectionView.collectionViewLayout = layout
        
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
        
        if indexPath.row < dailyWeatherValues.count {
            cell.dailyQuantity.text = cubesLabels[indexPath.row]
            cell.value.text = dailyWeatherValues[indexPath.row]
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.frame.width - 50) / 2
        let cellHeight = 130.0
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
