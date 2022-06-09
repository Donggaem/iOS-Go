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
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        
        //1. Create a URL
        if let url = URL(string: urlString){
            
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            //4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        
        let decoder = JSONDecoder()
        do{
            let decodeData =  try decoder.decode(WeatherData.self, from: weatherData)
            print(decodeData.weather[0].description)
        } catch {
            print(error)
        }
    }
    
}
