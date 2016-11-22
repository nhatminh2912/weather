//
//  ViewController.swift
//  weather
//
//  Created by Nhật Minh on 11/22/16.
//  Copyright © 2016 Nhật Minh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var tempBtn: UIButton!
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    
    
    @IBOutlet weak var CFlabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    var quotes = ["Since we cannot change reality, let us change the eyes which see reality.",
                  "Without a struggle, there can be no progress.",
                  "If you don't like something, change it. If you can't change it, change your attitude."]
    
    var city = ["Hà Nội", "Đà Nẵng", "Sài Gòn"]
    
    var backgroundImage = ["Blood", "Moon", "Sun"]
    
    var tempCF : Bool = true
    
    @IBAction func tempchangeButton(_ sender: UIButton) {
    
    
        tempCF = !tempCF
        
        var currentTemp = Double((tempBtn.titleLabel?.text)!)
        
        if tempCF {
            currentTemp = (currentTemp! - 32) / 1.8
            
            tempBtn.setTitle(String(format: "%2.1f", currentTemp!), for: UIControlState())
            
            CFlabel.text = "C"
        }
        else {
            currentTemp = currentTemp! * 1.8 + 32
            
            tempBtn.setTitle(String(format: "%2.1f", currentTemp!), for: UIControlState())
            
            CFlabel.text = "F"
        }
        
    }
    
    
    
    
    @IBAction func randomButton(_ sender: UIButton) {
        
        let cityIndex = Int(arc4random_uniform(UInt32(city.count)))
        
        cityLabel.text = city[cityIndex]
        
        let quoteIndex = Int(arc4random_uniform(UInt32(quotes.count)))
        
        quoteLabel.text = quotes[quoteIndex]
        
        let backgroundIndex = Int(arc4random_uniform(UInt32(backgroundImage.count)))
        
        background.image = UIImage.init(named: backgroundImage[backgroundIndex])
        
        getTemp()
        
    }
    
    func getTemp() -> Void {
        
        let temp = String(format: "%2.1f", tempRandom())
        
        tempBtn.setTitle(temp, for: UIControlState())
        
    }
    
    func tempRandom() -> Double {
        if tempCF {
            return Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)
        }
        else
        {
            return Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX) * 1.8 + 32
        }
        
        
    }
    

    
    
    
}

