//
//  VehicleService.swift
//  Domain
//
//  Created by Matt Leon on 11/12/20.
//

import Foundation

public class VehicleService {
    private let vehicleRepository: VehicleRepository

    public init(vehicleRepository: VehicleRepository) {
        self.vehicleRepository = vehicleRepository
    }

    public func getTotalprice() {
    }

    public func saveVehicle(vehicle: Vehicle) {
        
        if vehicleRepository.vehicleAlreadyExists(vehiclePlate: vehicle.getPlate()) {
            print("vehicle alreadyexists")
        }else {
            vehicleRepository.create(vehicle: vehicle)
        }
    
    }
    
    public func getVehicles() -> [Vehicle] {
        return vehicleRepository.getVehicles()
    }
    
    public func deleteVehicle(plate: String) {
        return vehicleRepository.delete(vehiclePlate: plate)
    }


}
