//
//  WeatherSearchVC.swift
//  Tourist Helper
//
//  Created by Sensehack on 20/12/16.
//  Copyright © 2016 Sensehack. All rights reserved.
//

import Foundation
import UIKit

class WeatherSearchVC: UIViewController {

    
    //MARK: IBOutlets
    
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBOutlet weak var nameActivityIndicator: UIActivityIndicatorView!

    
    
    
    @IBOutlet weak var latitudeTextField: UITextField!
    
    
    @IBOutlet weak var longitudeTextField: UITextField!
    
    @IBOutlet weak var latLonActivityIndicator: UIActivityIndicatorView!
    
    
    
    // IBOutles Ends
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: IBActions
    
    @IBAction func searchByNameButtonPressed(_ sender: AnyObject) {
        
        
        
        
        
    }
    
    
    @IBAction func searchByLatLonButtonPressed(_ sender: AnyObject) {
        
        
        
        
        
        
    }
    
    
    
    @IBAction func cancelButtonPressed(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    // IBActions Ends
    
    
}
