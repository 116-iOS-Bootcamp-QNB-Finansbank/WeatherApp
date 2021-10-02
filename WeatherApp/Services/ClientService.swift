//
//  ClientService.swift
//  WeatherApp
//
//  Created by Semih Emre ÜNLÜ on 26.09.2021.
//

import Foundation

class ClientNetworkService {
    private let searchCityEndpoint = "weather?lat=%d&lon=%d"
    private let hourlyWeather = "onecall?lat=%d&lon=%d&exclude=minutely,daily"
    
    static let instance = ClientNetworkService()
    
    private let networkService = NetworkService.instance
    
    func searchCity(_ latitude: Double,
                    longitude: Double,
                    completion: @escaping (WeatherDTO?, Error?) -> Void) {
        let urlString = String(format: searchCityEndpoint, latitude, longitude)
        networkService.get(from: urlString, completion: completion)
    }
    
    func hourlyWeather(_ latitude: Double,
                       longitude: Double,
                       completion: @escaping (ForecastDTO?, Error?) -> Void) {
        let urlString = String(format: hourlyWeather, latitude, longitude)
        networkService.get(from: urlString, completion: completion)

    }
}
