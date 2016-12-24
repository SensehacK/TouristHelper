//
//  CurrencyConvertorVC.swift
//  Tourist Helper
//
//  Created by Sensehack on 20/12/16.
//  Copyright © 2016 Sensehack. All rights reserved.
//

import Foundation
import UIKit

class CurrencyConvertorVC: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource {
    
    let NetworkCC = CurrencyConvertorNetwork()
    
    var currencyRateCC : [Double] = []
    var currencyCountryCC :[String] = []
    
    var selectedCurrency : Double = 0
    var convertedAmount : Double = 0
    
    
    // Old variables 
    var currencyRate : [Double] = []
    var currencyCountry :[String] = []
    
    
    //Segue sent data
    var currencyRateSS : [Double] = []
    var currencyCountrySS :[String] = []
    
     // MARK: IBOutlets
    
    @IBOutlet weak var currencyCountryPicker: UIPickerView!
    
    @IBOutlet weak var amountToBeConvertedTextField: UITextField!
    
    @IBOutlet weak var convertedAmountLabel: UILabel!
    
    
    // IBOutlet ends 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // UI extension for gesture initializer for dismiss keyboard
        self.hideKeyboardWhenTappedAround()
        
      //   NetworkCC.getCurrentCurrencyRates()
        
        //Debug 
        print("NetworkCC.getCurrentCurrencyRates()")
        
        /*
        let bool2 : Bool =  NetworkCC.checkEmail()
        
       let bool =  NetworkCC.getCurrentCurrencyRates()
        
        */
        
        /*
        let boolConstant =  OpenWeatherConstants.CurrencyConvertor.isSuccess
        print(" let boolConstant")
        print(boolConstant)
        
        let bool =  NetworkCC.success
        
        if bool {
            /*
            //Debug
            print("if bool {")

           currencyRateCC = NetworkCC.currencyRate
          currencyCountryCC =   NetworkCC.currencyCountry
            */
            
            //Debug
            print("2nd constants struct")
            
            currencyRateCC = OpenWeatherConstants.CurrencyConvertor.currencyRate
            currencyCountryCC =   OpenWeatherConstants.CurrencyConvertor.currencyCountry
            print("currencyRateCC")
            print(currencyRateCC)
            print("currencyCountryCC")
            print(currencyCountryCC)
    
        }
        else {
            
            print("Error Displayed " )
        }
        */
        
        
        // Set up URL 
        
        let currencyApiURL = URL(string : "http://api.fixer.io/latest")
        
        // Initialise the Task 
        
        let task = URLSession.shared.dataTask(with: currencyApiURL!) { (data , response , error) in
            
            guard error == nil else {
                self.showAlert(title: "Error", message: "Error Found while connecting with internet")
                return
            }
            
            
            guard let dataJson = data else {
                self.showAlert(title: "Data error", message: "Please check your Internet Connection")
                return
            }
            
            // JSON Parsing
            
            let parsedData : AnyObject!
            
            do {
            parsedData = try JSONSerialization.jsonObject(with: dataJson, options: .allowFragments) as AnyObject
                if let currencyRates =  parsedData["rates"] as? NSDictionary {
                    
                    for (countries , rates) in currencyRates {
                        self.currencyCountry.append((countries as! String))
                        self.currencyRate.append((rates as! Double))
                    }
                    
                    
                }
                
                
            } catch
            {
                print("Error found in JSON Parsing")
            }
            
 
        
        
            self.currencyCountryPicker.reloadAllComponents()
        } // task ends
        
        task.resume()
  
        
        // End commenting
        
        
        
    }// view did load ends
         
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: IBAction
    
    
    @IBAction func convertCurrencyButtonPressed(_ sender: AnyObject) {
        
        guard (amountToBeConvertedTextField.text?.isEmpty)! == false else {
            showAlert(title: "Empty Value", message: "Please enter some value")
            return
        }
        
        convertedAmount = Double(amountToBeConvertedTextField.text!)! * selectedCurrency
        
        
        //Change the label
        convertedAmountLabel.text = String(convertedAmount)
        
        
    } // IBAction ends
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        print("variable currencycountrySS.count ")
        print(currencyCountrySS.count)
        
        //DEbug print''
        
        /*
         
         print("variable currencycountry.count ")
         print(currencyCountryCC.count)
        let tempNumberOfRows = OpenWeatherConstants.CurrencyConvertor.currencyCountry.count
        //DEbug print''
        print("variable tempNumberOfRows ")
        print(tempNumberOfRows)
        
        //DEbug print''
        print("variable  OpenWeatherConstants.CurrencyConvertor.currencyCountry.count ")
        print((OpenWeatherConstants.CurrencyConvertor.currencyCountry.count))
        
        */
        
        //return currencyCountrySS.count
        return currencyCountry.count
        //return currencyCountryCC.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //print(currencyCountry[row])
        
       // return currencyCountrySS[row]
        return currencyCountry[row]
       // return currencyCountryCC[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //selectedCurrency = currencyRateSS[row]
        selectedCurrency = currencyRate[row]
        //selectedCurrency = currencyRateCC[row]
    }
    
    
    
    
}
