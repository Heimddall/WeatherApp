//
//  ViewController.swift
//  WeatherApp
//
//  Created by Никита Суровцев on 23.09.23.
//

import UIKit
import Alamofire
import Foundation

enum WeatherRequestPath: String {
    case currentWeather = "/forecast.json"
}
class MainViewController: UIViewController, WeatherApiWorkerDelegate {
    
    private let apiWorker = WeatherApiWorker()
    var lastResponse: RealtimeWeatherResponse?
    
    let calendar = Calendar.current
    var dateComponents = DateComponents()
    let currentDate = Date()
    let dateFormatter = DateFormatter()
    
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    
    @IBOutlet var table : UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table.delegate = self
        self.table.dataSource = self
        
        apiWorker.delegate = self
        apiWorker.makeCurrentWeatherRequest()
        
        let weatherTableCellDetailsNib = UINib(nibName: "WeatherCubsTableViewCell", bundle: Bundle.main)
        table.register(weatherTableCellDetailsNib, forCellReuseIdentifier: "weatherCubesTableViewCell")
        
        let forecastTableViewCellNib = UINib(nibName: "ForecastTableViewCell", bundle: Bundle.main)
        table.register(forecastTableViewCellNib, forCellReuseIdentifier: "forecastTableViewCell")
        
        let hourlyTableViewCellNib = UINib(nibName: "HourlyTableViewCell", bundle: Bundle.main)
        table.register(hourlyTableViewCellNib, forCellReuseIdentifier: "hourlyTableViewCell")
        
        dateFormatter.locale = Locale(identifier: "en_US")
    }
    
    func gotRealtimeWeather(response: RealtimeWeatherResponse) {
        lastResponse = response
        locationLabel.text = lastResponse?.location.cityName
        
        if let info = lastResponse?.currentWeather {
            temperatureLabel.text = "\(String(describing: info.tempInCelsius))°C"
        }
        conditionLabel.text = lastResponse?.currentWeather.condition.textInfo
        
        
        DispatchQueue.main.async { [weak self] in
            self?.table.reloadSections(IndexSet(integer: 1), with: .automatic)
        }
    }
}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 3
        } else if section == 2 {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "24 hours weather"
        } else if section == 1 {
            return "5 days weather"
        } else if section == 2 {
            return "Some adittional data about now"
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "hourlyTableViewCell", for: indexPath) as? HourlyTableViewCell else {return UITableViewCell()}
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "forecastTableViewCell", for: indexPath) as? ForecastTableViewCell else { return UITableViewCell() }
            
            let days = indexPath.row
            dateComponents.day = days
            
                if let forecast = lastResponse?.forecastWeather.forecastday[days],
                   let nextDate = calendar.date(byAdding: dateComponents, to: currentDate),
                   let weekday = calendar.dateComponents([.weekday], from: nextDate).weekday {
                    
                    let weekdays = dateFormatter.weekdaySymbols
                    cell.weekDay.text = weekdays?[weekday - 1] ?? "Unknown"
                    
                    cell.minTempWeekDay.text = "\(forecast.dayWeather.minTempC)"
                    cell.maxTempDay.text = "\(forecast.dayWeather.maxTempC)"
                    
                    if let imageURL = URL(string: "https:\(forecast.dayWeather.dayCondition.iconUrl)") {
                        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
                            if let data = data, let image = UIImage(data: data) {
                                DispatchQueue.main.async {
                                    cell.weekDayIcon.image = image
                                }
                            } else {
                                print("Failed to load image: \(error?.localizedDescription ?? "Unknown error")")
                            }
                        }.resume()
                    }
                }
            return cell
        } else if indexPath.section == 2 {
            guard let  cell = tableView.dequeueReusableCell(withIdentifier: "weatherCubesTableViewCell", for: indexPath) as? WeatherCubsTableViewCell else {return UITableViewCell()}
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 150
        } else if indexPath.section == 1 {
            return 60
        } else if indexPath.section == 2 {
            return 500
        }
        return CGFloat()
    }
    
}
