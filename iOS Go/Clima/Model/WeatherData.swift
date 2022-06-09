//
//  WeatherData.swift
//  iOS Go
//
//  Created by 김동겸 on 2022/06/09.
//

import Foundation

struct WeatherData: Decodable{
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
}
