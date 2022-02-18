//
//  BarManager.swift
//  Hw5
//
//  Created by Dmitriy Budanov on 16.02.2022.
//

import UIKit

class BarManager {

    public var beers: [Beer] = [Beer(price: 80, name: "IPA", country: "BLR",overalVolume: 200), Beer(price: 90, name: "APA",country: "RUS",overalVolume: 250),Beer(price: 100, name: "OPA",country: "GMN",overalVolume: 280)]
    private var money: Int
    static public var shared: BarManager = BarManager()
    private init() { self.money = 0 }
    public func buyBeer(name: String, volume: Int) -> Int {
        guard calculateVolume(name: "IPA") >= volume,
              calculateVolume(name: "APA") >= volume,
              calculateVolume(name: "OPA") >= volume else{ return 0 }
        guard let buyingBeer = beers.filter({ $0.name == name }).first else { return 0 }
        let price = buyingBeer.price * volume
        beers += beers.filter({ $0.name == name }).map { (p) -> Beer in
            return  Beer(price: p.price, name: p.name, country: p.country, overalVolume: p.overalVolume - volume)
    
        }
        money += price
        return money
    }
    
    func countMoney() -> Int {
        return self.money
    }
    
    func calculateVolume (name:String) -> Int {
        return beers.filter { element in
            element.name == name
        }.sorted { left,right in
            left.overalVolume < right.overalVolume
        }.first!.overalVolume
    }
    
    func startNewDay() {
        money = 0
    }

}


struct Beer {
    let price: Int
    let name: String
    let country: String
    var overalVolume: Int
}
