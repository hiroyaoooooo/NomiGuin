//
//  AddDrinkModel.swift
//  NomiGuin
//
//  Created by 中嶋裕也 on 2020/09/25.
//

import Foundation
import Firebase

protocol AddDrinkModelDelegate: class {
    func didGetData()
}

class AddDrinkModel {
    
    var ref: DatabaseReference!
    var nomiUser: NomiUser?
    weak var delegate: AddDrinkModelDelegate?
    var drinkables = Drinkables()
    
    func readData() {
        ref = Database.database().reference()
        
        let userID = Auth.auth().currentUser?.uid ?? ""
        ref.child("users").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let username = value?["username"] as? String ?? ""
            let totalAlcoholValue = value?["totalAlcoholValue"] as? Int ?? 0
            self.nomiUser = NomiUser(username: username, totalAlcoholValue: totalAlcoholValue)
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
}
