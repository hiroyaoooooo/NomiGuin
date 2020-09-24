//
//  RegisterUserViewController.swift
//  NomiGuin
//
//  Created by Kento Katsumata on 2020/09/24.
//

import UIKit
import Firebase

class RegisterUserViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var mailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()


        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerBtnWasPressed() {
        Auth.auth().createUser(withEmail: mailAddressTextField.text!, password: passwordTextField.text!) { (authResult, error) in
            if let err = error{
                print("ERROR: \(err)")
            }else{
                guard let userID = authResult?.user.uid else { return }
                self.ref.child("users").child(userID).setValue(["username": self.userNameTextField.text!, "totalAlcoholValue": 0])
            }
        }
    }
    
}
