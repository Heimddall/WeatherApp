//
//  ViewController.swift
//  WeatherApp
//
//  Created by Никита Суровцев on 23.09.23.
//

import UIKit
import Alamofire

enum WeatherRequestPath: String {
    case currentWeather = "/forecast.json"
}
class MainViewController: UIViewController, WeatherApiWorkerDelegate {
    
    private let apiWorker = WeatherApiWorker()
    
    var lastResponse: RealtimeWeatherResponse?
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    
    
    @IBOutlet var table : UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table.delegate = self
        self.table.dataSource = self
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        collectionView.collectionViewLayout = layout
        
        apiWorker.delegate = self
        apiWorker.makeCurrentWeatherRequest()
        
        let weatherDetailsNib = UINib(nibName: "WeatherCubesForDetailsCollectionViewCell", bundle: Bundle.main)
        collectionView.register(weatherDetailsNib, forCellWithReuseIdentifier: "weatherCubesForDetailsCollectionViewCell")
        
        let forecastTableViewCellNib = UINib(nibName: "ForecastTableViewCell", bundle: Bundle.main)
        table.register(forecastTableViewCellNib, forCellReuseIdentifier: "forecastTableViewCell")
        
        let hourlyTableViewCellNib = UINib(nibName: "HourlyTableViewCell", bundle: Bundle.main)
        table.register(hourlyTableViewCellNib, forCellReuseIdentifier: "hourlyTableViewCell")
        
    }
    
    func gotRealtimeWeather(response: RealtimeWeatherResponse) {
        lastResponse = response
        locationLabel.text = lastResponse?.location.cityName
        
        if let info = lastResponse?.currentWeather {
            temperatureLabel.text = "\(String(describing: info.tempInCelsius))°C"
        }
        
        conditionLabel.text = lastResponse?.currentWeather.condition.textInfo
            
        }
    }


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 5
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "24 hours weather"
        } else if section == 1 {
            return "5 days weather"
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "hourlyTableViewCell", for: indexPath) as? HourlyTableViewCell else {return UITableViewCell()}
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "forecastTableViewCell", for: indexPath) as? ForecastTableViewCell else {return UITableViewCell()}
        return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.section != 0 else {
            return 150
        }
        return 60
    }
    }

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCubesForDetailsCollectionViewCell", for: indexPath) as? WeatherCubesForDetailsCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.frame.width - 60) / 2
        let cellHeight = 150.0
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
    

