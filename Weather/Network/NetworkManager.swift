//
//  NetworkManager.swift
//  Weather
//
//  Created by Denis Kravets on 03.04.2021.
//

import Foundation
import CoreLocation

class NetworkManager {
    
    // запрос по названию города; запрос по координатам города
    enum RequestType {
        case cityName(city: String)
        case coordinate(latitude: CLLocationDegrees, longitude: CLLocationDegrees)
    }
    
    var completion: ((CurrentWeather) -> Void)?
    
    // функция получения температуры по названию города или местоположению
    func currentWeather(forRequestType requestType: RequestType) {
        
        var urlString = ""
        
        switch requestType {
        case .cityName(let city):
            urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(appid)&units=metric"
        case .coordinate(let latitude, let longitude):
            urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(appid)&units=metric"
        }
        
        performRequest(withURLString: urlString)
    }
    
    // обработка данных в формате JSON
    fileprivate func parseJSON(withData data: Data) -> CurrentWeather? {
        
        let decoder = JSONDecoder()
        
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else { return nil }
            return currentWeather
        } catch let error {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    fileprivate func performRequest(withURLString urlString: String) {
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                if let currentWeather = self.parseJSON(withData: data) {
                    self.completion?(currentWeather)
                }
            }
        }
        task.resume()
    }
   
}
