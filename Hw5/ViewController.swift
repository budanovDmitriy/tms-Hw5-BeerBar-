//
//  ViewController.swift
//  Hw5
//
//  Created by Dmitriy Budanov on 16.02.2022.
//

import UIKit

class ViewController: UIViewController {
    var setter: Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        
    
        // Do any additional setup after loading the view.
        //BarManager.shared.calculateVolume(name: "APA")
        
    }
   
    @IBAction func stepper(_ sender: UIStepper) {
        label.text = "Volume Of Beer: " + String(sender.value)
        setter = Int(sender.value)
    }
    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func BuyingFirstBeer(_ sender: Any) {
        if BarManager.shared.buyBeer(name: "IPA", volume: setter) > 0
        {BuyingStatus.text = "You buy \(setter) liters of IPA"}
        else {BuyingStatus.text = "You can't buy \(setter) liters of IPA"}
    }
    @IBAction func BuyingSecondBeer(_ sender: Any) {
        if BarManager.shared.buyBeer(name: "APA", volume: setter) > 0
        {BuyingStatus.text = "You buy \(setter) liters of APA"}
        else {BuyingStatus.text = "You can't buy \(setter) liters of APA"}
    }
    @IBAction func BuyingThirdBeer(_ sender: Any) {
        if BarManager.shared.buyBeer(name: "OPA", volume: setter) > 0
        {BuyingStatus.text = "You buy \(setter) liters of OPA"}
        else {BuyingStatus.text = "You can't buy \(setter) liters of OPA"}
    }
    @IBOutlet weak var FirstBeerInfo: UILabel!
    @IBOutlet weak var SecondBeerInfo: UILabel!
    @IBOutlet weak var ThirdBeerInfo: UILabel!
    @IBOutlet weak var Earning: UILabel!
    
    @IBAction func GetEarnings(_ sender: Any) {
        Earning.text = "Earning: " + String(BarManager.shared.countMoney())
    }
    @IBAction func SetNewDay(_ sender: Any) {
        BarManager.shared.startNewDay()
        Earning.text = "Earning: " + String(BarManager.shared.countMoney())
        
        
    }
    @IBOutlet weak var BuyingStatus: UILabel!
    @IBOutlet weak var CurrentVolumeFirstBeer: UILabel!
    @IBAction func GetCurrentVolume(_ sender: Any) {
        CurrentVolumeFirstBeer.text = "IPA: " + String(BarManager.shared.calculateVolume(name: "IPA"))
        CurrentVolumeSecondBeer.text = "IPA: " + String(BarManager.shared.calculateVolume(name: "APA"))
        CurrentVolumeThirdBeer.text = "OPA: " + String(BarManager.shared.calculateVolume(name: "OPA"))
    }
    
    @IBOutlet weak var CurrentVolumeSecondBeer: UILabel!
    
    @IBOutlet weak var CurrentVolumeThirdBeer: UILabel!
    func setupLabels(){
        FirstBeerInfo.text = BarManager.shared.beers[0].name + " " + BarManager.shared.beers[0].country + " " +
            String(BarManager.shared.beers[0].price)
        SecondBeerInfo.text = BarManager.shared.beers[1].name + " " + BarManager.shared.beers[1].country + " " +
            String(BarManager.shared.beers[1].price)
        ThirdBeerInfo.text = BarManager.shared.beers[2].name + " " + BarManager.shared.beers[2].country + " " +
            String(BarManager.shared.beers[2].price)
        label.text = "Volume Of Beer: 1.0"
        Earning.text = "Earning: 0"
        BuyingStatus.text = "Buy some beer"
    }
}
