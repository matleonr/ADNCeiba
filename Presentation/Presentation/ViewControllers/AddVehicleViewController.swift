//
//  AddVehicleViewController.swift
//  Presentation
//
//  Created by Matt Leon on 12/12/20.
//

import Domain
import Persistence
import UIKit

class AddVehicleViewController: UIViewController {
    
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
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    func getHour() -> Int {
        formatter.dateFormat = "HH"
        return Int(formatter.string(from: date))!
    }

    func saveVehicle() {

        let vehicle: Vehicle = try Vehicle(day: getDay(), hour: getHour(), plate: plateTextField.text!, type: getCarType(), cylinderCapacity: setCylinderCapacity())

        vehicleService?.saveVehicle(vehicle: vehicle)
        print("Se ha guardado correctamente")
        _ = navigationController?.popViewController(animated: true)
    }

    private func getCarType() -> String {
        if vehicleTypeSegmentedController.selectedSegmentIndex == 0 {
            return "byke"
        }
        return "car"
    }
    
    func setCylinderCapacity() -> Int {
        if cylinderCapacityTextField.text!.isEmpty  || getCarType() == "car"{
            return 0
        }else{
            return Int(cylinderCapacityTextField.text ?? "0")!
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
        
        return string.rangeOfCharacter(from: CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ-1234567890")) == nil
        
    }
}
