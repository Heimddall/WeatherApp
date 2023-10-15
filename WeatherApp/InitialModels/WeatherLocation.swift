//
//  WeatherLocation.swift
//  WeatherApp
//
//  Created by Никита Суровцев on 24.09.23.
//

import Foundation

struct WeatherLocation: Codable {
    let cityName: String
    let stateName: String
    let countryName: String
    let latitude: Double
    let longitude: Double
    let timeZone: String
    let localTimestamp: UInt64
    let localTimeFormatted: String
    
    enum CodingKeys: String, CodingKey {
        case cityName           = "name"
        case stateName          = "region"
        case countryName        = "country"
        case latitude           = "lat"
        case longitude          = "lon"
        case timeZone           = "tz_id"
        case localTimestamp     = "localtime_epoch"
        case localTimeFormatted = "localtime"
    }
}
