//
//  TipResultViewController.swift
//  iOS Go
//
//  Created by 김동겸 on 2022/05/26.
//

import UIKit

class TipResultViewController: UIViewController {
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result = "0.0"
    var tip = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = result
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
        
    }
        @IBAction func recalculatePressed(_ sender: UIButton) {
            self.dismiss(animated: true, completion: nil)
        }
        
    }