//
//  ViewController.swift
//  Hw5
//
//  Created by Dmitriy Budanov on 16.02.2022.
//

import UIKit

class ViewController: UIViewController {
    var setter: Double = 0.5
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        
        
    
        // Do any additional setup after loading the view.
        //BarManager.shared.calculateVolume(name: "APA")
        
    }
   
    @IBAction func stepper(_ sender: UIStepper) {
        let stepper = sender
        stepper.stepValue = 0.5
        stepper.maximumValue = 100.0
        stepper.minimumValue = 0.5
        label.text = "Volume Of Beer: " + String(sender.value)
        setter = sender.value
    }
    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func BuyingFirstBeer(_ sender: Any) {
        let buingBeer = BarManager.shared.buyBeer(name: "IPA", volume: setter)
        if buingBeer > (0,0)
        {BuyingStatus.text = "You buy \(setter) liters of IPA for \(buingBeer.1) rubbles"
            
        }
        else {BuyingStatus.text = "You can't buy \(setter) liters of IPA"}
    }
    @IBAction func BuyingSecondBeer(_ sender: Any) {
        let buingBeer = BarManager.shared.buyBeer(name: "APA", volume: setter)
        if buingBeer > (0,0)
        {BuyingStatus.text = "You buy \(setter) liters of APA for \(buingBeer.1) rubbles"}
        else {BuyingStatus.text = "You can't buy \(setter) liters of APA"}
    }
    @IBAction func BuyingThirdBeer(_ sender: Any) {
        let buingBeer = BarManager.shared.buyBeer(name: "OPA", volume: setter)
        if buingBeer > (0,0)
        {BuyingStatus.text = "You buy \(setter) liters of OPA for \(buingBeer.1) rubbles"}
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
        CurrentVolumeSecondBeer.text = "APA: " + String(BarManager.shared.calculateVolume(name: "APA"))
        CurrentVolumeThirdBeer.text = "OPA: " + String(BarManager.shared.calculateVolume(name: "OPA"))
    }
    
    @IBOutlet weak var CurrentVolumeSecondBeer: UILabel!
    
    @IBOutlet weak var CurrentVolumeThirdBeer: UILabel!
    func setupLabels(){
        FirstBeerInfo.text =  BarManager.shared.beers[0].name + " " + BarManager.shared.beers[0].country + " " +
            String(BarManager.shared.beers[0].price)
        SecondBeerInfo.text = BarManager.shared.beers[1].name + " " + BarManager.shared.beers[1].country + " " +
            String(BarManager.shared.beers[1].price)
        ThirdBeerInfo.text = BarManager.shared.beers[2].name + " " + BarManager.shared.beers[2].country + " " +
            String(BarManager.shared.beers[2].price)
        label.text = "Volume Of Beer: 0.5"
        Earning.text = "Earning: 0"
        BuyingStatus.text = "Buy some beer"
    }
}
