//
//  CheckoutVehicleViewController.swift
//  Presentation
//
//  Created by Mateo Léon Restrepo - Ceiba Software on 17/12/20.
//

import UIKit
import Domain

class CheckoutVehicleViewController: UIViewController {

    @IBOutlet weak var vehicleTypeImage: UIImageView!
    @IBOutlet weak var plateLabel: UILabel!
    @IBOutlet weak var dayInLabel: UILabel!
    @IBOutlet weak var dayOutLabel: UILabel!
    @IBOutlet weak var timeInLabel: UILabel!
    @IBOutlet weak var timeOutLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBAction func checkoutButton(_ sender: Any) {
        checkoutVehicle(plate: (vehicle?.getPlate())!)
    }
    
    func checkoutVehicle(plate:String) {
    
        if  searchVehicleType() == "car" {
            if (vehicleService?.deleteCar(plate: plate))! {
                _ = navigationController?.popViewController(animated: true)
            }else{
                print("no se pudo eliminar el carro")
            }
        }else{
            if (vehicleService?.deleteByke(plate: plate))! {
                _ = navigationController?.popViewController(animated: true)
            }else{
                print("no se pudo eliminar la moto")
            }
        }
        
    }
    
    var vehicle : Vehicle?
    private let date = Date()
    private let formatter = DateFormatter()
    private var vehicleService: VehicleService?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        vehicleService = appDelegate.diContainer.getContainer().resolve(VehicleService.self)!
        setUI()
        
    }
    
    func setUI() {
        formatter.dateFormat = "MM"
        setVehicleTypeImage(vehicleType: searchVehicleType())
        plateLabel.text = vehicle?.getPlate()
        dayInLabel.text = String(((vehicle?.getDayIn())!-Int(formatter.string(from: date))!) )
        timeInLabel.text = String((vehicle?.getHourIn())!)
        timeOutLabel.text = getHourString()
        dayOutLabel.text = getDateString()
        priceLabel.text = "$ \(getTotalPrice())"
    }
    
    func setVehicleTypeImage(vehicleType: String) {
        if vehicleType == "car" {
            vehicleTypeImage.image = UIImage(systemName: "car.fill")
        } else {
            vehicleTypeImage.image = UIImage(named: "byke")
        }
    }
    
    func  searchVehicleType() -> String {
        if (vehicleService?.bykeAlreadyExists(plate: (vehicle?.getPlate() ?? "")))! {
            return "byke"
        }
        
        if (vehicleService?.carAlreadyExits(plate: (vehicle?.getPlate() ?? "")))!{
            return "car"
        }
        
        return "byke"
    }
    
    private func getDateString() -> String {
        formatter.dateFormat = "EEEE, d MMM"
        return formatter.string(from: date)
    }

    private func getHourString() -> String {
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    func getTotalPrice() -> Int {
        if searchVehicleType() == "car" {
            return (vehicleService?.getTotalPriceCar(plate: (vehicle?.getPlate())!))!
        }
        return (vehicleService?.getTotalPriceByke(plate: (vehicle?.getPlate())!))!
    }

}
