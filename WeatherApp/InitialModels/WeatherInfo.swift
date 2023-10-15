//
//  WeatherInfo.swift
//  WeatherApp
//
//  Created by Никита Суровцев on 24.09.23.
//

import Foundation

//{
//    "current": {
//        "last_updated_epoch": 1695503700,
//        "last_updated": "2023-09-24 00:15",
//        "temp_c": 21.0,
//        "temp_f": 69.8,
//        "is_day": 0,
//        "condition": {
//            "text": "Clear",
//            "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png",
//            "code": 1000
//        },
//        "wind_mph": 16.1,
//        "wind_kph": 25.9,
//        "wind_degree": 170,
//        "wind_dir": "S",
//        "pressure_mb": 1015.0,
//        "pressure_in": 29.97,
//        "precip_mm": 0.0,
//        "precip_in": 0.0,
//        "humidity": 64,
//        "cloud": 0,
//        "feelslike_c": 21.0,
//        "feelslike_f": 69.8,
//        "vis_km": 10.0,
//        "vis_miles": 6.0,
//        "uv": 1.0,
//        "gust_mph": 7.2,
//        "gust_kph": 11.6
//    }
//}

struct WeatherInfo: Codable {
    let lastUpdateTimestamp: UInt64
    let lastUpdateTimeFormatted: String
    let tempInCelsius: Double
    let tempInFahrenheit: Double
    let condition: WeatherCondition
    let windInMilesPerHour: Double
    let windInKilometerPerHour: Double
    let windInDegree: Int
    let windDirection: String
    let pressureInMilliBars: Double
    let pressureInInches: Double
    let precipitationInMilliMeters: Double
    let precipitationInInches: Double
    let humidity: Int
    let cloud: Int
    let feelsLikeInCelsius: Double
    let feelsLikeInFahrenheit: Double
    let visibleInKiloMeters: Double
    let visibleInMiles: Double
    let uvFactor: Double
    let gustInMilesPerHour: Double
    let gustInKilometerPerHour: Double
    
    private let isDayRaw: Int
    var isDay: Bool {
        get {
            Bool(isDayRaw)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case lastUpdateTimestamp        = "last_updated_epoch"
        case lastUpdateTimeFormatted    = "last_updated"
        case tempInCelsius              = "temp_c"
        case tempInFahrenheit            = "temp_f"
        case isDayRaw                   = "is_day"
        case condition                  = "condition"
        case windInMilesPerHour         = "wind_mph"
        case windInKilometerPerHour     = "wind_kph"
        case windInDegree               = "wind_degree"
        case windDirection              = "wind_dir"
        case pressureInMilliBars        = "pressure_mb"
        case pressureInInches           = "pressure_in"
        case precipitationInMilliMeters = "precip_mm"
        case precipitationInInches      = "precip_in"
        case humidity                   = "humidity"
        case cloud                      = "cloud"
        case feelsLikeInCelsius         = "feelslike_c"
        case feelsLikeInFahrenheit       = "feelslike_f"
        case visibleInKiloMeters        = "vis_km"
        case visibleInMiles             = "vis_miles"
        case uvFactor                   = "uv"
        case gustInMilesPerHour         = "gust_mph"
        case gustInKilometerPerHour     = "gust_kph"
    }
}

/*
 Ex.:
 "condition": {
     "text": "Light rain",
     "icon": "//cdn.weatherapi.com/weather/64x64/night/296.png",
     "code": 1183
 }
 */
struct WeatherCondition: Codable {
    let textInfo: String
    let iconUrl: String
    let weatherCode: Int
    enum CodingKeys: String, CodingKey {
        case textInfo    = "text"
        case iconUrl     = "icon"
        case weatherCode = "code"
    }
}
