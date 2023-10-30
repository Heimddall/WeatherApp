//
//  ValuesAdapter.swift
//  WeatherApp
//
//  Created by Никита Суровцев on 29.10.23.
//

import Foundation

class ValuesAdapter {
    private let mmHgConversionCoefficient = 0.750063755419211
    
    func getTemperature(for info: WeatherInfo, with settings: Settings) -> String {
        switch settings.temperature {
        case .celsius:
            return "\(info.tempInCelsius) \(TemperatureType.celsius.rawValue)"
        case .fahrenheit:
            return "\(info.tempInFahrenheit) \(TemperatureType.fahrenheit.rawValue)"
        }
        
    }
    
    func getWindVelocity(for info: WeatherInfo, with settings: Settings) -> String {
        switch settings.velocity {
        case .mph:
            return "\(info.windInMilesPerHour) \(VelocityType.mph.rawValue)"
        case .kph:
            return "\(info.windInKilometerPerHour) \(VelocityType.kph.rawValue)"
        case .mps:
            return "\(info.windInKilometerPerHour / 3.6) \(VelocityType.mps.rawValue)"
        }
    }
    
    func getPressure(for info: WeatherInfo, with settings: Settings) -> String {
        switch settings.pressure {
        case .mmHg:
            return "\(info.pressureInMilliBars * mmHgConversionCoefficient) \(PressureType.mmHg.rawValue)"
        case .mb:
            return "\(info.pressureInMilliBars) \(PressureType.mb.rawValue)"
        case .inches:
            return "\(info.pressureInInches) \(PressureType.inches.rawValue)"
        }
    }
}
