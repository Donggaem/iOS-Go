//
//  QuizzlerViewController.swift
//  iOS Go
//
//  Created by 김동겸 on 2022/05/16.
//

import UIKit

class QuizzlerViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let quiz = [
        ["Four + Two is equal to Six.", "True"],
        ["Five - Three is greater than One.", "True"],
        ["Three + Eight is less than Ten.", "False"]
    ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()

    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNumber][1]
        
        if userAnswer == actualAnswer{
            print("Right!")
        }else{
            print("Wrong!")
        }
        
        if questionNumber + 1 < quiz.count{
            questionNumber += 1
        
        }else {
            questionNumber = 0
        }
        
        updateUI()
    }
    
    func updateUI(){
        questionLabel.text = quiz[questionNumber][0]

    }
    

}

