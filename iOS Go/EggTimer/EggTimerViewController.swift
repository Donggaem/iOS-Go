//
//  EggTimerViewController.swift
//  iOS Go
//
//  Created by 김동겸 on 2022/05/14.
//

import UIKit
import AVFoundation

class EggTimerViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var player: AVAudioPlayer!
    
    let eggTimes = ["Soft": 3, "Medium": 420, "Hard": 720 ]
    var timer = Timer()
    var totalTime = 0
    var secondPressed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondPressed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if(secondPressed < totalTime) {
            
            secondPressed += 1
            progressBar.progress = Float(secondPressed) / Float(totalTime)

        }else{
            timer.invalidate()
            titleLabel.text = "Done"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                        player = try! AVAudioPlayer(contentsOf: url!)
                        player.play()
        }
    }
}
