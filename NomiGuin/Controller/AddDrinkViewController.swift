
//
//  AddDrinkViewController.swift
//  NomiGuin
//
//  Created by Kento Katsumata on 2020/09/24.
//

import UIKit
import Firebase

class AddDrinkViewController: UIViewController {
    
    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    
    @IBAction func setData() {
        updateData()
    }
    
    func updateData() {
        let userName = Auth.auth().currentUser?.uid
        if let userName = userName {
            self.ref.child("users").child(userName).setValue(["totalAlcoholValue": 10])
        }
    }
}
