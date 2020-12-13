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
    @IBOutlet var vehiclesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        vehicles.append(car)
    }
    var vehicles = [Vehicle]()
    let car = Vehicle(day: 5, hour: 3, plate: "ABC-123", type: "car")
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addVehicleSegue" {
            let VehicleVC = segue.destination as! AddVehicleViewController
            VehicleVC.vehicle = sender as? Vehicle
        }
        
        
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
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vehicle = vehicles[indexPath.row]
        performSegue(withIdentifier: "addVehicleSegue", sender: vehicle)
    }
}
