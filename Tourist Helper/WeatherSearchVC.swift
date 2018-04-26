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

class WeatherSearchVC: UIViewController , UITextFieldDelegate {

    
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
        
        latitudeTextField.delegate = self
        longitudeTextField.delegate = self
        
        // Add keyboard hide gesture
        hideKeyboardWhenTappedAround()
        
        
        //City search
        
        cityNameTextField.isEnabled = true
        
        
        // Lat & Lon
        
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    
    
    
    //MARK: IBActions
    
    @IBAction func searchByNameButtonPressed(_ sender: AnyObject) {
        
        let enterCityName:String = cityNameTextField.text!
        
        //Start Animation of Network Indicator
        
        nameActivityIndicator.startAnimating()
        cityNameTextField.isEnabled = false
    
        
        if enterCityName.isEmpty {
            
            //Start Animation of Network Indicator
            
            nameActivityIndicator.stopAnimating()
            cityNameTextField.isEnabled = true
            
            showAlert(title: "Empty Search Text Field", message: "Please enter a name to search")
            
        }
        
        
        NetworkTH.getWeatherDataByCity(cityName: enterCityName, completionHandlerForWeatherDataByCity: { (success , error) in
            
            if success {
                DispatchQueue.main.async {
                    
                    self.nameActivityIndicator.startAnimating()
                     UIApplication.shared.isNetworkActivityIndicatorVisible = true
                    
                    // Debug Prints
                    print(" in Success == true condition of NetworkTH.getWeatherDataByCity(cityName: enterCityName, completionHandlerForWeatherDataByCity: { (success , error) in ")
                   
                   
                    
                    self.cityNameTextField.isEnabled = true
                    self.cityNameTextField.text = ""
                    self.nameActivityIndicator.stopAnimating()
                    
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    self.dismiss(animated: true, completion: nil)
                    
                }// dispatch ends
            
                
            } // if statement ends
            
            else {
                
                 DispatchQueue.main.async {
                // Debug Prints
                print(" in Success == false  else condition of NetworkTH.getWeatherDataByCity ")
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
                    
                self.nameActivityIndicator.stopAnimating()
                
                self.cityNameTextField.isEnabled = true
                self.cityNameTextField.text = ""
                
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
               self.showAlert(title: "Error occured", message: "Couldn't get Weather Data by City Please Check Internet Connection")
                    
                }
            }// else statement ends
            
             self.nameActivityIndicator.stopAnimating()
        }) // task completion handler ends
        
        
    } // func searchByNameButtonPressed ends
    
    
    @IBAction func searchByLatLonButtonPressed(_ sender: AnyObject) {
       
        
        
        //Start Animation of Network Indicator
        
        latLonActivityIndicator.startAnimating()
        
        //text fields enabled
        latitudeTextField.isEnabled = false
        longitudeTextField.isEnabled = false
        
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            
            // Get text
            let currentText = textField.text ?? ""
            let replacementText = (currentText as NSString).replacingCharacters(in: range, with: string)
            
            // Validate
            return replacementText.isValidDecimal(maximumFractionDigits: 3)
            
        }
        
        
        
        
        guard let latText = latitudeTextField.text, !latText.isEmpty else {
            
            // Debug Prints 
            print("guard let latText = latitudeTextField.text")
            
            showAlert(title: "Empty Lat or Lon Text Field", message: "Please enter a Latitude to search")
            latLonActivityIndicator.stopAnimating()
            
            
            //text fields enabled
            latitudeTextField.isEnabled = true
            longitudeTextField.isEnabled = true
            return
        }
        
        guard let lonText = longitudeTextField.text, !lonText.isEmpty else {
            // Debug Prints
            print("guard let latText = latitudeTextField.text")
            
            showAlert(title: "Empty Lat or Lon Text Field", message: "Please enter a Latitude to search")
            latLonActivityIndicator.stopAnimating()
            
            
            //text fields enabled
            latitudeTextField.isEnabled = true
            longitudeTextField.isEnabled = true
            
            return
        }
        
     
        
        let enterLatitude = Double(latitudeTextField.text!)
        let enterLongitude = Double(longitudeTextField.text!)
        
    
        
       
        
        
        NetworkTH.getWeatherDataByLatLon(latitudeWeather: enterLatitude!, longitudeWeather: enterLongitude!, completionHandlerForWeatherDataByLatLon: { (success , error) in
            
            if success {
                DispatchQueue.main.async {
                    
                    UIApplication.shared.isNetworkActivityIndicatorVisible = true
                    self.latLonActivityIndicator.stopAnimating()
                    
                    self.latitudeTextField.isEnabled = true
                    self.longitudeTextField.isEnabled = true
                    
                    
                    self.latitudeTextField.text = ""
                    self.longitudeTextField.text = ""
                    
                    
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    
                    self.dismiss(animated: true, completion: nil)
                    
                    
                } // dispatch ends
                
                
            } // if statement ends
                
            else {
                 DispatchQueue.main.async {
                // Debug Prints
                print(" in Success == false  else condition of NetworkTH.getWeatherDataByLatLon ")
                    
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
                    
                self.latLonActivityIndicator.stopAnimating()
                self.latitudeTextField.isEnabled = true
                self.longitudeTextField.isEnabled = true
                
                self.latitudeTextField.text = ""
                self.longitudeTextField.text = ""
                
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.showAlert(title: "Error occured", message: "Couldn't get Weather Data by Lat Lon")
                    
                } // Dispatch Ends
            } // else statement ends
            
      
        }) // task completion handler ends
        
    } // func ends

    
    
    @IBAction func cancelButtonPressed(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func weatherTVButtonPressed(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
   
    
    
    // IBActions Ends
    
    
    
    
    
    
    
    
}


// Extensions from Stack Overflow 

// Reference Stack OverFlow http://stackoverflow.com/a/27079103/5177704




extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    /* Code Review SUGGESTION
    You can create an extension of UIViewController and put this method there and call it whenever you need it from any class that inherits from UIViewController. 
     */
    
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

// Reference from Stack Overflow http://stackoverflow.com/a/39811155/5177704 


extension String{
    
    private static let decimalFormatter:NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.allowsFloats = true
        return formatter
    }()
    
    private var decimalSeparator:String{
        return String.decimalFormatter.decimalSeparator ?? "."
    }
    
    func isValidDecimal(maximumFractionDigits:Int)->Bool{
        
        // Depends on you if you consider empty string as valid number
        guard self.isEmpty == false else {
            return true
        }
        
        // Check if valid decimal
        if let _ = String.decimalFormatter.number(from: self){
            
            // Get fraction digits part using separator
            let numberComponents = self.components(separatedBy: decimalSeparator)
            let fractionDigits = numberComponents.count == 2 ? numberComponents.last ?? "" : ""
            return fractionDigits.count <= maximumFractionDigits
        }
        
        return false
    }
    
}

