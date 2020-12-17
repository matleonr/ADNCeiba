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
    private let date = Date()
    private let formatter = DateFormatter()
    private var vehicleService: VehicleService?

    override func viewDidLoad() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        vehicleService = appDelegate.diContainer.getContainer().resolve(VehicleService.self)!

        setUI()
    }

    func setUI() {
        vehicleTypeSegmentedController.addTarget(self, action: #selector(changeTableView), for: .valueChanged)
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

    func getNameOfTheDay(day: Int) -> String {
        var nameOfTheDay: String = ""
        switch day {
        case 1:
            nameOfTheDay = "monday"
        default:
            break
        }
        return nameOfTheDay
    }

    func saveVehicle() {
        let cylinderCapacity = Int(cylinderCapacityTextField.text ?? "0")!

        let vehicle: Vehicle = try Vehicle(day: getDay(), hour: getHour(), plate: plateTextField.text!, type: getCarType(), cylinderCapacity: cylinderCapacity)

        vehicleService?.saveVehicle(vehicle: vehicle)
        print("Se ha guardado correctamente")
    }

    private func getCarType() -> String {
        if vehicleTypeSegmentedController.selectedSegmentIndex == 0 {
            return "byke"
        }
        return "car"
    }

    @objc func changeTableView() {
        let index = vehicleTypeSegmentedController.selectedSegmentIndex
    }
}
