//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by Semih Emre ÜNLÜ on 26.09.2021.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var temperatureContainerView: UIView!
    @IBOutlet weak var hourlyWeatherContainerView: UIView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var temperatureViewHeightConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        buildTemperatureViewController()
        buildHourlyWeatherViewController()
        
        let locationManager = LocationManager.instance
        locationManager.delegate = self
        locationManager.requestLocation()
       
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 50)
    }
    
    private var temperatureViewController: WeatherTemperatureViewController!
    private var hourlyWeatherViewController: HourlyWeatherViewController!

    private func buildTemperatureViewController() {
        temperatureViewController = WeatherTemperatureViewController()
        if let view = temperatureViewController.view {
            view.frame = temperatureContainerView.bounds
            temperatureContainerView.addSubview(view)
        }
    }
    
    private func buildHourlyWeatherViewController() {
        hourlyWeatherViewController = HourlyWeatherViewController()
        if let view = hourlyWeatherViewController.view {
            view.frame = hourlyWeatherContainerView.bounds
            hourlyWeatherContainerView.addSubview(view)
        }
    }
    
    private func getWeather(latitude: Double, longitude: Double) {
        ClientNetworkService.instance.searchCity(latitude,
                                                 longitude: longitude) { [weak self] weather, error in
            guard let self = self,
                  let weather = weather else { return }
            self.temperatureViewController.setWeather(weather)
        }
    }
    
    private func getForecast(latitude: Double, longitude: Double) {
        ClientNetworkService.instance.hourlyWeather(latitude,
                                                    longitude: longitude) { [weak self] forecast, error in
            guard let self = self,
                  let forecast = forecast else { return }
            self.hourlyWeatherViewController.setForecast(forecast)
        }
    }
}

extension WeatherDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        
        temperatureViewHeightConstraint.constant = 175 - scrollView.contentOffset.y
    }
}

extension WeatherDetailViewController: LocationManagerDelegate {
    func lastLocationCoordinates(latitude: Double, longitude: Double) {
        getWeather(latitude: latitude, longitude: longitude)
        getForecast(latitude: latitude, longitude: longitude)
    }
}
