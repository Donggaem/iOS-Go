//
//  WeatherViewController.swift
//  iOS Go
//
//  Created by 김동겸 on 2022/06/01.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var seachTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self
        seachTextField.delegate = self
    }
}

//MARK: - UITextFoeldDelegate

extension WeatherViewController: UITextFieldDelegate {
    
    @IBAction func seachPressed(_ sender: UIButton) {
        seachTextField.endEditing(true)
        print(seachTextField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        seachTextField.endEditing(true)
        print(seachTextField.text)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    //편집이 종료된 텍스트필드
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = seachTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        seachTextField.text = ""
    }
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController : WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
