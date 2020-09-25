//
//  NomiUser.swift
//  NomiGuin
//
//  Created by 中嶋裕也 on 2020/09/25.
//

import Foundation

class NomiUser {
    var username:String!
    var totalAlcoholValue = 0
    
    init(username:String, totalAlcoholValue: Int) {
        self.username = username
        self.totalAlcoholValue = totalAlcoholValue
    }
}
