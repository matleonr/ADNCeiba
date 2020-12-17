//
//  fakeSuccessfullVehicleRepository.swift
//  PresentationTests
//
//  Created by Mateo Léon Restrepo - Ceiba Software on 16/12/20.
//

import Foundation
import Domain

class fakeSuccessfullVehicleRepository: VehicleRepository {
    func isThereCapacityByType(vehicleType: String) -> Bool {
        return true
    }

    func getVehiclesBy(vehicleType: String) -> [Vehicle] {
        var vehicles = [Vehicle]()
        let vehicle1 = Vehicle(day: 22, hour: 12, plate: "ABC-123", type: vehicleType, cylinderCapacity: 3000)
        let vehicle2 = Vehicle(day: 4, hour: 13, plate: "JWD-294", type: vehicleType, cylinderCapacity: 250)
        let vehicle3 = Vehicle(day: 7, hour: 17, plate: "HBA-284", type: vehicleType, cylinderCapacity: 1000)
        let vehicle4 = Vehicle(day: 2, hour: 2, plate: "GNR-527", type: vehicleType, cylinderCapacity: 500)

        vehicles.append(vehicle1)
        vehicles.append(vehicle2)
        vehicles.append(vehicle3)
        vehicles.append(vehicle4)
        return vehicles
    }

    func create(vehicle: Vehicle) -> Bool {
        if isThereCapacityByType(vehicleType: vehicle.getType()) {
            print("vehicle created")
            return true
        }
        return false
    }

    func getTotalPrice(plate: String) -> Int {
        return 30000
    }

    func getVehicles() -> [Vehicle] {
        var vehicles = [Vehicle]()
        let vehicle1 = Vehicle(day: 2, hour: 12, plate: "ABC-123", type: "car", cylinderCapacity: 3000)
        let vehicle2 = Vehicle(day: 4, hour: 13, plate: "JWD-294", type: "byke", cylinderCapacity: 250)
        let vehicle3 = Vehicle(day: 7, hour: 17, plate: "HBA-284", type: "car", cylinderCapacity: 1000)
        let vehicle4 = Vehicle(day: 2, hour: 2, plate: "GNR-527", type: "byke", cylinderCapacity: 500)

        vehicles.append(vehicle1)
        vehicles.append(vehicle2)
        vehicles.append(vehicle3)
        vehicles.append(vehicle4)
        return vehicles
    }

    func getVehicle(vehicleplate: String) -> Vehicle? {
        let vehicle = Vehicle(day: 22, hour: 12, plate: vehicleplate, type: "car", cylinderCapacity: 3000)
        return vehicle
    }

    func getCars() -> [Vehicle]? {
        let vehicles = [Vehicle]()
        return vehicles
    }

    func getBykes() -> [Vehicle]? {
        let vehicles = [Vehicle]()
        return vehicles
    }

    func delete(vehiclePlate: String) {
    }

    func vehicleAlreadyExists(vehiclePlate: String) -> Bool {
        return false
    }
}

