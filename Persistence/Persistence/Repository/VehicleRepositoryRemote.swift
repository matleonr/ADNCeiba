//
//  VehicleRepositoryRemote.swift
//  Persistence
//
//  Created by Matt Leon on 11/12/20.
//

import Domain
//import SQLite

public class VehicleRepositoryRemote: VehicleRepository {
    
    public func isThereCapacityByType(vehicleType: String) -> Bool {
        if vehicleType == "car" {
            if getCars()?.count ?? 0 >= 20 {
                return false
            }
            return true
        }
        if getBykes()?.count ?? 0 >= 10 {
            return false
        }
        
        return true
    }
    
    
    
    public func getVehiclesBy(vehicleType: String) -> [Vehicle] {
        let vehicles = [Vehicle]()
        return vehicles
    }
    
    public func create(vehicle: Vehicle) -> Bool {
        if isThereCapacityByType(vehicleType: vehicle.getType()) {
            return true
        }
        return false
    }
    
    public func getTotalPrice(plate: String) -> Int {
        return 30000
    }
    
    public func getVehicles() -> [Vehicle] {
        let vehicles = [Vehicle]()
        return vehicles
    }
    
    public func getVehicle(vehicleplate: String) -> Vehicle? {
        let vehicle = Vehicle(day: 1, hour: 2, plate: "ABC-123", type: "car", cylinderCapacity: 3000)
        return vehicle
    }
    
    public func getCars() -> [Vehicle]? {
        let vehicles = [Vehicle]()
        return vehicles
    }
    
    public func getBykes() -> [Vehicle]? {
        let vehicles = [Vehicle]()
        return vehicles
    }
    
    public func delete(vehiclePlate: String) {
        
    }
    
    public func vehicleAlreadyExists(vehiclePlate: String) -> Bool {
        return false
    }
    
//    var ParkingDB: Connection!
//    var path: String = "parking.sqlite3"
//    let Vehicles = Table("vehicles")
//
//    let id = Expression<Int>("id")
//    let plate = Expression<String>("plate")
//    let dayIn = Expression<Int>("dayin")
//    let hourIn = Expression<Int>("hourIn")
//    let type = Expression<String>("type")
//    let hourPrice = Expression<Int>("hourprice")
//    let dayPrice = Expression<Int>("dayprice")
//    let cylinderCapacity = Expression<Int>("cylindercapacity")
//
    public init() {
        //ParkingDB = createDatabase()
        //createTableVehicles()
    }
//
//    public func getTotalPrice(plate: String) {
//    }
//
//    public func getVehiclesBy(vehicleType: String) -> [Vehicle] {
//        var vehiclesArray = [Vehicle]()
//        let vehiclesFromDb = Vehicles.filter(type == vehicleType)
//
//        do {
//            let vehicles = try ParkingDB.prepare(vehiclesFromDb)
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
//    func createDatabase() -> Connection! {
//        do {
//            let filepath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathExtension(path)
//
//            let db = try Connection(filepath.path)
//            print("database created with path \(filepath.path)")
//            return db
//        } catch {
//            print(error)
//            return nil
//        }
//    }
//
//    func createTableVehicles() {
//        let tableToCreate = Vehicles.create { table in
//            table.column(id, primaryKey: true)
//            table.column(plate)
//            table.column(dayIn)
//            table.column(hourIn)
//            table.column(hourPrice)
//            table.column(dayPrice)
//            table.column(type)
//            table.column(cylinderCapacity)
//        }
//
//        do {
//            try ParkingDB.run(tableToCreate)
//            print("table created hellyeah")
//        } catch {
//            print(error)
//        }
//    }
//
//    public func vehicleAlreadyExists(vehiclePlate: String) -> Bool {
//        var validate = false
//        let vehicleFromDb = Vehicles.filter(plate == vehiclePlate)
//        var vehiclesGetted = [Vehicle]()
//        do {
//            for vehicleGetted in try ParkingDB.prepare(vehicleFromDb) {
//                let vehicle = Vehicle(day: vehicleGetted[dayIn], hour: vehicleGetted[hourIn], plate: vehicleGetted[plate], type: vehicleGetted[type])
//                vehicle.setCylinderCapacity(cylinderCapacity: vehicleGetted[cylinderCapacity])
//                vehiclesGetted.append(vehicle)
//            }
//
//        } catch {
//            print(error)
//        }
//
//        if vehiclesGetted.count > 0 {
//            validate = true
//        }
//        return validate
//    }
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
