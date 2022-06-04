//
//  WeatherManager.swift
//  iOS Go
//
//  Created by 김동겸 on 2022/06/04.
//

import Foundation

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=fc45ec4ae1da2103bb957efd4ef4cb6f&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
}
