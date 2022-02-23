//
//  BarManager.swift
//  Hw5
//
//  Created by Dmitriy Budanov on 16.02.2022.
//

import UIKit

class BarManager {

    public var beers: [Beer] = [Beer(price: 80, name: "IPA", country: "BLR",overalVolume: 200), Beer(price: 90, name: "APA",country: "RUS",overalVolume: 250),Beer(price: 100, name: "OPA",country: "GMN",overalVolume: 280)]
    private var money: Double
    static public var shared: BarManager = BarManager()
    private init() { self.money = 0 }
    public func buyBeer(name: String, volume: Double) -> (Double,Double) {
        guard let buyingBeer = beers.filter({ $0.name == name }).first else { return (0,0) }
        guard calculateVolume(name:name) >= volume
               else { return (0,0) }
        let price = buyingBeer.price * volume
        money += price
        beers += beers.filter({ $0.name == name }).map { (p) -> Beer in
            return  Beer(price: p.price, name: p.name, country: p.country, overalVolume: p.overalVolume - volume)
    
        }
        return (money,price)
        
    }
    func countMoney() -> Double {
        return self.money
    }
    
    func calculateVolume (name:String) -> Double {
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



