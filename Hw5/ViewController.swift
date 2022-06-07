//
//  ViewController.swift
//  Hw5
//
//  Created by Dmitriy Budanov on 16.02.2022.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    var setter: Double = 0.5
    private let beerManager = BeerManager.manager
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var FirstBeerInfo: UILabel!
    @IBOutlet weak var SecondBeerInfo: UILabel!
    @IBOutlet weak var ThirdBeerInfo: UILabel!
    @IBOutlet weak var Earning: UILabel!
    @IBOutlet weak var BuyingStatus: UILabel!
    @IBOutlet weak var CurrentVolumeFirstBeer: UILabel!
    @IBOutlet weak var CurrentVolumeSecondBeer: UILabel!
    @IBOutlet weak var CurrentVolumeThirdBeer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        let stepper = sender
        stepper.stepValue = 0.5
        stepper.maximumValue = 100.0
        stepper.minimumValue = 0.5
        label.text = "Volume Of Beer: " + String(sender.value)
        setter = sender.value
    }
    
    @IBAction func BuyingFirstBeer(_ sender: Any) {
        
        BuyingStatus.text = "You buy \(setter) liters of IPA for \(beerManager.buyBeer(name: "IPA", volume: setter)) rubbles"
        
    }
    
    @IBAction func BuyingSecondBeer(_ sender: Any) {
        BuyingStatus.text = "You buy \(setter) liters of APA for \(beerManager.buyBeer(name: "APA", volume: setter)) rubbles"
    }
    
    @IBAction func BuyingThirdBeer(_ sender: Any) {
        BuyingStatus.text = "You buy \(setter) liters of OPA for \(beerManager.buyBeer(name: "OPA", volume: setter)) rubbles"
    }
    
    
    
    @IBAction func GetEarnings(_ sender: Any) {
        Earning.text = "Earning: " + String(beerManager.countMoney())
    }
    
    @IBAction func SetNewDay(_ sender: Any) {
        beerManager.startNewDay()
        Earning.text = "Earning: " + String(beerManager.countMoney())
    }
    
    
  @IBAction func GetCurrentVolume(_ sender: Any) {
        CurrentVolumeFirstBeer.text = "IPA: " + String(beerManager.existBeers[0].overalVolume)
        CurrentVolumeSecondBeer.text = "APA: " + String(beerManager.existBeers[1].overalVolume)
        CurrentVolumeThirdBeer.text = "OPA: " + String(beerManager.existBeers[2].overalVolume)
    }

    
    func setupLabels() {
        FirstBeerInfo.text =  beerManager.existBeers[0].name + " " + beerManager.existBeers[0].country + " " +
        String(beerManager.existBeers[0].price)
        SecondBeerInfo.text = beerManager.existBeers[1].name + " " + beerManager.existBeers[1].country + " " +
        String(beerManager.existBeers[1].price)
        ThirdBeerInfo.text = beerManager.existBeers[2].name + " " + beerManager.existBeers[2].country + " " +
        String(beerManager.existBeers[2].price)
        label.text = "Volume Of Beer: 0.5"
        Earning.text = "Earning: 0"
        BuyingStatus.text = "Buy some beer"
    }
}

