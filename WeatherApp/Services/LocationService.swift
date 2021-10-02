//
//  LocationService.swift
//  WeatherApp
//
//  Created by Semih Emre ÜNLÜ on 2.10.2021.
//

import Foundation
import MapKit

protocol LocationManagerDelegate: NSObject {
    func lastLocationCoordinates(latitude: Double, longitude: Double)
}

class LocationManager: NSObject {
    static let instance = LocationManager()
    
    weak var delegate: LocationManagerDelegate?
    
    private lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        return locationManager
    }()
    
    func requestLocation() {
        if #available(iOS 14.0, *) {
            switch locationManager.authorizationStatus {
            case .authorized, .authorizedAlways, .authorizedWhenInUse:
                locationManager.startUpdatingLocation()
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            default:
                break
            }
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.last?.coordinate else { return }
        let latitude: Double = Double(coordinate.latitude)
        let longitude: Double = Double(coordinate.longitude)
        self.delegate?.lastLocationCoordinates(latitude: latitude, longitude: longitude)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if  #available(iOS 14.0, *),
            manager.authorizationStatus == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
}
