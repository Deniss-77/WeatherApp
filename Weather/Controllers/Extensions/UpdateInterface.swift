//
//  UpdateInterface.swift
//  Weather
//
//  Created by Denis Kravets on 03.04.2021.
//

import UIKit
 
extension MainVC {
    
    func getWeatherOfTown() {
        
        networkManager.completion = { [weak self] currentWeather in
            
            guard let self = self else { return }
            self.updateInterfaceWith(weather: currentWeather)
        }
    }
    
    // обновление IBOutlets согласно полученным данным по городу
    func updateInterfaceWith(weather: CurrentWeather) {
        
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString
            self.feelsLikeTemperature.text = weather.feelsLikeTemperatureString
            self.weatherImageView.image = UIImage(systemName: weather.systemIconNameString)
        }
    }
    
}
