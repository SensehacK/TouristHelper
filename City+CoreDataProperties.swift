//
//  City+CoreDataProperties.swift
//  Tourist Helper
//
//  Created by Sensehack on 21/12/16.
//  Copyright © 2016 Sensehack. All rights reserved.
//

import Foundation
import CoreData


extension City {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<City>(entityName: "City");
    }

    @NSManaged public var cityName: String?
    @NSManaged public var countryCode: String?
    @NSManaged public var humidity: Double
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var maximumTemperature: Double
    @NSManaged public var minimumTemperature: Double
    @NSManaged public var pressure: Double
    @NSManaged public var weatherDescription: String?
    @NSManaged public var weatherToday: String?
    @NSManaged public var wind: Double

}
