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
    @IBOutlet weak var smallCountryLabel: UILabel!
    
    // Lat & Lon
    @IBOutlet weak var latitudeValueLabel: UILabel!
    
    @IBOutlet weak var longitudeValueLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var weatherTodayLabel: UILabel!
    
    // Extra Labels for City weather parameters
    
    @IBOutlet weak var weatherDescription: UILabel!
    
    @IBOutlet weak var cloudinessValue: UILabel!
    
    @IBOutlet weak var windValue: UILabel!
    
    @IBOutlet weak var humidityValue: UILabel!
    
    @IBOutlet weak var pressureValue: UILabel!
    
    @IBOutlet weak var countryValue: UILabel!
    
    
    
    // IBoutlets ends
    
    
    var CityCD  : City!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        self.cityNameLabel.text =  self.CityCD.cityName
        self.smallCountryLabel.text =  self.CityCD.countryCode
        self.weatherDescription.text =  self.CityCD.weatherDescription
        self.weatherTodayLabel.text =  self.CityCD.weatherDescription
        self.cloudinessValue.text =  self.CityCD.weatherToday
        
        self.latitudeValueLabel.text =  "\(self.CityCD.latitude)"
        self.longitudeValueLabel.text = "\(self.CityCD.longitude)"
        self.pressureValue.text =  "\(self.CityCD.pressure) hpa"
        self.windValue.text = "\(self.CityCD.wind) m/s "
        self.humidityValue.text =  "\(self.CityCD.humidity) %"
        self.temperatureLabel.text = "\(self.CityCD.temperature)°C"
        
        self.countryValue.text =  self.CityCD.countryCode
        //self.cityNameLabel.text =  self.CityCD.cityName
        //self.cityNameLabel.text =  self.CityCD.cityName
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func cancelButtonPressed(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
