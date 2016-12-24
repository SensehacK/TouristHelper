//
//  OpenWeatherConstants.swift
//  Tourist Helper
//
//  Created by Sensehack on 20/12/16.
//  Copyright © 2016 Sensehack. All rights reserved.
//

import Foundation

struct OpenWeatherConstants {
    
    // Sample URL
    
    // URL:http://api.openweathermap.org/data/2.5/weather?q=vasai&APPID=b25ecd39a0f08f16aed86d6ffaafc964
    
    // Lat & Lon api.openweathermap.org/data/2.5/weather?lat=35&lon=139&APPID=b25ecd39a0f08f16aed86d6ffaafc964
    
    
    // URL API Constants
    
    struct URLComponents {

    static let APIScheme = "http://"
    static let APIHost = "api.openweathermap.org"
    static let APIPath = "/data/2.5/weather"
    static let QueryCity = "?q="
    static let QueryLat = "?lat="
    static let QueryLon = "&lon="
    static let QueryAPI = "&APPID="
    static let AppID = "b25ecd39a0f08f16aed86d6ffaafc964"
    
    }
    
    
    // Open Weather Information for certain place
    
    struct WeatherData {
    
    static var City : String!
    static var Latitude : Double!
    static var Longitude : Double!
    static var CountryCode : String!
    static var WeatherToday : String!
    static var WeatherDescription : String!
    static var Humidity : Double!
    static var WindSpeed : Double!
    static var WindDeg : Double!
    static var Pressure : Double!
    static var Temperature : Double!
    static var MinimumTemp : Double!
    static var MaximumTemp : Double!
    
    }
    
    
    // URL API Constants
    
    struct CurrencyConvertor {
        
        static let ApiFixerIO = "http://api.fixer.io/latest"
        
        static var currencyRate : [Double] = []
        static var currencyCountry :[String] = []
        
        static var isSuccess : Bool!
    }

    
    /*
     
     
     Data copied for proper reference 
     Link : https://openweathermap.org/current
     
     */
    
    
    /*
     
     openweathermap.org/data/2.5/weather?q=vasai&APPID=b25ecd39a0f08f16aed86d6ffaafc964
     
     
     Normal JSON Response
     
     {"coord":{"lon":72.8,"lat":19.47},"weather":[{"id":711,"main":"Smoke","description":"smoke","icon":"50d"}],"base":"stations","main":{"temp":305.15,"pressure":1017,"humidity":38,"temp_min":305.15,"temp_max":305.15},"visibility":5000,"wind":{"speed":4.1,"deg":90},"clouds":{"all":0},"dt":1482296400,"sys":{"type":1,"id":7770,"message":0.0097,"country":"IN","sunrise":1482284303,"sunset":1482323752},"id":1253372,"name":"Vasai","cod":200}
     
     */

 

}
