//
//  CurrencyConvertorVC.swift
//  Tourist Helper
//
//  Created by Sensehack on 20/12/16.
//  Copyright © 2016 Sensehack. All rights reserved.
//

import Foundation
import UIKit

class CurrencyConvertorVC: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource , UITextFieldDelegate {
    
    //Instance class object
    let NetworkCC = CurrencyConvertorNetwork()
    
    var selectedCurrency : Double = 0
    var convertedAmount : Double = 0
    
    // Old variables 
    var currencyRate : [Double] = []
    var currencyCountry :[String] = []
    
    
    //Segue sent data
    var currencyRateSS : [Double] = []
    var currencyCountrySS :[String] = []
    
     // MARK: IBOutlets
    
    @IBOutlet weak var currencyCountryPicker: UIPickerView!
    
    @IBOutlet weak var amountToBeConvertedTextField: UITextField!
    
    @IBOutlet weak var convertedAmountLabel: UILabel!
    
    
    // IBOutlet ends 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        amountToBeConvertedTextField.delegate = self
        amountToBeConvertedTextField.keyboardType = .numberPad
        // UI extension for gesture initializer for dismiss keyboard
        hideKeyboardWhenTappedAround()
        
            NetworkCC.getCurrencyArray(completionHandler: {(success , error) in
            
            if success {
                 print("In success NetworkCC.getCurrencyArray ")
                
                self.currencyCountrySS  = OpenWeatherConstants.CurrencyConvertor.currencyCountry
                self.currencyRateSS     = OpenWeatherConstants.CurrencyConvertor.currencyRate
                print(self.currencyCountrySS)
                print(self.currencyRateSS)
                
            } else {
                self.showAlert(title: "Error", message: "Please Check Internet connection")
                }
                
            
            self.currencyCountryPicker.reloadAllComponents()
            })
        
            
        //Debug
        print("NetworkCC.getCurrentCurrencyRates()")
    
        
        
    }// view did load ends
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
        return string.rangeOfCharacter(from: invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
    
 
    // MARK: IBAction
    
    
    @IBAction func convertCurrencyButtonPressed(_ sender: AnyObject) {
        
        guard (amountToBeConvertedTextField.text?.isEmpty)! == false else {
            showAlert(title: "Empty Value", message: "Please enter some value")
            return
        }
        
//        guard (amountToBeConvertedTextField.text?.isdeci)! == false else {
//            showAlert(title: "Empty Value", message: "Please enter some value")
//            return
//        }
        
        
        if selectedCurrency == 0.0 {
            
            showAlert(title: "Empty UIPickerView", message: "Please select Currency Country from PickerView")
        }
    
        
        print("selectedCurrency")
        print(selectedCurrency)
        
        convertedAmount = Double(amountToBeConvertedTextField.text!)! * selectedCurrency
        
        //Change the label
        convertedAmountLabel.text = String(convertedAmount)
        
        
    } // IBAction ends
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       
        
        return currencyCountrySS.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

       return currencyCountrySS[row]

    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        print("currencyRateSS[row] ")
        print(currencyRateSS[row])
        
        selectedCurrency = currencyRateSS[row]
    }
    
    
    
    
}
