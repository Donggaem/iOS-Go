//
//  WeatherViewController.swift
//  iOS Go
//
//  Created by 김동겸 on 2022/06/01.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var seachTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seachTextField.delegate = self
    }

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
