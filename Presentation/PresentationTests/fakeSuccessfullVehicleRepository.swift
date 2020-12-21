//
//  fakeSuccessfullVehicleRepository.swift
//  PresentationTests
//
//  Created by Mateo Léon Restrepo - Ceiba Software on 16/12/20.
//

import Foundation
import Domain

class fakeSuccessfullVehicleRepository: CarRepository {    
    
    func isThereCapacityByType(vehicleType: String) -> Bool {
        return true
    }

    func getVehiclesByType(vehicleType: String) -> [Vehicle] {
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

    func createVehicle(vehicle: Vehicle) -> Bool {
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

    func getVehicleByPlate(vehicleplate: String) -> Vehicle? {
        let vehicle = Vehicle(day: getDay()-1, hour: getHour()-3, plate: vehicleplate, type: "car", cylinderCapacity: 3000)
        return vehicle
    }

    func getCars() -> [Vehicle] {
        let vehicles = [Vehicle]()
        return vehicles
    }

    func getBykes() -> [Vehicle] {
        let vehicles = [Vehicle]()
        return vehicles
    }

    func delete(vehiclePlate: String) -> Bool{
        if vehicleAlreadyExists(vehiclePlate: vehiclePlate) {
            return true
        }
        return false
    }

    func vehicleAlreadyExists(vehiclePlate: String) -> Bool {
        if vehiclePlate == "BBC-123" {
            return false
        }else{
            return true
        }
        
    }
    
    func getDay() -> Int {
        let date = Date()
        let formatter = DateFormatter()
        var day: Int = 0
        formatter.dateFormat = "d"
        day = Int(formatter.string(from: date))!
        formatter.dateFormat = "MM"
        day = day + Int(formatter.string(from: date))!
        return day
    }
    
    func getHour() -> Int {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        return Int(formatter.string(from: date))!
    }
}

