//
//  WeatherApiWorker.swift
//  WeatherApp
//
//  Created by Никита Суровцев on 24.09.23.
//

import Foundation
import Alamofire

class WeatherApiWorker {
    
    private let baseUrl = "weatherapi-com.p.rapidapi.com"
    private let apiKey =  "c3f4615803msh2488298f257258bp19ce9bjsn0947e59d0213"
    
    public weak var delegate: WeatherApiWorkerDelegate?
    
    func makeCurrentWeatherRequest() {
        
        let urlComponents = makeUrlComponents(for: .currentWeather, place: "Minsk")
        let headers: HTTPHeaders = HTTPHeaders([
            "X-RapidAPI-Key": self.apiKey,
            "X-RapidAPI-Host": self.baseUrl
        ])
        
        AF.request(urlComponents, headers: headers).response { [weak self] response in
            
            guard response.error == nil else {
                print("WeatherApiWorker: Request error")
                self?.delegate?.gotError(description: "Request error")
                return
            }
            
            guard let data = response.data else {
                print("WeatherApiWorker: Response error")
                self?.delegate?.gotError(description: "Response error")
                return
            }
            
            guard (200..<300).contains(response.response?.statusCode ?? 0) else {
                print("WeatherApiWorker: Wrong Status code")
                self?.delegate?.gotError(description: "Wrong Status error")
                return
            }
            
            guard let responseString = String(data: data, encoding: .utf8) else {
                print("WeatherApiWorker: Worng response encoding")
                self?.delegate?.gotError(description: "Worng response encoding")
                return
            }
            
            print("WeatherApiWorker: \(responseString)")
            
            guard let responseModel = try? JSONDecoder().decode(RealtimeWeatherResponse.self, from: data) else {
                print("WeatherApiWorker: Decode error")
                self?.delegate?.gotError(description: "Decode error")
                return
            }
            
            print("WeatherApiWorker: \(responseModel)")
            self?.delegate?.gotRealtimeWeather(response: responseModel)
        }
    }
    
    private func makeUrlComponents(for weatherType: WeatherRequestPath, place: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = self.baseUrl
        components.path = weatherType.rawValue
        components.queryItems = [URLQueryItem(name: "q", value: place)]
//        components.queryItems = [URLQueryItem(name: "days", value: "3")]
        
        return components
    }
    
}
