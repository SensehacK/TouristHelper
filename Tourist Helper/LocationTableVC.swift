//
//  LocationTableVC.swift
//  Tourist Helper
//
//  Created by Sensehack on 20/12/16.
//  Copyright © 2016 Sensehack. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class LocationTableVC : UIViewController , UITableViewDelegate, UITableViewDataSource,NSFetchedResultsControllerDelegate {
    
    
    /*
     CoreDataStack.sharedInstance().saveContext()
     CoreDataStack.sharedInstance().persistentContainer.viewContext
     let fetchedRequestCity: NSFetchRequest<City> = City.fetchRequest()
     */
    
    
    //Variables Declaration 
    var CityData : [City]!
    let fetchedRequestCity: NSFetchRequest<City> = City.fetchRequest()
    var fetchedRequestContCity: NSFetchedResultsController<City>!
    
    // Create an instance to work with the methods in class TouristHelperNetwork.
    let NetworkTH = TouristHelperNetwork()
    
    
    //IBoutles 
    
    
    @IBOutlet var weatherTableView: UITableView!

 
    // end IBOutlets
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchedRequestCity.sortDescriptors = [NSSortDescriptor(key : "cityName" , ascending : true)]
        
        let fetchController = NSFetchedResultsController(fetchRequest: fetchedRequestCity, managedObjectContext: CoreDataStack.sharedInstance().persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchController.delegate = self
        
        //Do Try catch block fetching objects via sortDescriptors . Fetch controller
        
        do {
            try fetchController.performFetch()
        }
        catch {
            showAlert(title: "Fetch Error", message: "Error catched while performing fetch")
        }
        
        fetchedRequestContCity = fetchController
        
        
        // Assign to the City CoreData & fetch objects.
        CityData = fetchedRequestContCity.fetchedObjects
        
        weatherTableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Reloads Data
        fetchedRequestCity.sortDescriptors = [NSSortDescriptor(key : "cityName" , ascending : true)]
        
        let fetchController = NSFetchedResultsController(fetchRequest: fetchedRequestCity, managedObjectContext: CoreDataStack.sharedInstance().persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchController.delegate = self
        
        //Do Try catch block fetching objects via sortDescriptors . Fetch controller
        
        do {
            try fetchController.performFetch()
        }
        catch {
            showAlert(title: "Fetch Error", message: "Error catched while performing fetch")
        }
        
        fetchedRequestContCity = fetchController
        
        
        // Assign to the City CoreData & fetch objects.
        CityData = fetchedRequestContCity.fetchedObjects
        
        weatherTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CityData.count
        
    } // tableview noofrows ends
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let weatherCell  = weatherTableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell")
        
        weatherCell?.textLabel?.text = CityData[indexPath.row].cityName
        
        
      // optional chaining & extra debugs : Suggestion by code Reviewer to remove "Optional Value"
        let weatherTodayTemp = CityData[indexPath.row].weatherToday
        //print("***************")
        //print(weatherTodayTemp)
        
        if let weatherTodayTemp = weatherTodayTemp {
           // print("***************")
           // print(weatherTodayTemp)
        
        weatherCell?.detailTextLabel?.text = "\(weatherTodayTemp) Temp: \(CityData[indexPath.row].temperature)"
      
        }
        
        return weatherCell!
    } // table view cellforRow Ends
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let segueView = storyboard?.instantiateViewController(withIdentifier: "LocationWeatherVCID") as! LocationWeatherVC
        
        segueView.CityCD = CityData[indexPath.row]
        
        // Pass the value & switch to Weather View Display Controller
        DispatchQueue.main.async {
           self.present(segueView, animated: true, completion: nil)
        }// dispatch ends
        
    
    } // table view did select ends
    
    
    
    
}
