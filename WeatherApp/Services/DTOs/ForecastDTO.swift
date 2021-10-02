//
//  HourlyWeatherDTO.swift
//  WeatherApp
//
//  Created by Semih Emre ÜNLÜ on 26.09.2021.
//

import Foundation

// MARK: - ForecastDTO
struct ForecastDTO: Codable {
    let hourly: [Current]
}

// MARK: - Current
struct Current: Codable {
    let dateInterval: Double
    let temp: Double
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case dateInterval = "dt"
        case temp, weather
    }
}

// MARK: - Weather
struct Weather: Codable {
    let icon: String
    
    var iconURL: URL? {
        let urlString = "https://openweathermap.org/img/wn/\(icon)@2x.png"
        return URL(string: urlString)
    }
}
