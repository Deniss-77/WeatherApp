//
//  AlertController.swift
//  Weather
//
//  Created by Denis Kravets on 03.04.2021.
//

import UIKit

extension MainVC {
    
    // MARK: SearchAlertController
    
    func presentSearchAlertController(forTitle title: String, message: String, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) {
    
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Введите название города"
        }
        
        let search = UIAlertAction(title: "Поиск", style: .default, handler: { (action) in
            
            let searchTextField = alertController.textFields?.first
            guard let cityName = searchTextField?.text else { return }
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20") // позволяет вводить составное название города
                completionHandler(city)
            }
        })
        
        let cancel = UIAlertAction(title: "Закрыть", style: .cancel, handler: nil)
        
        alertController.addAction(search)
        alertController.addAction(cancel)
        
        present(alertController, animated: true)
    }
    
}
