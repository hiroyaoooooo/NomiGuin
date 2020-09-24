//
//  RegisterUserViewController.swift
//  NomiGuin
//
//  Created by Kento Katsumata on 2020/09/24.
//

import UIKit

class RegisterUserViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var mailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerBtnWasPressed() {
        FirebaseAuthAPI().registerUser(username: userNameTextField.text!, email: mailAddressTextField.text!, password: passwordTextField.text!)
    }
    
}
