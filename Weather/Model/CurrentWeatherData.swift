//
//  CurrentWeatherData.swift
//  Weather
//
//  Created by Denis Kravets on 03.04.2021.
//

import Foundation

struct CurrentWeatherData: Codable {
    
    let name: String
    let main: Main
    let weather: [Weather]
    
}

// вид температуры
struct Main: Codable {
    let temp: Double
    let feels_like: Double
}

// вид погоды по id
struct Weather: Codable {
    let id: Int
}
