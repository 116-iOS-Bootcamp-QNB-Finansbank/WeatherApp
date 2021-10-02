//
//  HourlyWeatherViewController.swift
//  WeatherApp
//
//  Created by Semih Emre ÜNLÜ on 26.09.2021.
//

import UIKit
import Kingfisher

class HourlyWeatherViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        collectionView.register(HourlyWeatherCollectionViewCell.nib,
                                forCellWithReuseIdentifier: HourlyWeatherCollectionViewCell.nibName)
    }
    
    var forecast: ForecastDTO?
    
    func setForecast(_ forecast: ForecastDTO) {
        self.forecast = forecast
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension HourlyWeatherViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 80)
    }
}

extension HourlyWeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = forecast?.hourly.count ?? 0
        return count > 24 ? 24 : count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyWeatherCollectionViewCell.nibName,
                                                      for: indexPath) as! HourlyWeatherCollectionViewCell
        let item = forecast?.hourly[indexPath.item]
        cell.hourLabel.text = item?.dateInterval.convertDateIntervalToHourString()
        cell.tempLabel.text = String(format: "%.0f°", item?.temp.kelvinToCelcius() ?? 0.0)
        cell.iconImageView.kf.setImage(with: item?.weather.first?.iconURL)
        return cell
    }
}

