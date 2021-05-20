//
//  MainVC.swift
//  Weather
//
//  Created by Denis Kravets on 03.04.2021.
//

import UIKit
import CoreLocation

class MainVC: UIViewController {
    
    // MARK: IBOutlets

    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperature: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    // MARK: Properties
    
    var networkManager = NetworkManager()
    
    lazy var locationManager: CLLocationManager = {
        let location = CLLocationManager()
        location.delegate = self
        location.desiredAccuracy = kCLLocationAccuracyThreeKilometers // точность определения местоположения
        location.requestWhenInUseAuthorization()
        return location
    }()
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getWeatherOfTown()
        self.createRequestForLocation()
    }
    
    // MARK: IBActions
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        self.presentSearchAlertController(forTitle: "Название города", message: "Введите название города на английском языке", style: .alert) { [unowned self] city in
            self.networkManager.currentWeather(forRequestType: .cityName(city: city))
        }
    }
    
}



