//
//  RegisterUserViewController.swift
//  NomiGuin
//
//  Created by Kento Katsumata on 2020/09/24.
//

import UIKit
import Firebase

class RegisterUserViewController: UIViewController {
        
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerBtnWasPressed() {
        guard let userName = userNameTextField.text else {
            displayAlert(title: "ユーザーネームが入力されていません", message: "")
            return
        }
        guard let emailAddress = emailAddressTextField.text else {
            displayAlert(title: "メールアドレスが入力されていません", message: "")
            return
        }
        guard let password = passwordTextField.text else {
            displayAlert(title: "パスワードが入力されていません", message: "")
            return
        }
        FirebaseAuthAPI().registerUser(username: userName, email: emailAddress, password: password) { (status) in
            if status{
                self.performSegue(withIdentifier: "TO_FRIENDSVC", sender: nil)
            }else{
                self.displayAlert(title: "エラー", message: "サーバーと接続することができませんでした")
            }
        }
    }
    
    func displayAlert(title: String, message: String) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle:  UIAlertController.Style.alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
            (action: UIAlertAction!) -> Void in
            print("OK")
        })
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
}
