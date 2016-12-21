//
//  LocationWeatherVC.swift
//  Tourist Helper
//
//  Created by Sensehack on 20/12/16.
//  Copyright © 2016 Sensehack. All rights reserved.
//

import Foundation
import UIKit

class LocationWeatherVC: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    // Lat & Lon
    @IBOutlet weak var latitudeValueLabel: UILabel!
    
    @IBOutlet weak var longitudeValueLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    
    // Extra Labels for City weather parameters
    
    @IBOutlet weak var weatherDescription: UILabel!
    
    @IBOutlet weak var cloudinessValue: UILabel!
    
    @IBOutlet weak var windValue: UILabel!
    
    @IBOutlet weak var humidityValue: UILabel!
    
    @IBOutlet weak var pressureValue: UILabel!
    
    @IBOutlet weak var countryValue: UILabel!
    
    
    
    // IBoutlets ends
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Test Github commit errors
    
    
    
    
    
}
