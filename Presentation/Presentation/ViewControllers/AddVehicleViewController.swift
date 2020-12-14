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
        
    }
    
    private func getDateString()->String{
        formatter.dateFormat = "EEEE, d MMM"
        return formatter.string(from: date)
    }
    
    private func getHourString()-> String {
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    
    func getDay() -> Int {
        var day:Int = 0
        formatter.dateFormat = "d"
        day = Int(formatter.string(from: date))!
        formatter.dateFormat = "MM"
        day = day + Int(formatter.string(from: date))!
        return day
        
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
        
        
        let vehicle : Vehicle = try Vehicle(day: getDay(), hour: getHour(), plate: "ABC-123", type: "car", cylinderCapacity: 3000)

        
        
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
