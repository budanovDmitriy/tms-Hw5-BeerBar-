//
//  Beers.swift
//  Hw5
//
//  Created by Dmitriy Budanov on 07.06.2022.
//

import UIKit
import RealmSwift

class Pub: Object {
    @Persisted var money: Double = 0.0
}

class Beer: Object {
    @Persisted var name: String = ""
    @Persisted var price: Double = 0
    @Persisted var country: String = ""
    @Persisted var overalVolume: Double = 0
    
    convenience init(name: String, price: Double, country: String, overalVolume: Double) {
        self.init()
        self.name = name
        self.price = price
        self.country = country
        self.overalVolume = overalVolume
    }
}
