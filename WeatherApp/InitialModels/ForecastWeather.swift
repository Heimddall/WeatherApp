//
//  ForecastWeather.swift
//  WeatherApp
//
//  Created by Никита Суровцев on 14.10.23.
//

import Foundation

//"forecast": {
//    "forecastday": [
//        {
//            "date": "2023-10-14",
//            "date_epoch": 1697241600,
//            "day": {
//                "maxtemp_c": 21.3,
//                "maxtemp_f": 70.4,
//                "mintemp_c": 10.8,
//                "mintemp_f": 51.4,
//                "avgtemp_c": 15.7,
//                "avgtemp_f": 60.3,
//                "maxwind_mph": 20.8,
//                "maxwind_kph": 33.5,
//                "totalprecip_mm": 1.49,
//                "totalprecip_in": 0.06,
//                "totalsnow_cm": 0.0,
//                "avgvis_km": 9.6,
//                "avgvis_miles": 5.0,
//                "avghumidity": 72.0,
//                "daily_will_it_rain": 1,
//                "daily_chance_of_rain": 96,
//                "daily_will_it_snow": 0,
//                "daily_chance_of_snow": 0,
//                "condition": {
//                    "text": "Patchy rain possible",
//                    "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
//                    "code": 1063
//                },
//                "uv": 4.0
//            },
//            "astro": {
//                "sunrise": "07:35 AM",
//                "sunset": "06:16 PM",
//                "moonrise": "06:59 AM",
//                "moonset": "06:10 PM",
//                "moon_phase": "New Moon",
//                "moon_illumination": "1",
//                "is_moon_up": 0,
//                "is_sun_up": 0
//            },
//            "hour": [
//                {
//                    "time_epoch": 1697230800,
//                    "time": "2023-10-14 00:00",
//                    "temp_c": 10.8,
//                    "temp_f": 51.4,
//                    "is_day": 0,
//                    "condition": {
//                        "text": "Patchy rain possible",
//                        "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
//                        "code": 1063
//                    }
//                },
//                {
//                    "time_epoch": 1697234400,
//                    "time": "2023-10-14 01:00",
//                    "temp_c": 11.6,
//                    "temp_f": 53.0,
//                    "is_day": 0,
//                    "condition": {
//                        "text": "Cloudy",
//                        "icon": "//cdn.weatherapi.com/weather/64x64/night/119.png",
//                        "code": 1006
//                    },
//                },
//                {
//                    "time_epoch": 1697238000,
//                    "time": "2023-10-14 02:00",
//                    "temp_c": 11.7,
//                    "temp_f": 53.0,
//                    "is_day": 0,
//                    "condition": {
//                        "text": "Cloudy",
//                        "icon": "//cdn.weatherapi.com/weather/64x64/night/119.png",
//                        "code": 1006
//                    },
//                }
//
//            ]
//        }
//    ]
//}
//}
//
//struct Forecast: Codable {
//    let forecastThreeDays: [ForecastDay]
//    
//    enum CodingKeys: String, CodingKey {
//      case forecastThreeDays = "forecast"
//    }
//}
//
//struct ForecastDay: Codable {
//    let date: String
//    let dateTampStamp: String
//    let dayWeather: DayWeather
//    let hourWeather: [HourlyWeather]
//    
//    enum CodingKeys: String, CodingKey {
//        case date = "date"
//        case dateTampStamp = "ate_epoch"
//        case dayWeather = "day"
//        case hourWeather = "hour"
//    }
//}
//
//struct DayWeather: Codable {
//    let maxTempC: Double
//    let maxTempF: Double
//    let minTempC: Double
//    let minTempF: Double
//    let dayCondition: DayConditionWeather
//    
//    enum CodingKeys: String, CodingKey {
//        case maxTempC = "maxtemp_c"
//        case maxTempF = "maxtemp_f"
//        case minTempC = "mintemp_c"
//        case minTempF = "mintemp_F"
//        case dayCondition = "condition"
//    }
//}
//
//struct DayConditionWeather: Codable {
//    let textInfo: String
//    let iconUrl: String
//    let weatherCode: Int
//    enum CodingKeys: String, CodingKey {
//        case textInfo    = "text"
//        case iconUrl     = "icon"
//        case weatherCode = "code"
//    }
//}
//
//struct HourlyWeather: Codable {
//    let timeHour: String
//    let hourlyTempC: Double
//    let hourlyTempF: Double
//    let hourlyCondition: HourlyCondition
//    
//    enum CodingKeys: String, CodingKey {
//        case timeHour = "time"
//        case hourlyTempC = "temp_c"
//        case hourlyTempF = "temp_f"
//        case hourlyCondition = "condition"
//    }
//}
//
//struct HourlyCondition: Codable {
//    let hourlyTextInfo: String
//    let hourlyIconUrl: String
//    
//    enum CodingKeys: String, CodingKey {
//        case hourlyTextInfo = "text"
//        case hourlyIconUrl = "icon"
//    }
//}

//                    "time_epoch": 1697230800,
//                    "time": "2023-10-14 00:00",
//                    "temp_c": 10.8,
//                    "temp_f": 51.4,
//                    "is_day": 0,
//                    "condition": {
//                        "text": "Patchy rain possible",
//                        "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
//                        "code": 1063
//                    }
//"date": "2023-10-14",
//            "date_epoch": 1697241600,
//            "day": {
//                "maxtemp_c": 21.3,
//                "maxtemp_f": 70.4,
//                "mintemp_c": 10.8,
//                "mintemp_f": 51.4,
//                "maxwind_mph": 20.8,
//                "maxwind_kph": 33.5,
//                "totalprecip_mm": 1.49,
//                "totalprecip_in": 0.06,
//                "totalsnow_cm": 0.0,
//                "avgvis_km": 9.6,
//                "avgvis_miles": 5.0,
//                "avghumidity": 72.0,
//                "daily_will_it_rain": 1,
//                "daily_chance_of_rain": 96,
//                "daily_will_it_snow": 0,
//                "daily_chance_of_snow": 0,
//                "condition": {
//                    "text": "Patchy rain possible",
//                    "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
//                    "code": 1063
//                },
//                "uv": 4.0
