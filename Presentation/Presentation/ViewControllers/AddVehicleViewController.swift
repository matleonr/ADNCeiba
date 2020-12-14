//
//  AddVehicleViewController.swift
//  Presentation
//
//  Created by Matt Leon on 12/12/20.
//

import Domain
import UIKit
import Persistence


class AddVehicleViewController: UIViewController {
    
    @IBOutlet weak var vehicleTypeSegmentedController: UISegmentedControl!
    @IBOutlet weak var plateTextField: UITextField!
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBAction func addVehicleButtonAction(_ sender: Any) {
        saveVehicle()
        
    }
    private var vehicleService: VehicleService?
    
    override func viewDidLoad() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        vehicleService = appDelegate.diContainer.getContainer().resolve(VehicleService.self)!
        
        setUI()
    }
    
    func setUI() {
        vehicleTypeSegmentedController.addTarget(self, action: #selector(changeTableView), for: .valueChanged)
        
    }
    
    func getDay() -> Int {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let today = formatter.string(from: date)
        let todayDate = formatter.date(from: today)
        formatter.dateFormat = "e" // "eeee" -> Friday
        let weekDay = formatter.string(from: todayDate!)
        return Int(weekDay)!
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
        
        
        let vehicle : Vehicle = try Vehicle(day: getDay(), hour: 2, plate: "ABC-123", type: "car")
        vehicle.setCylinderCapacity(cylinderCapacity: 3000)
        
        
//        let authUser: AuthUser = try AuthUser(userId: "User01", password: "123", roles: roles)
//        let person = try Person(id: "Person01", name: "Summy Person", authUser: authUser)
//        try personService!.savePerson(person: person)
        vehicleService?.saveVehicle(vehicle: vehicle)
        print("Se ha guardado correctamente")
    }

    @objc func changeTableView() {
        let index = vehicleTypeSegmentedController.selectedSegmentIndex
        //self.postsViewModel.input.indexSegmentedControl.accept(index)
    }
    
    //self.favouriteSegmentedControl.selectedSegmentIndex = 1
}
