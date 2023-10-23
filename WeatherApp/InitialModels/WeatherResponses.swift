//
//  WeatherResponses.swift
//  WeatherApp
//
//  Created by Никита Суровцев on 24.09.23.
//

import Foundation

struct RealtimeWeatherResponse: Codable {
    let location: WeatherLocation
    let currentWeather: WeatherInfo
    let forecastWeather: Forecast
    
    enum CodingKeys: String, CodingKey {
        case location       = "location"
        case currentWeather = "current"
        case forecastWeather = "forecast"
    }
}
