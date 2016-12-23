//
//  CurrencyConvertorNetwork.swift
//  Tourist Helper
//
//  Created by Sensehack on 23/12/16.
//  Copyright © 2016 Sensehack. All rights reserved.
//

import Foundation



class CurrencyConvertorNetwork {
    
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
                        OpenWeatherConstants.CurrencyConvertor.currencyCountry.append((countries as! String))
                        OpenWeatherConstants.CurrencyConvertor.currencyRate.append((rates as! Double))
                    }
                    
                    
                }
                
                
            } catch
            {
                print("Error found in JSON Parsing")
            }
            
            
            
    }
    
    task.resume()
}

}
