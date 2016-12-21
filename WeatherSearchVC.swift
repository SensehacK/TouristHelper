//
//  WeatherSearchVC.swift
//  Tourist Helper
//
//  Created by Sensehack on 20/12/16.
//  Copyright © 2016 Sensehack. All rights reserved.
//

import Foundation
import UIKit

class WeatherSearchVC: UIViewController {

    /*
     CoreDataStack.sharedInstance().saveContext()
     let fetchedRequestCity: NSFetchRequest<City> = City.fetchRequest()
     CoreDataStack.sharedInstance().saveContext()
     */
    
    // Create an instance to work with the methods in class TouristHelperNetwork.
    let NetworkTH = TouristHelperNetwork()
    
    //MARK: IBOutlets
    
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBOutlet weak var nameActivityIndicator: UIActivityIndicatorView!

    
    
    
    @IBOutlet weak var latitudeTextField: UITextField!
    
    
    @IBOutlet weak var longitudeTextField: UITextField!
    
    @IBOutlet weak var latLonActivityIndicator: UIActivityIndicatorView!
    
    
    
    // IBOutles Ends
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: IBActions
    
    @IBAction func searchByNameButtonPressed(_ sender: AnyObject) {
        
        let enterCityName:String = cityNameTextField.text!
        
        //Start Animation of Network Indicator
        nameActivityIndicator.startAnimating()
        
        NetworkTH.getWeatherDataByCity(cityName: enterCityName, completionHandlerForWeatherDataByCity: { (success , error) in
            
            if success == true {
                
            }
            
            else {
                
                
            }
        
            
            
            
        })
        
        
    } // func searchByNameButtonPressed ends
    
    
    @IBAction func searchByLatLonButtonPressed(_ sender: AnyObject) {
        
        let enterLatitude = latitudeTextField.text!
        let enterLongitude = longitudeTextField.text!
        
        
        
    }
    
    
    
    @IBAction func cancelButtonPressed(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    // IBActions Ends
    
    
}
