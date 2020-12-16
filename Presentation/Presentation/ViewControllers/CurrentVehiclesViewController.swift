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
//        vehicleService = appDelegate.diContainer.getContainer().resolve(VehicleService.self)!
        
        setUI()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        setUI()
//        //updateTable()
//    }
    
    func setUI() {
        vehicles = vehicleService?.getVehicles() ?? [Vehicle]()
        
    }
    
//    func updateTable() {
//        let indexPath = IndexPath(row: vehicles.count - 1, section: 0)
//
//        vehiclesTableView.beginUpdates()
//        vehiclesTableView.insertRows(at: [indexPath], with: .automatic)
//        vehiclesTableView.endUpdates()
//    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "addVehicleSegue" {
//            let VehicleVC = segue.destination as! AddVehicleViewController
//            VehicleVC.vehicle = sender as? Vehicle
//        }
//
//
//    }
    
}

extension CurrentVehiclesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vehicle = vehicles[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "VehicleTableViewCell") as! VehicleTableViewCell
        cell.set(vehicle: vehicle)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vehicle = vehicles[indexPath.row]
//        performSegue(withIdentifier: "addVehicleSegue", sender: vehicle)
    }
}
