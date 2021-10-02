//
//  WeatherTemperatureViewController.swift
//  WeatherApp
//
//  Created by Semih Emre ÜNLÜ on 26.09.2021.
//

import UIKit

class WeatherTemperatureViewController: UIViewController {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    
    private var weather: WeatherDTO! {
        didSet {
            DispatchQueue.main.async {
                self.nameLabel.text = self.weather.name
                let temperature = String(Int(self.weather.main.temperature.kelvinToCelcius()))
                self.temperatureLabel.text = temperature + "°"
            }
        }
    }
    
    func setWeather(_ weather: WeatherDTO) {
        self.weather = weather
    }
}
