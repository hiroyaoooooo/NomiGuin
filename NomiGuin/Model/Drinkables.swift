//
//  Drinkables.swift
//  NomiGuin
//
//  Created by 中嶋裕也 on 2020/09/25.
//

import Foundation

class Drinkables {
    let list = [Drinkable(name: "Beer", ml: 350, alcohol: 5),
                Drinkable(name: "Beer", ml: 500, alcohol: 5)
    ]
}

class Drinkable {
    let name:String!
    let ml:Int!
    let alcohol:Int!
    
    init(name: String, ml: Int, alcohol: Int) {
        self.name = name
        self.ml = ml
        self.alcohol = alcohol
    }
}
