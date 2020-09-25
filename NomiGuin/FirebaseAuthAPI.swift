//
//  FirebaseAuthAPI.swift
//  NomiGuin
//
//  Created by Kento Katsumata on 2020/09/25.
//

import Foundation
import Firebase
import FirebaseAuth

class FirebaseAuthAPI {
    
    func registerUser(username:String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        var ref: DatabaseReference!
        ref = Database.database().reference()

        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let err = error{
                print("ERROR: \(err)")
                completion(false)
            }else{
                guard let userID = authResult?.user.uid else { return }
                ref.child("users").child(userID).setValue(["username": username, "totalAlcoholValue": 0])
                completion(true)
            }
        }
    }
}
