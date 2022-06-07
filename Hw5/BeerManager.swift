//
//  BarManager.swift
//  Hw5
//
//  Created by Dmitriy Budanov on 16.02.2022.
//

import UIKit
import RealmSwift

class BeerManager {
    
    //MARK: - Properties
    
    let realm = try! Realm()
    lazy var existBeers: Results<Beer> = { self.realm.objects(Beer.self) }()
    lazy var pub = { self.realm.objects(Pub.self) }().first!
    
    static public var manager = BeerManager()
    
    private init() {
        if self.existBeers.isEmpty {
            try! realm.write() {
                initRealm()
            }
        }
    }
    
    private func initRealm() {
        let pub = Pub()
        let beers = [Beer(name: "IPA",
                          price: 80,
                          country: "USA",
                          overalVolume: 200),
                     Beer(name: "APA",
                          price: 90,
                          country: "Germany",
                          overalVolume: 250),
                     Beer(name: "OPA",
                          price: 100,
                          country: "Italy",
                          overalVolume: 280)]
        realm.add(pub)
        realm.add(beers)
    }
    
    //MARK: - Methods
    
    func buyBeer(name: String, volume: Double) -> Double {
        guard let buyingBeer = existBeers.filter({$0.name == name}).first else { return 0.0 }
        if buyingBeer.overalVolume > volume {
            let price = buyingBeer.price
            try! realm.write {
                pub.money += price * volume
                buyingBeer.overalVolume -= volume
            }
            return price * volume
        } else {
            print("OUT OF STOCK")
        }
        return 0.0
    }
    
    func countMoney() -> Double {
        return pub.money
    }
    
    func startNewDay() {
        try! realm.write {
            pub.money = 0.0
        }
    }
}


