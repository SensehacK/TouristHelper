//
//  CurrencyConvertorNetwork.swift
//  Tourist Helper
//
//  Created by Sensehack on 23/12/16.
//  Copyright © 2016 Sensehack. All rights reserved.
//

import Foundation



class CurrencyConvertorNetwork {
    
    var currencyRate : [Double] = []
    var currencyCountry :[String] = []
    var success = true
    

    func getCurrentCurrencyRates() {
        
     
        /*
         if let url = OpenWeatherConstants.CurrencyConvertor.ApiFixerIO {
            print("let url = OpenWeatherConstants.")
        }
         */
        let currencyApiURL = URL(string : "http://api.fixer.io/latest" )
       // let currencyApiURL = URL(string : "http://api.fixer.io/latest")
        
        //Debug prints
        print("currencyApiURL")
        print(currencyApiURL)
        
        // Initialise the Task
        
        let task = URLSession.shared.dataTask(with: currencyApiURL!) { (data , response , error) in
            
            //Debug prints
            print("URLSession.shared")

            
            guard error == nil else {
                //self.showAlert(title: "Error", message: "Error Found while connecting with internet")
                
                return
            }
            
            
            guard let dataJson = data else {
                //self.showAlert(title: "Data error", message: "Please check your Internet Connection")
                
                return
            }
            
            // JSON Parsing
            
            let parsedData : AnyObject!
            
            do {
                //Debug prints
                print("parsedData : AnyObject!do {")
                
                parsedData = try JSONSerialization.jsonObject(with: dataJson, options: .allowFragments) as AnyObject
                
                if let currencyRates =  parsedData["rates"] as? NSDictionary {
                    
                    for (countries , rates) in currencyRates {
                        self.currencyCountry.append((countries as! String))
                        self.currencyRate.append((rates as! Double))
                        /*
                        OpenWeatherConstants.CurrencyConvertor.currencyCountry.append((countries as! String))
                        OpenWeatherConstants.CurrencyConvertor.currencyRate.append((rates as! Double))
                        */
                        
                    }
                    self.success = true
                    /*
                    OpenWeatherConstants.CurrencyConvertor.isSuccess = true
                    print(OpenWeatherConstants.CurrencyConvertor.isSuccess)
                    */
                }
                //Debug prints
                print("parsedData :Call  self.assignArray() {")
                 self.assignArray()
                
            } catch
            {
                self.success = false
                
                //OpenWeatherConstants.CurrencyConvertor.isSuccess = false
                
                print("Error found in JSON Parsing")
                
            }
            
            
            
    }
    
    task.resume()
}

    
   // Reference  http://stackoverflow.com/a/31574620/5177704
    func assignArray()
    {
        
       print(" self.assignArray()")
        
        let otherVC = CurrencyConvertorVC()
        otherVC.currencyCountrySS = currencyCountry
        otherVC.currencyRateSS = currencyRate
    }
    
    func specificCurrencyRate() {
        
    }
}
