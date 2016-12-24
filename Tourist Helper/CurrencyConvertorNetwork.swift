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
        
     
        
        let currencyApiURL = URL(string : "\(OpenWeatherConstants.CurrencyConvertor.currencyRate)" )
       // let currencyApiURL = URL(string : "http://api.fixer.io/latest")
        
        //Debug prints
        print(currencyApiURL)
        
        // Initialise the Task
        
        let task = URLSession.shared.dataTask(with: currencyApiURL!) { (data , response , error) in
            
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
                parsedData = try JSONSerialization.jsonObject(with: dataJson, options: .allowFragments) as AnyObject
                if let currencyRates =  parsedData["rates"] as? NSDictionary {
                    
                    for (countries , rates) in currencyRates {
                        self.currencyCountry.append((countries as! String))
                        self.currencyRate.append((rates as! Double))
                        
                    }
                    self.success = true
                    
                    
                }
                
                
                
            } catch
            {
                self.success = false
                print("Error found in JSON Parsing")
                
            }
            
            
            
    }
    
    task.resume()
}

}
