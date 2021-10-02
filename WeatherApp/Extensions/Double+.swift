//
//  Double+.swift
//  WeatherApp
//
//  Created by Semih Emre ÜNLÜ on 26.09.2021.
//

import Foundation

extension Double {
    func kelvinToCelcius() -> Double {
        let kelvinZeroInCelcius: Double = 273
        return self - kelvinZeroInCelcius
    }
    
    func convertDateIntervalToHourString() -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:00"
        return dateFormatter.string(from: date)
    }
}
