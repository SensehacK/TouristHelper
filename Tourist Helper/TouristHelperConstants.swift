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
    
    /*
    
    openweathermap.org/data/2.5/weather?q=vasai&APPID=b25ecd39a0f08f16aed86d6ffaafc964
    
     
     Normal JSON Response
     
     {"coord":{"lon":72.8,"lat":19.47},"weather":[{"id":711,"main":"Smoke","description":"smoke","icon":"50d"}],"base":"stations","main":{"temp":305.15,"pressure":1017,"humidity":38,"temp_min":305.15,"temp_max":305.15},"visibility":5000,"wind":{"speed":4.1,"deg":90},"clouds":{"all":0},"dt":1482296400,"sys":{"type":1,"id":7770,"message":0.0097,"country":"IN","sunrise":1482284303,"sunset":1482323752},"id":1253372,"name":"Vasai","cod":200}
    
    */
    
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
     
     
     
     Parameters:
     
     city
     city.id City ID
     city.name City name
     city.coord
     city.coord.lon City geo location, longitude
     city.coord.lat City geo location, latitude
     city.country Country code (GB, JP etc.)
     city.sun
     city.sun.rise Sunrise time
     city.sun.set Sunset time
     temperature
     temperature.value Temperature
     temperature.min Minimum temperature at the moment of calculation. This is deviation from 'temp' that is possible for large cities and megalopolises geographically expanded (use these parameter optionally).
     temperature.max Maximum temperature at the moment of calculation. This is deviation from 'temp' that is possible for large cities and megalopolises geographically expanded (use these parameter optionally).
     temperature.unit Unit of measurements. Possilbe valure is Celsius, Kelvin, Fahrenheit.
     humidity
     humidity.value Humidity value
     humidity.unit %
     pressure
     pressure.value Pressure value
     pressure.unit hPa
     wind
     wind.speed
     wind.speed.value Wind speed, mps
     wind.speed.name Type of the wind
     wind.direction
     wind.direction.value Wind direction, degrees (meteorological)
     wind.direction.code Code of the wind direction. Possilbe value is WSW, N, S etc.
     wind.direction.name Full name of the wind direction.
     clouds
     clouds.value Cloudiness
     clouds.name Name of the cloudiness
     visibility
     visibility.value Visibility, meter
     precipitation
     precipitation.value Precipitation, mm
     precipitation.mode Possible values are 'no", name of weather phenomena as 'rain', 'snow'
     weather
     weather.number Weather condition id
     weather.value Weather condition name
     weather.icon Weather icon id
     lastupdate
     lastupdate.value Last time when data was updated

     
     
     
 */
   

}
