//
//  WeatherDTO.swift
//  WeatherApp
//
//  Created by Semih Emre ÜNLÜ on 26.09.2021.
//

import Foundation

// MARK: - WeatherDTO
struct WeatherDTO: Codable {
    let main: Main
    let name: String
}

// MARK: - Main
struct Main: Codable {
    let temperature: Double

    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
    }
}
