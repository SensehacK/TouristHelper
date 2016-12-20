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
    
    
    
   // openweathermap.org/data/2.5/weather?q=vasai&APPID=b25ecd39a0f08f16aed86d6ffaafc964
    
    static let APIScheme = "http"
    static let APIHost = "api.openweathermap.org"
    static let APIPath = "/data/2.5/weather?q="
    
    
    // Api Request URL
    static let AppID = "b25ecd39a0f08f16aed86d6ffaafc964"
    static let City = (-180.0, 180.0)
    static let Latitude = 1.0
    static let Longitude = 2.0
   

}
