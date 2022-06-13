//
//  WeatherData.swift
//  iOS Go
//
//  Created by 김동겸 on 2022/06/09.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
