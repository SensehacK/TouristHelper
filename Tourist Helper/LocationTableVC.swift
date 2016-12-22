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

class LocationTableVC : UIViewController , UITableViewDelegate, UITableViewDataSource , NSFetchedResultsControllerDelegate {
    
    
    
    /*
     CoreDataStack.sharedInstance().saveContext()
     CoreDataStack.sharedInstance().persistentContainer.viewContext
     let fetchedRequestCity: NSFetchRequest<City> = City.fetchRequest()
     CoreDataStack.sharedInstance().saveContext()
     */
    
    
    //Variables Declaration 
    var CityData : [City]!
    let fetchedRequestCity: NSFetchRequest<City> = City.fetchRequest()
    var fetchedRequestContCity: NSFetchedResultsController<City>!
    
    
    
    
    //IBoutles 
    
    
    @IBOutlet var weatherTableView: UITableView!

    
    
    
    
    
    
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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CityData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let weatherCell  = weatherTableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell")
        
        weatherCell?.textLabel?.text = CityData[indexPath.row].cityName
        
        weatherCell?.detailTextLabel?.text = "Weather \(CityData[indexPath.row].weatherToday) Temperature: \(CityData[indexPath.row].temperature)"
        
        
        return weatherCell!
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let segueView = storyboard?.instantiateViewController(withIdentifier: "LocationWeatherVCID") as! LocationWeatherVC
        
        segueView.CityCD = CityData[indexPath.row]
        
        // Pass the value & switch to Weather View Display Controller
        DispatchQueue.main.async {
           self.present(segueView, animated: true, completion: nil)
        }
        
        
        
        
    }
    
    func refreshTableView () {
        
      let newRefreshWeatherData =   fetchedRequestContCity.fetchedObjects
        
        
        
    }
    
    
    
    
    
    
    // MARK: Show Alert Methods
    
    func showAlert(title : String , message: String) {
        let alertDisplay = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let pressOK = UIAlertAction(title: "OK", style: .default){
            _ in
            self.dismiss(animated: true, completion: nil)
        }
        alertDisplay.addAction(pressOK)
        present(alertDisplay, animated: true, completion: nil)
    }
    

}
