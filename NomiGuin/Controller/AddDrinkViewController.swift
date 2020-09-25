
//
//  AddDrinkViewController.swift
//  NomiGuin
//
//  Created by Kento Katsumata on 2020/09/24.
//

import UIKit
import Firebase

class AddDrinkViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var ref: DatabaseReference!
    var addDrinkModel = AddDrinkModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    
    @IBAction func setData() {
        updateData()
    }
    
    func updateData() {
        let userid = Auth.auth().currentUser?.uid
        if let userid = userid {
            self.ref.child("users").child(userid).setValue(["totalAlcoholValue": 10])
            let key = ref.child("users").child(userid).child("drinkedItem").childByAutoId()
            let post = ["id": 0]
            let childUpdates = ["/users/\(userid)/\(key)/": post]
            ref.updateChildValues(childUpdates)
        }
    }
}

extension AddDrinkViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("")
    }
}

extension AddDrinkViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return addDrinkModel.drinkables.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "test", for: indexPath)
        return cell
    }
    
}
extension AddDrinkViewController: AddDrinkModelDelegate {
    func didGetData() {
        
    }
}
