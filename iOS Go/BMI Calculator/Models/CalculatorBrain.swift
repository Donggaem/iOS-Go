//
//  CalculatorBrain.swift
//  iOS Go
//
//  Created by 김동겸 on 2022/05/22.
//

import Foundation

struct CalculatorBrain {
   
    var bmi: Float = 0.0
    
    func getBMIValue() -> String{
        let bmiTo1DecimalPlace = String(format: "%1.f", bmi)
        return bmiTo1DecimalPlace
    }
    
    mutating func calculateBMI(height: Float, weight: Float){
        bmi = weight / (height * height)
    }
    
}
