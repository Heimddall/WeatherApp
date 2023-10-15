//
//  WeatherApiWorkerDelegate.swift
//  WeatherApp
//
//  Created by Никита Суровцев on 24.09.23.
//

import Foundation

protocol WeatherApiWorkerDelegate: AnyObject {
    func gotRealtimeWeather(response: RealtimeWeatherResponse)
    func gotError(description: String)
}

extension WeatherApiWorkerDelegate {
    func gotError(description: String) { }
}
