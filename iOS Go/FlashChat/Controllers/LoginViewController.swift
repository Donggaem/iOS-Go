//
//  LoginViewController.swift
//  iOS Go
//
//  Created by 김동겸 on 2022/07/19.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let e = error {
                    print(e)
                }else {
                    self!.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
}
