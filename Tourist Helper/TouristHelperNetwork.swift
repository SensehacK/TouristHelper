//
//  TouristHelperNetwork.swift
//  Tourist Helper
//
//  Created by Sensehack on 21/12/16.
//  Copyright © 2016 Sensehack. All rights reserved.
//

import Foundation
import CoreData

class TouristHelperNetwork {
    
    
    
    
    
    // URL for reference  http:// openweathermap.org/data/2.5/weather?q=vasai&APPID=b25ecd39a0f08f16aed86d6ffaafc964
    
    //MARK: INCOMPLETE
    // Weather Data Method by parameter "City"
    
    func getWeatherDataByCity(cityName : String, completionHandlerForWeatherDataByCity : @escaping (_ success : Bool , _ error : String)-> Void) {
        
        print("Before Escaped Character")
        print(cityName)
        var optionalCity = ""
        
        // Reference http://stackoverflow.com/questions/24879659/how-to-encode-a-url-in-swift
        //var escapedAddress = cityName.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        
        let escapedCityName  = cityName.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        
        
        
        // ANother optional Chaining reference http://stackoverflow.com/a/26733589/5177704
        
        if let escapedCityName2 = escapedCityName {
            print("In optional chaining syntax")
            optionalCity = escapedCityName2
        }
        
        print("Escaped Character")
        print(escapedCityName)
        
        /*if optionalCity.isEmpty {
            
        } */
        
        let urlString = "\(OpenWeatherConstants.URLComponents.APIScheme)\(OpenWeatherConstants.URLComponents.APIHost)\(OpenWeatherConstants.URLComponents.APIPath)\(OpenWeatherConstants.URLComponents.QueryCity)\(optionalCity)\(OpenWeatherConstants.URLComponents.QueryAPI)\(OpenWeatherConstants.URLComponents.AppID)"
            
        
        //Debug Print for URL
        print("\(urlString) ")
        
        //Make it URL
        let url = URL(string: urlString)!
        
        
        //Build the URLRequest
        
        let request = URLRequest(url: url)
        
        
        //Initiating Task URL request 
        
        let task =  URLSession.shared.dataTask(with: request) { (data , response , error) in
           
            // Debug Prints
            print("in task urlsession")
            
            // guard statements incoming
            
            // Debug Prints
            print("guard statements incoming")
            
            
            guard let data = data else {
                print("Data not present,")
                //Debug print
                print("Error in func getWeatherDataByCity Guard Statement")
                
                return
            }
            
            guard error == nil else {
                print("error present")
                //Debug print
                print("Error in func getWeatherDataByCity Guard Statement")
                return
            }
            // Status code msgs
            guard let statusCodes = (response as? HTTPURLResponse)?.statusCode , statusCodes >= 200 && statusCodes <= 299 else {
                print("Wrong status codes returned func getWeatherDataByCity")
                completionHandlerForWeatherDataByCity(false, "")
                return
            }
            
            
            var parsedOpenWeatherData : NSDictionary!
            
            
            do {
                
                // Debug Prints
                print("parsedOpenWeatherData = try JSONSerializatio")
                
                parsedOpenWeatherData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary
            }
            catch {
                print("Error in Do try catch block func getWeatherDataByCity")
                return
            }
            
            // Reference Response
            /*
             
             openweathermap.org/data/2.5/weather?q=vasai&APPID=b25ecd39a0f08f16aed86d6ffaafc964
             
             
             Normal JSON Response
             
             {"coord":{"lon":72.8,"lat":19.47},"weather":[{"id":711,"main":"Smoke","description":"smoke","icon":"50d"}],"base":"stations","main":{"temp":305.15,"pressure":1017,"humidity":38,"temp_min":305.15,"temp_max":305.15},"visibility":5000,"wind":{"speed":4.1,"deg":90},"clouds":{"all":0},"dt":1482296400,"sys":{"type":1,"id":7770,"message":0.0097,"country":"IN","sunrise":1482284303,"sunset":1482323752},"id":1253372,"name":"Vasai","cod":200}
             
             */

            
            
            
            // Incoming JSON objects parsing checking values in Guard Statements
            
            guard let jsonCityName = parsedOpenWeatherData["name"] as? String else {
               
                print("error in guard Statement while getting Name")
                return
                
            }
            // Debug Prints
            print("OpenWeatherConstants.WeatherData.City = jsonCityName")
           
            
            
            OpenWeatherConstants.WeatherData.City = jsonCityName
            
            // checking for Latitude & Longitude in "Coord"
            
            guard let jsonCoord = parsedOpenWeatherData["coord"] as? NSDictionary else {
                
                print("error in guard Statement while getting Main Array Dictionary JSON")
                return
                
            }
            
            // JSON Co Ordingates Branch data Handling.
            
            guard let jsonCoordLon = jsonCoord["lon"] as? Double else {
                
                print("error in guard Statement while getting jsonCoord Longitude")
                return
                
            }
            
            OpenWeatherConstants.WeatherData.Longitude = jsonCoordLon
            
            
            guard let jsonCoordLan = jsonCoord["lat"] as? Double else {
                
                print("error in guard Statement while getting jsonCoord Latitude")
                return
                
            }
            
            OpenWeatherConstants.WeatherData.Latitude = jsonCoordLan
            
            
            
            // checking for Latitude & Longitude in "Coord"
            
            guard let jsonWind = parsedOpenWeatherData["wind"] as? NSDictionary else {
                
                print("error in guard Statement while getting Wind  Array Dictionary JSON")
                return
                
            }
            
            // JSON Co Ordingates Branch data Handling.
            
            guard let jsonWindSpeed = jsonWind["speed"] as? Double else {
                
                print("error in guard Statement while getting jsonWindSpeed ")
                return
                
            }
            
            OpenWeatherConstants.WeatherData.WindSpeed = jsonWindSpeed
            
            
            // JSON Co Ordingates Branch data Handling.
            //let jsonWindDegYes = 0.0
            
           /* if  jsonWind["deg"] {
                
                print("error in guard Statement while getting jsonWindDeg ")
                
            
            } */
            
            let jsonWindDeg2 = jsonWind["deg"] as? Double
            print(jsonWindDeg2)
            if (jsonWindDeg2?.isZero)! {
                print("In zero condition jsonWindDeg2?.isZero)! s")
                OpenWeatherConstants.WeatherData.WindDeg = jsonWindDeg2
            }
            
            
            
            // JSON Co Ordingates Branch data Handling.
            
            guard let jsonWindDeg = jsonWind["deg"] as? Double else {
                
                print("error in guard Statement while getting jsonWindDeg ")
                return
                
            }
            
            OpenWeatherConstants.WeatherData.WindDeg = jsonWindDeg
            
            
            
            
            
            guard let jsonMain = parsedOpenWeatherData["main"] as? NSDictionary else {
                
                print("error in guard Statement while getting Main Array Dictionary JSON")
                return
                
            }
            
            // JSON Main Branch data Handling.
            
            guard var jsonMainTemp = jsonMain["temp"] as? Double else {
                
                print("error in guard Statement while getting Main Temp")
                return
                
            }
            
            jsonMainTemp = jsonMainTemp/10
            
            //Debug Print
            print(jsonMainTemp)
            OpenWeatherConstants.WeatherData.Temperature = jsonMainTemp
            
            
            
            guard let jsonMainPressure = jsonMain["pressure"] as? Double else {
                
                print("error in guard Statement while getting Main pressure")
                return
                
            }
            
            OpenWeatherConstants.WeatherData.Pressure = jsonMainPressure
            
            guard let jsonMainHumidity = jsonMain["humidity"] as? Double else {
                
                print("error in guard Statement while getting Main Humidity")
                return
                
            }
            
            OpenWeatherConstants.WeatherData.Humidity = jsonMainHumidity
            
            
            guard let jsonMainMinimumTemp = jsonMain["temp_min"] as? Double else {
                
                print("error in guard Statement while getting Main Max Temp")
                return
                
            }
            
            OpenWeatherConstants.WeatherData.MinimumTemp = jsonMainMinimumTemp

            
            guard let jsonMainMaximumTemp = jsonMain["temp_max"] as? Double else {
                
                print("error in guard Statement while getting Main Min Temp")
                return
                
            }
            
            OpenWeatherConstants.WeatherData.MaximumTemp = jsonMainMaximumTemp
            
            
            guard let jsonWeather = parsedOpenWeatherData["weather"] as? [[String : Any]] else {
                
                print("error in guard Statement while getting weather Array Dictionary JSON")
                return
                
            }
            
            var weatherToday : String!
            var weatherDescription : String!
            
            for data in jsonWeather  {
                
                // JSON objects parameters Response Result : Reference "weather":[{"id":711,"main":"Smoke","description":"smoke","icon":"50d"}]
                
                
                guard let weatherTodayData = data["main"] as? String else {
                    
                    print("error in guard Statement while getting Main Min Temp")
                    return
                    
                }
                weatherToday = weatherTodayData
                
                
                guard let weatherDescriptionData = data["description"] as? String else {
                    
                    print("error in guard Statement while getting Main Min Temp")
                    return
                    
                }
                weatherDescription = weatherDescriptionData

                
                
            } // End data traversal in Array of String  : Any
            
            
            OpenWeatherConstants.WeatherData.WeatherToday = weatherToday
            OpenWeatherConstants.WeatherData.WeatherDescription = weatherDescription
            
            
            guard let jsonSystem = parsedOpenWeatherData["sys"] as? NSDictionary else {
                
                print("error in guard Statement while getting System Array Dictionary JSON")
                return
                
            }
            
            guard let jsonCountryCode = jsonSystem["country"] as? String else {
                
                print("error in guard Statement while getting Main Array Dictionary JSON")
                return
                
            }
            
            OpenWeatherConstants.WeatherData.CountryCode = jsonCountryCode
            


            
            self.saveDataToCoreData(city: jsonCityName)
            
            
            return completionHandlerForWeatherDataByCity(true, "")
            
            
        
        } // end Task
        
        
        task.resume()
        
    } // end func getWeatherDataByCity
    
    
    
    /* URL API Constants
    static let APIScheme = "http"
    static let APIHost = "api.openweathermap.org"
    static let APIPath = "/data/2.5/weather"
    static let QueryCity = "?q="
    static let QueryLat = "?lat="
    static let QueryLon = "&lon="
    static let QueryAPI = "&APPID="
    static let AppID = "b25ecd39a0f08f16aed86d6ffaafc964"
    
    // URL for reference http:// api.openweathermap.org/data/2.5/weather?lat=22&lon=122&APPID=b25ecd39a0f08f16aed86d6ffaafc964

      //MARK: INCOMPLETE Weather Data Method by parameter "Latitude" & "Longitude"
     
     // Mumbai URL 
     
     
     http:// api.openweathermap.org/data/2.5/weather?lat=19.01&lon=72.85&APPID=b25ecd39a0f08f16aed86d6ffaafc964
    */
    
    

    // Weather Data Method by parameter "Latitude" & "Longitude"
    
    func getWeatherDataByLatLon(latitudeWeather : Double, longitudeWeather : Double, completionHandlerForWeatherDataByLatLon : @escaping (_ success : Bool , _ error : String)-> Void) {
        
        let urlString  = "\(OpenWeatherConstants.URLComponents.APIScheme)\(OpenWeatherConstants.URLComponents.APIHost)\(OpenWeatherConstants.URLComponents.APIPath)\(OpenWeatherConstants.URLComponents.QueryLat)\(latitudeWeather)\(OpenWeatherConstants.URLComponents.QueryLon)\(longitudeWeather)\(OpenWeatherConstants.URLComponents.QueryAPI)\(OpenWeatherConstants.URLComponents.AppID)"
        
        //Debug Print for URL
        print("\(urlString)")

        
        
        //Make it URL
        let url = URL(string: urlString)!
        
        
        //Build the URLRequest
        
        let request = URLRequest(url: url)
        
        
        //Initiating Task URL request
        
        let task =  URLSession.shared.dataTask(with: request) { (data , response , error) in
            // Debug Prints
            print("in task urlsession")
            
            // guard statements incoming
            
            // Debug Prints 
            print("guard statements incoming")
            
            guard let data = data else {
                print("Data not present,")
                //Debug print
                print("Error in func getWeatherDataByCity Guard Statement")
                
                return
            }
            
            guard error == nil else {
                print("error present")
                //Debug print
                print("Error in func getWeatherDataByCity Guard Statement")
                return
            }
            // Status code msgs
            guard let statusCodes = (response as? HTTPURLResponse)?.statusCode , statusCodes >= 200 && statusCodes <= 299 else {
                print("Wrong status codes returned func getWeatherDataByCity")
                return
            }
            
            
            var parsedOpenWeatherData : NSDictionary!
            
            
            do {
                // Debug Prints
                print("parsedOpenWeatherData = try JSONSerializatio")
                
                parsedOpenWeatherData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary
            }
            catch {
                print("Error in Do try catch block func getWeatherDataByCity")
                return
            }
            
            // Reference Response
            /*
             
             openweathermap.org/data/2.5/weather?q=vasai&APPID=b25ecd39a0f08f16aed86d6ffaafc964
             
             
             Normal JSON Response
             
             {"coord":{"lon":72.8,"lat":19.47},"weather":[{"id":711,"main":"Smoke","description":"smoke","icon":"50d"}],"base":"stations","main":{"temp":305.15,"pressure":1017,"humidity":38,"temp_min":305.15,"temp_max":305.15},"visibility":5000,"wind":{"speed":4.1,"deg":90},"clouds":{"all":0},"dt":1482296400,"sys":{"type":1,"id":7770,"message":0.0097,"country":"IN","sunrise":1482284303,"sunset":1482323752},"id":1253372,"name":"Vasai","cod":200}
             
             */
            
            
            
            
            // Incoming JSON objects parsing checking values in Guard Statements
            
            guard let jsonCityName = parsedOpenWeatherData["name"] as? String else {
                
                print("error in guard Statement while getting Name")
                return
                
            }
            // Debug Prints
            print("OpenWeatherConstants.WeatherData.City = jsonCityName")
            
            
            
            OpenWeatherConstants.WeatherData.City = jsonCityName
            
            // checking for Latitude & Longitude in "Coord"
            
            guard let jsonCoord = parsedOpenWeatherData["coord"] as? NSDictionary else {
                
                print("error in guard Statement while getting Main Array Dictionary JSON")
                return
                
            }
            
            // JSON Co Ordingates Branch data Handling.
            
            guard let jsonCoordLon = jsonCoord["lon"] as? Double else {
                
                print("error in guard Statement while getting jsonCoord Longitude")
                return
                
            }
            
            OpenWeatherConstants.WeatherData.Longitude = jsonCoordLon
            
            
            guard let jsonCoordLan = jsonCoord["lat"] as? Double else {
                
                print("error in guard Statement while getting jsonCoord Latitude")
                return
                
            }
            
            OpenWeatherConstants.WeatherData.Latitude = jsonCoordLan
            
            
            
            // checking for Latitude & Longitude in "Coord"
            
            guard let jsonWind = parsedOpenWeatherData["wind"] as? NSDictionary else {
                
                print("error in guard Statement while getting Wind  Array Dictionary JSON")
                return
                
            }
            
            // JSON Co Ordingates Branch data Handling.
            
            guard let jsonWindSpeed = jsonWind["speed"] as? Double else {
                
                print("error in guard Statement while getting jsonWindSpeed ")
                return
                
            }
            
            OpenWeatherConstants.WeatherData.WindSpeed = jsonWindSpeed
            
            
            // JSON Co Ordingates Branch data Handling.
            
            guard let jsonWindDeg = jsonWind["deg"] as? Double else {
                
                print("error in guard Statement while getting jsonWindDeg ")
                return
                
            }
            
            OpenWeatherConstants.WeatherData.WindDeg = jsonWindDeg
            
            
            
            
            // Check for Main Array while parsing data. 
            
            guard let jsonMain = parsedOpenWeatherData["main"] as? NSDictionary else {
                
                print("error in guard Statement while getting Main Array Dictionary JSON")
                return
                
            }
            
            // JSON Main Branch data Handling.
            
            guard let jsonMainTemp = jsonMain["temp"] as? Double else {
                
                print("error in guard Statement while getting Main Temp")
                return
                
            }
            
            OpenWeatherConstants.WeatherData.Temperature = jsonMainTemp
            
            
            guard let jsonMainPressure = jsonMain["pressure"] as? Double else {
                
                print("error in guard Statement while getting Main pressure")
                return
                
            }
            
            OpenWeatherConstants.WeatherData.Pressure = jsonMainPressure
            
            guard let jsonMainHumidity = jsonMain["humidity"] as? Double else {
                
                print("error in guard Statement while getting Main Humidity")
                return
                
            }
            
            OpenWeatherConstants.WeatherData.Humidity = jsonMainHumidity
            
            
            guard let jsonMainMinimumTemp = jsonMain["temp_min"] as? Double else {
                
                print("error in guard Statement while getting Main Max Temp")
                return
                
            }
            
            OpenWeatherConstants.WeatherData.MinimumTemp = jsonMainMinimumTemp
            
            
            guard let jsonMainMaximumTemp = jsonMain["temp_max"] as? Double else {
                
                print("error in guard Statement while getting Main Min Temp")
                return
                
            }
            
            OpenWeatherConstants.WeatherData.MaximumTemp = jsonMainMaximumTemp
            
            
            guard let jsonWeather = parsedOpenWeatherData["weather"] as? [[String : Any]] else {
                
                print("error in guard Statement while getting weather Array Dictionary JSON")
                return
                
            }
            
            var weatherToday : String!
            var weatherDescription : String!
            
            for data in jsonWeather  {
                
                // JSON objects parameters Response Result : Reference "weather":[{"id":711,"main":"Smoke","description":"smoke","icon":"50d"}]
                
                
                guard let weatherTodayData = data["main"] as? String else {
                    
                    print("error in guard Statement while getting Main Min Temp")
                    return
                    
                }
                weatherToday = weatherTodayData
                
                
                guard let weatherDescriptionData = data["description"] as? String else {
                    
                    print("error in guard Statement while getting Main Min Temp")
                    return
                    
                }
                weatherDescription = weatherDescriptionData
                
                
                
            } // End data traversal in Array of String  : Any
            
            
            OpenWeatherConstants.WeatherData.WeatherToday = weatherToday
            OpenWeatherConstants.WeatherData.WeatherDescription = weatherDescription
            
            
            guard let jsonSystem = parsedOpenWeatherData["sys"] as? NSDictionary else {
                
                print("error in guard Statement while getting System Array Dictionary JSON")
                return
                
            }
            
            guard let jsonCountryCode = jsonSystem["country"] as? String else {
                
                print("error in guard Statement while getting Main Array Dictionary JSON")
                return
                
            }
            
            OpenWeatherConstants.WeatherData.CountryCode = jsonCountryCode
            
            
            
            
            self.saveDataToCoreData(city: jsonCityName)
            
            
            return completionHandlerForWeatherDataByLatLon(true, "")
            
            
            
        } // end Task
        
        task.resume()
        
    } // func getWeatherDataByLatLon  ends

    
    
    func saveDataToCoreData(city: String)
    {
        let coreData:[City]!
        let fetchedRequestCity: NSFetchRequest<City> = City.fetchRequest()
       
        
        
        
        let cityEntity = NSEntityDescription.entity(forEntityName: "City", in: CoreDataStack.sharedInstance().persistentContainer.viewContext)
        
        let cityObject = City(entity: cityEntity!, insertInto: CoreDataStack.sharedInstance().persistentContainer.viewContext)
        
        if city != cityObject.cityName {
        
        cityObject.cityName = city
        CoreDataStack.sharedInstance().saveContext()
        
        }
        // Debug Prints
        print("func saveDataToCoreData(city: String)")
        
        // Fetch Core Data Object of City
        do{
            
            // Debug Prints
            print("func saveDataToCoreData(city: String) do try catch block")
            
            
            coreData = try CoreDataStack.sharedInstance().persistentContainer.viewContext.fetch(fetchedRequestCity)
        }
        catch{
            print("Couldn't fetch Core Data object of City")
            return
        }
        
        // Debug Prints
        print("func saveDataToCoreData(city: String) after  catch block")
        
        
        
        
        
        /* Directly save the city name
        
         let cityObject : City!
         cityObject.cityName  = OpenWeatherConstants.WeatherData.City
         
        let CityCD  : [City]!
        let fetchedRequestCity2: NSFetchRequest<City> = City.fetchRequest()
        do {
            CityCD =   try CoreDataStack.sharedInstance().persistentContainer.viewContext.fetch(fetchedRequestCity2)
            
            
        }catch {
            
        }
        
        CityCD.cityName = OpenWeatherConstants.WeatherData.City
        
         */

        
        
        
        
        
        // Parsing core Data object
        for object in coreData
        {
            
            // Debug Prints
            print("func saveDataToCoreData(city: String) object for loop")
            
            
            if object.cityName == city
            {
                object.cityName = OpenWeatherConstants.WeatherData.City
                object.countryCode = OpenWeatherConstants.WeatherData.CountryCode
                object.temperature = OpenWeatherConstants.WeatherData.Temperature
                object.latitude = OpenWeatherConstants.WeatherData.Latitude
                object.longitude = OpenWeatherConstants.WeatherData.Longitude
                object.minimumTemperature = OpenWeatherConstants.WeatherData.MinimumTemp
                object.maximumTemperature = OpenWeatherConstants.WeatherData.MaximumTemp
                object.wind = OpenWeatherConstants.WeatherData.WindSpeed
                object.pressure = OpenWeatherConstants.WeatherData.Pressure
                object.humidity = OpenWeatherConstants.WeatherData.Humidity
                object.weatherToday = OpenWeatherConstants.WeatherData.WeatherToday
                object.weatherDescription = OpenWeatherConstants.WeatherData.WeatherDescription
                
                
                // Save to the core data Context
                CoreDataStack.sharedInstance().saveContext()
                
            } // if object ends 
            
        }// for ends
    } // func ends 
    


    
    
    
    
    
} // end
