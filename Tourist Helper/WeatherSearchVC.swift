//
//  WeatherSearchVC.swift
//  Tourist Helper
//
//  Created by Sensehack on 20/12/16.
//  Copyright © 2016 Sensehack. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class WeatherSearchVC: UIViewController {

    
    /*
     CoreDataStack.sharedInstance().saveContext()
     CoreDataStack.sharedInstance().persistentContainer.viewContext
     let fetchedRequestCity: NSFetchRequest<City> = City.fetchRequest()
     */
    
    
    // Create an instance to work with the methods in class TouristHelperNetwork.
    let NetworkTH = TouristHelperNetwork()
    
    var CityData : [City]!
    
    
    //MARK: IBOutlets
    
    //Weather by Name search section
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBOutlet weak var nameActivityIndicator: UIActivityIndicatorView!

    
    //Weather by  Latitude & Longitude Section
    @IBOutlet weak var latitudeTextField: UITextField!
    
    
    @IBOutlet weak var longitudeTextField: UITextField!
    
    @IBOutlet weak var latLonActivityIndicator: UIActivityIndicatorView!
    
    
    
    // IBOutles Ends
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //City search
        nameActivityIndicator.isHidden = true
        cityNameTextField.isEnabled = true
        
        
        // Lat & Lon
        latLonActivityIndicator.isHidden = true
        latitudeTextField.isEnabled = true
        longitudeTextField.isEnabled = true
        
        cityNameTextField.text = ""
        latitudeTextField.text = ""
        longitudeTextField.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //MARK: IBActions
    
    @IBAction func searchByNameButtonPressed(_ sender: AnyObject) {
        
        let enterCityName:String = cityNameTextField.text!
        
        //Start Animation of Network Indicator
        nameActivityIndicator.isHidden = false
        nameActivityIndicator.startAnimating()
        cityNameTextField.isEnabled = false
        
        
        /*
        let cityEntity = NSEntityDescription.entity(forEntityName: "City", in: CoreDataStack.sharedInstance().persistentContainer.viewContext)
        
        let cityObject = City(entity: cityEntity!, insertInto: CoreDataStack.sharedInstance().persistentContainer.viewContext)
        
        cityObject.cityName = "mumbai"
        CoreDataStack.sharedInstance().saveContext()
        
         */
        
        
        NetworkTH.getWeatherDataByCity(cityName: enterCityName, completionHandlerForWeatherDataByCity: { (success , error) in
            
            if success == true {
                DispatchQueue.main.async {
                    
                    
                    
                    // Debug Prints
                    print(" in Success == true condition of NetworkTH.getWeatherDataByCity(cityName: enterCityName, completionHandlerForWeatherDataByCity: { (success , error) in ")
                   
                    /*
                    //Try manual segue
                    let segueView = self.storyboard?.instantiateViewController(withIdentifier: "LocationWeatherVCID") as! LocationWeatherVC
                    //segueView.CityCD =
                    
                    // Debug Prints
                    print(" in Success == true condition ")
                    self.present(segueView, animated: true, completion: nil)
                    
                    // Debug Prints
                    print(" in Success == true condition2 ")
                    */
                    self.nameActivityIndicator.stopAnimating()
                    self.nameActivityIndicator.isHidden = true
                    self.cityNameTextField.isEnabled = true
                    self.cityNameTextField.text = ""
                    
                    
                    self.dismiss(animated: true, completion: nil)
                    
                }// dispatch ends
            
                
            } // if statement ends
            
            else {
                self.nameActivityIndicator.stopAnimating()
                self.nameActivityIndicator.isHidden = true
                self.cityNameTextField.isEnabled = true
                self.cityNameTextField.text = ""
                
                self.showAlert(title: "Error occured", message: "Couldn't get Weather Data by City")
            }// else statement ends
 
        }) // task completion handler ends
        
        
    } // func searchByNameButtonPressed ends
    
    
    @IBAction func searchByLatLonButtonPressed(_ sender: AnyObject) {
        
        let enterLatitude = Double(latitudeTextField.text!)
        let enterLongitude = Double(longitudeTextField.text!)
        
        //Start Animation of Network Indicator
        latLonActivityIndicator.isHidden = false
        latLonActivityIndicator.startAnimating()
        
        //text fields enabled
        latitudeTextField.isEnabled = false
        longitudeTextField.isEnabled = false
        
        
        NetworkTH.getWeatherDataByLatLon(latitudeWeather: enterLatitude!, longitudeWeather: enterLongitude!, completionHandlerForWeatherDataByLatLon: { (success , error) in
            
            if success == true {
                DispatchQueue.main.async {
                    
                    
                    self.latLonActivityIndicator.stopAnimating()
                    self.latLonActivityIndicator.isHidden = true
                    self.latitudeTextField.isEnabled = true
                    self.longitudeTextField.isEnabled = true
                    
                    
                    self.latitudeTextField.text = ""
                    self.longitudeTextField.text = ""
                    
                    
                    
                    self.dismiss(animated: true, completion: nil)
                    
                    
                } // dispatch ends
                
                
            } // if statement ends
                
            else {
                self.latLonActivityIndicator.stopAnimating()
                self.latLonActivityIndicator.isHidden = true
                self.latitudeTextField.isEnabled = true
                self.longitudeTextField.isEnabled = true
                
                self.latitudeTextField.text = ""
                self.longitudeTextField.text = ""
                
                self.showAlert(title: "Error occured", message: "Couldn't get Weather Data by Lat Lon")
            } // else statement ends
            
      
        }) // task completion handler ends
        
    } // func ends

    
    
    @IBAction func cancelButtonPressed(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    // IBActions Ends
    
    
    // MARK: Show Alert Methods
    
    func showAlert(title : String , message: String) {
        let alertDisplay = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let pressOK = UIAlertAction(title: "OK", style: .default){
            _ in
            self.dismiss(animated: true, completion: nil)
        }
        alertDisplay.addAction(pressOK)
        present(alertDisplay, animated: true, completion: nil)
    }

    
}
