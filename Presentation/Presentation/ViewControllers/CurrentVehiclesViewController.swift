//
//  CurrentVehiclesViewController.swift
//  Presentation
//
//  Created by Matt Leon on 11/12/20.
//

import Domain
import UIKit

class CurrentVehiclesViewController: UIViewController {
    @IBOutlet var addVehicleBarButton: UIBarButtonItem!
    @IBAction func addVehicleBarButtonAction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "addVehicleSegue", sender: nil)
        
    }
    @IBOutlet var vehiclesTableView: UITableView!
    
    private var vehicleService: VehicleService?
    var vehicles = [Vehicle]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        vehicleService = appDelegate.diContainer.getContainer().resolve(VehicleService.self)!
        setUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        setUI()
        vehiclesTableView.reloadData()
        
    }
    
    func setUI() {
        
        vehicles = vehicleService?.getVehicles() ?? [Vehicle]()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "checkoutVehicleSegue" {
            
            let VehicleVC = segue.destination as! CheckoutVehicleViewController
            VehicleVC.vehicle = sender as? Vehicle
        
        }

    }
    
    func  searchVehicleType(vehicle: Vehicle) -> String {
        
        if (vehicleService?.bykeAlreadyExists(plate: (vehicle.getPlate() )))! {
        
            return "byke"
        
        }
        
        if (vehicleService?.carAlreadyExits(plate: (vehicle.getPlate() )))!{
         
            return "car"
        
        }
        
        return "byke"
        
    }
    
}

extension CurrentVehiclesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return vehicles.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let vehicle = vehicles[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "VehicleTableViewCell") as! VehicleTableViewCell
        cell.set(vehicle: vehicle)
        cell.setImageType(vehicleType: searchVehicleType(vehicle: vehicle))
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vehicle = vehicles[indexPath.row]
        performSegue(withIdentifier: "checkoutVehicleSegue", sender: vehicle)
        
    }
    
}
