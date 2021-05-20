//
//  CoreLocation.swift
//  Weather
//
//  Created by Denis Kravets on 03.04.2021.
//

import Foundation
import CoreLocation

// MARK: CLLocationManagerDelegate

extension MainVC: CLLocationManagerDelegate {
    
    // определение города на основании местоположения пользователя
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return }
        
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        networkManager.currentWeather(forRequestType: .coordinate(latitude: latitude, longitude: longitude))
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    // запрос на использование геолокации пользователя
    func createRequestForLocation() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
        }
    }
    
}
