//
//  Magic8ballViewController.swift
//  iOS Go
//
//  Created by 김동겸 on 2022/05/11.
//

import UIKit

class Magic8ballViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    @IBAction func AskButtonPressed(_ sender: UIButton) {
        let ballArray = [#imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball2.png"), #imageLiteral(resourceName: "ball3.png"), #imageLiteral(resourceName: "ball4.png"), #imageLiteral(resourceName: "ball5.png")]
        
        imageView.image = ballArray.randomElement()
    }
    

}
