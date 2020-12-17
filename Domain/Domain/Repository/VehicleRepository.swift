//
//  VehicleRepository.swift
//  Domain
//
//  Created by Matt Leon on 11/12/20.
//

import Foundation

public protocol VehicleRepository {
    
    func getVehiclesByType(vehicleType: String) -> [Vehicle]
    
    func isThereCapacityByType(vehicleType: String) -> Bool
    
    func createVehicle(vehicle: Vehicle) -> Bool
    
    func getTotalPrice(plate: String) -> Int
    
    func getVehicles() -> [Vehicle]
    
    func getVehicleByPlate(vehicleplate: String) -> Vehicle?
    
    func getCars() -> [Vehicle]
    
    func getBykes() -> [Vehicle]
    
    func delete(vehiclePlate: String) -> Bool
    
    func vehicleAlreadyExists(vehiclePlate: String) -> Bool
}
