//
//  FirebaseAuthAPI.swift
//  NomiGuin
//
//  Created by Kento Katsumata on 2020/09/24.
//

import Foundation
import Firebase

class FirebaseAuthAPI{
    
    var ref: DatabaseReference!
    
    func registerUser(username:String, email: String, password: String){
        ref = Database.database().reference()
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let err = error{
                print("ERROR: \(err)")
            }else{
                guard let userID = authResult?.user.uid else { return }
                self.ref.child("users").child(userID).setValue(["username": username, "totalAlcoholValue": 0])
                
                
                //ここでセグエー
            }
        }
    }
}
