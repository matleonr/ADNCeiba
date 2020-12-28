//
//  AddVehicleViewController.swift
//  Presentation
//
//  Created by Matt Leon on 12/12/20.
//

import Domain
import Persistence
import UIKit

class AddVehicleViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var vehicleTypeSegmentedController: UISegmentedControl!
    @IBOutlet var plateTextField: UITextField!
    @IBOutlet var dayTextField: UITextField!
    @IBOutlet var timeTextField: UITextField!
    @IBAction func addVehicleButtonAction(_ sender: Any) {
        
        saveVehicle()
    
    }
    @IBOutlet var cylinderCapacityTextField: UITextField!
    @IBOutlet weak var cylinderCapacityLabel: UILabel!
    @IBOutlet weak var divider4: UIView!
    private let date = Date()
    private let formatter = DateFormatter()
    private var vehicleService: VehicleService?

    override func viewDidLoad() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        vehicleService = appDelegate.diContainer.getContainer().resolve(VehicleService.self)!

        setUI()
    }

    func setUI() {
        
        vehicleTypeSegmentedController.addTarget(self, action: #selector(changeForm), for: .valueChanged)
        dayTextField.text = getDateString()
        timeTextField.text = getHourString()
        plateTextField.tag = 1
        cylinderCapacityTextField.tag = 2
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    
    }

    private func getDateString() -> String {
        
        formatter.dateFormat = "EEEE, d MMM"
        return formatter.string(from: date)
    
    }

    private func getHourString() -> String {
        
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    
    }

    func getDay() -> Int {
        
        var day: Int = 0
        formatter.dateFormat = "d"
        day = Int(formatter.string(from: date))!
        formatter.dateFormat = "MM"
        day = day + Int(formatter.string(from: date))!
        return day
    
    }
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    
    }

    func getHour() -> Int {
    
        formatter.dateFormat = "HH"
        return Int(formatter.string(from: date))!
    
    }

    func saveVehicle() {

        if vehicleTypeSegmentedController.selectedSegmentIndex == 0  {
            saveByke()
        }else{
            saveCar()
        }
        
    }
    
    private func saveCar() {
        
        let car = Car(day: getDay(), hour: getHour(), plate: plateTextField.text!)
        if (vehicleService?.saveCar(car: car))! {
            _ = navigationController?.popViewController(animated: true)
        }
        
    }
    
    private func saveByke() {
        
        let byke = Byke(day: getDay(), hour: getHour(), plate: plateTextField.text!, cylinderCapacity: Int(cylinderCapacityTextField.text!)!)
        if (vehicleService?.saveByke(byke: byke))! {
            _ = navigationController?.popViewController(animated: true)
        }
        
    }

    @objc func changeForm() {
        
        let index = vehicleTypeSegmentedController.selectedSegmentIndex
        if index == 1 {
            
            cylinderCapacityLabel.isHidden = true
            cylinderCapacityTextField.isHidden = true
            divider4.isHidden = true
            
        }else{
            
            cylinderCapacityLabel.isHidden = false
            cylinderCapacityTextField.isHidden = false
            divider4.isHidden = false
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.tag==1 {
            let numberOnly = NSCharacterSet.init(charactersIn: "1234567890-ABCDEFGHIJKLMNOPQRSTUVXYZ").inverted
            let strValid = string.rangeOfCharacter(from: numberOnly) == nil
            return strValid
        }
        
        if textField.tag==2 {
            let numberOnly = NSCharacterSet.init(charactersIn: "1234567890").inverted
            let strValid = string.rangeOfCharacter(from: numberOnly) == nil
            return strValid
        }
        return true
        
        
    }
    
}
