//
//  FriendsViewController.swift
//  NomiGuin
//
//  Created by Kento Katsumata on 2020/09/24.
//

import UIKit
import Firebase

class FriendsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var ref: DatabaseReference!
    var friendsModel = FriendsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    func setUp() {
        tableView.register(UINib(nibName: "NomiTableViewCell", bundle: nil), forCellReuseIdentifier: "NomiTableViewCell")
        friendsModel.delegate = self
        friendsModel.readData()
    }
    
}

extension FriendsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}

extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsModel.nomiUserArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "NomiTableViewCell") as! NomiTableViewCell
        cell.userNameLabel.text = friendsModel.nomiUserArray[indexPath.row].username
        return cell
    }
}

extension FriendsViewController: FriendsModelDelegate {
    func valueDidChange() {
        tableView.reloadData()
    }
}
