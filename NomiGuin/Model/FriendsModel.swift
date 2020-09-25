//
//  FriendsModel.swift
//  NomiGuin
//
//  Created by 中嶋裕也 on 2020/09/25.
//

import Foundation
import Firebase

protocol FriendsModelDelegate: class {
    func valueDidChange()
}

class FriendsModel {
    var ref: DatabaseReference!
    var nomiUserArray = [NomiUser]()
    
    weak var delegate: FriendsModelDelegate?

    func readData() {
        ref = Database.database().reference()
        
//        let userID = Auth.auth().currentUser?.uid
        ref.child("users").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            if let value = value {
                for element in value {
                    let nomiUserData = element.value as? NSDictionary
                    let username = nomiUserData?["username"] as? String ?? ""
                    let totalAlcoholValue = nomiUserData?["totalAlcoholValue"] as? Int ?? 0
                    let nomiUser = NomiUser(username: username, totalAlcoholValue: totalAlcoholValue)
                    self.nomiUserArray.append(nomiUser)
                }
                self.delegate?.valueDidChange()
            }
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
}
