//
//  VehicleRepository.swift
//  Domain
//
//  Created by Matt Leon on 11/12/20.
//

import Foundation

public protocol VehicleRepository {
    
    func getVehiclesBy(type: String) -> [Vehicle]
    
    func saveVehicle(vehicle: Vehicle)
}
