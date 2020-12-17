//
//  VehicleRepositoryRemote.swift
//  Persistence
//
//  Created by Mateo Léon Restrepo - Ceiba Software on 17/12/20.
//

import Domain

public class VehicleRepositoryRemote: VehicleRepository {
    
    public init() {
    }

    public func isThereCapacityByType(vehicleType: String) -> Bool {
        if vehicleType == "car" {
            if getCars().count >= 20 {
                return false
            }
            return true
        }
        if getBykes().count >= 10 {
            return false
        }

        return true
    }

    public func getVehiclesByType(vehicleType: String) -> [Vehicle] {
        let vehicles = [Vehicle]()
        return vehicles
    }

    public func createVehicle(vehicle: Vehicle) -> Bool {
        if isThereCapacityByType(vehicleType: vehicle.getType()) {
            CoreDataManager.shared.createVehicle(plate: vehicle.getPlate(), dayIn: Int64(vehicle.getDayIn()), hourIn: Int64(vehicle.getHourIn()), cylinderCapacity: Int64(vehicle.getCylinderCapacity()), type: vehicle.getType())

            return true
        }
        return false
    }

    public func getTotalPrice(plate: String) -> Int {
        return 30000
    }

    public func getVehicles() -> [Vehicle] {
        var vehicles = [Vehicle]()
        vehicles = CoreDataManager.shared.fetch()
        return vehicles
    }

    public func getVehicleByPlate(vehicleplate: String) -> Vehicle? {
        let vehicle = CoreDataManager.shared.fetchByPlate(plate: vehicleplate)
        return vehicle
    }

    public func getCars() -> [Vehicle] {
        let vehicles = CoreDataManager.shared.getVehiclesByType(type: "car")
        return vehicles
    }

    public func getBykes() -> [Vehicle] {
        let vehicles = CoreDataManager.shared.getVehiclesByType(type: "byke")
        return vehicles
    }

    public func delete(vehiclePlate: String) -> Bool {
        if vehicleAlreadyExists(vehiclePlate: vehiclePlate) {
            if CoreDataManager.shared.deleteVehicleByPlate(plate: vehiclePlate) {
                return true
            }
            return false
        }
        return false
    }

    public func vehicleAlreadyExists(vehiclePlate: String) -> Bool {
        let vehicle = CoreDataManager.shared.fetchByPlate(plate: vehiclePlate)
        if !(vehicle.getPlate().isEmpty) {
            return true
        }
        return false
    }





 
//
//    public func create(vehicle: Vehicle) {
//        let vehicleToInsert = Vehicles.insert(plate <- vehicle.getPlate(), dayIn <- vehicle.getDayIn(), hourIn <- vehicle.getHourIn(), hourPrice <- vehicle.getPriceByHour()!, dayPrice <- vehicle.getPriceByDay()!, type <- vehicle.getType(), cylinderCapacity <- vehicle.getCylinderCapacity())
//        do {
//            try ParkingDB.run(vehicleToInsert)
//
//            print("vehicle registered successfully")
//        } catch {
//            print(error)
//        }
//    }
//
//    public func getVehicles() -> [Vehicle] {
//        var vehiclesArray = [Vehicle]()
//
//        do {
//            let vehicles = try ParkingDB.prepare(Vehicles)
//
//            for vehicle in vehicles {
//                let vehicleScoped = Vehicle(day: vehicle[dayIn], hour: vehicle[hourIn], plate: vehicle[plate], type: vehicle[type])
//
//                vehicleScoped.setCylinderCapacity(cylinderCapacity: vehicle[cylinderCapacity])
//
//                vehiclesArray.append(vehicleScoped)
//            }
//            return vehiclesArray
//        } catch {
//            print(error)
//            return vehiclesArray
//        }
//    }
//
//    public func getVehicle(vehicleplate: String) -> Vehicle? {
//        let vehicleFromDb = Vehicles.filter(plate == vehicleplate)
//        var vehicle: Vehicle?
//        do {
//            for vehicleGetted in try ParkingDB.prepare(vehicleFromDb) {
//                vehicle = Vehicle(day: vehicleGetted[dayIn], hour: vehicleGetted[hourIn], plate: vehicleGetted[plate], type: vehicleGetted[type])
//                vehicle?.setCylinderCapacity(cylinderCapacity: vehicleGetted[cylinderCapacity])
//                return vehicle
//            }
//
//        } catch {
//            print(error)
//        }
//        return vehicle
//    }
//
//    public func getCars() -> Vehicle? {
//        let vehicleFromDb = Vehicles.filter(type == "car")
//        var vehicle: Vehicle?
//        do {
//            for vehicleGetted in try ParkingDB.prepare(vehicleFromDb) {
//                vehicle = Vehicle(day: vehicleGetted[dayIn], hour: vehicleGetted[hourIn], plate: vehicleGetted[plate], type: vehicleGetted[type])
//                vehicle?.setCylinderCapacity(cylinderCapacity: vehicleGetted[cylinderCapacity])
//                return vehicle
//            }
//
//        } catch {
//            print(error)
//        }
//        return vehicle
//    }
//
//    public func getBykes() -> Vehicle? {
//        let vehicleFromDb = Vehicles.filter(type == "byke")
//        var vehicle: Vehicle?
//        do {
//            for vehicleGetted in try ParkingDB.prepare(vehicleFromDb) {
//                vehicle = Vehicle(day: vehicleGetted[dayIn], hour: vehicleGetted[hourIn], plate: vehicleGetted[plate], type: vehicleGetted[type])
//                vehicle?.setCylinderCapacity(cylinderCapacity: vehicleGetted[cylinderCapacity])
//                return vehicle
//            }
//
//        } catch {
//            print(error)
//        }
//        return vehicle
//    }
//
//    public func delete(vehiclePlate: String) {
//        let vehicleFromDb = Vehicles.filter(plate == vehiclePlate)
//        let vehicleDelete = vehicleFromDb.delete()
//        do {
//            try ParkingDB.run(vehicleDelete)
//        } catch {
//            print(error)
//        }
//    }
}
