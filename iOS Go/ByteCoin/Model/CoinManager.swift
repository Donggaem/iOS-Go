//
//  CoinManger.swift
//  iOS Go
//
//  Created by 김동겸 on 2022/06/18.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "AABF4D53-65A2-44BB-8471-1313E77A09E0"
    
    func getCoinPrice(for currency: String){
        
    }
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(currency: String) {
        
        
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        
        if let url = URL(string: urlString) {
            
            
            let session = URLSession(configuration: .default)
            
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                let dataAsString = String(data: data!, encoding: .utf8)
                print(dataAsString)
                
            }
            
            task.resume()
        }
    }
}
