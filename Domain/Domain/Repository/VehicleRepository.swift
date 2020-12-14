//
//  VehicleRepository.swift
//  Domain
//
//  Created by Matt Leon on 11/12/20.
//

import Foundation

public protocol VehicleRepository {
    
    func getVehiclesBy(vehicleType: String) -> [Vehicle]
    
    func create(vehicle: Vehicle)
    
    func getTotalPrice(plate: String)
    
    func getVehicles() -> [Vehicle]
    
    func getVehicle(vehicleplate: String) -> Vehicle?
    
    func getCars() -> Vehicle?
    
    func getBykes() -> Vehicle?
    
    func delete(vehiclePlate: String)
    
    func vehicleAlreadyExists(vehiclePlate: String) -> Bool
}
