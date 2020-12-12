//
//  VehicleRepositoryRemote.swift
//  Persistence
//
//  Created by Matt Leon on 11/12/20.
//

import Domain
import SQLite

public class VehicleRepositoryRemote: VehicleRepository {
    public func getVehiclesBy(type: String) -> [Vehicle] {
        let vehicles = [Vehicle]()
        return vehicles
    }

    public func saveVehicle(vehicle: Vehicle) {
    }

    public init() {
        ParkingDB = createDatabase()
        createTableVehicles()
    }

    var ParkingDB: Connection!
    var path: String = "parking.sqlite3"
    let Vehicles = Table("vehicles")

    let id = Expression<Int>("id")
    let plate = Expression<String>("plate")
    let dayIn = Expression<Int>("dayin")
    let hourIn = Expression<Int>("hourIn")
    let type = Expression<String>("type")
    let hourPrice = Expression<Int>("hourprice")
    let dayPrice = Expression<Int>("dayprice")
    let cylinderCapacity = Expression<Int>("cylindercapacity")

    func createDatabase() -> Connection! {
        do {
            let filepath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathExtension(path)

            let db = try Connection(filepath.path)
            print("database created with path \(filepath.path)")
            return db
        } catch {
            print(error)
            return nil
        }
    }

    func createTableVehicles() {
        let tableToCreate = Vehicles.create { table in
            table.column(id, primaryKey: true)
            table.column(plate)
            table.column(dayIn)
            table.column(hourIn)
            table.column(hourPrice)
            table.column(dayPrice)
            table.column(type)
            table.column(cylinderCapacity)
        }

        do {
            try ParkingDB.run(tableToCreate)
            print("table created hellyeah")
        } catch {
            print(error)
        }
    }

    func create(vehicle: Vehicle) {
        let vehicleToInsert = Vehicles.insert(plate <- vehicle.getPlate(), dayIn <- vehicle.getDayIn(), hourIn <- vehicle.getHourIn(), hourPrice <- vehicle.getPriceByHour()!, dayPrice <- vehicle.getPriceByDay()!, type <- vehicle.getType(), cylinderCapacity <- vehicle.getCylinderCapacity())
        do {
            try ParkingDB.run(vehicleToInsert)

            print("vehicle registered successfully")
        } catch {
            print(error)
        }
    }

    func getVehicles() -> [Vehicle] {
        var vehiclesArray = [Vehicle]()

        do {
            let vehicles = try ParkingDB.prepare(Vehicles)

            for vehicle in vehicles {

                let vehicleScoped = Vehicle(day: vehicle[dayIn], hour: vehicle[hourIn], plate: vehicle[plate], type: vehicle[type])
                
                vehicleScoped.setCylinderCapacity(cylinderCapacity: vehicle[cylinderCapacity])
                    

                vehiclesArray.append(vehicleScoped)
            }
            return vehiclesArray
        } catch {
            print(error)
            return vehiclesArray
        }
    }

    func getVehicles(vehicleplate: String) -> Vehicle? {
        let vehicleFromDb = Vehicles.filter(plate == vehicleplate)
        var vehicle: Vehicle?
        do {
            for vehicleGetted in try ParkingDB.prepare(vehicleFromDb) {
                vehicle = Vehicle(day: vehicleGetted[dayIn], hour: vehicleGetted[hourIn], plate: vehicleGetted[plate], type: vehicleGetted[type])
                vehicle?.setCylinderCapacity(cylinderCapacity: vehicleGetted[cylinderCapacity])
                return vehicle
            }

        } catch {
            print(error)
        }
        return vehicle
    }
    
    func getCars() -> Vehicle? {
        let vehicleFromDb = Vehicles.filter(type == "car")
        var vehicle: Vehicle?
        do {
            for vehicleGetted in try ParkingDB.prepare(vehicleFromDb) {
                vehicle = Vehicle(day: vehicleGetted[dayIn], hour: vehicleGetted[hourIn], plate: vehicleGetted[plate], type: vehicleGetted[type])
                vehicle?.setCylinderCapacity(cylinderCapacity: vehicleGetted[cylinderCapacity])
                return vehicle
            }

        } catch {
            print(error)
        }
        return vehicle
    }
    
    func getBykes() -> Vehicle? {
        let vehicleFromDb = Vehicles.filter(type == "byke")
        var vehicle: Vehicle?
        do {
            for vehicleGetted in try ParkingDB.prepare(vehicleFromDb) {
                vehicle = Vehicle(day: vehicleGetted[dayIn], hour: vehicleGetted[hourIn], plate: vehicleGetted[plate], type: vehicleGetted[type])
                vehicle?.setCylinderCapacity(cylinderCapacity: vehicleGetted[cylinderCapacity])
                return vehicle
            }

        } catch {
            print(error)
        }
        return vehicle
    }
    

    func delete(vehicle: Vehicle) {
        let vehicleFromDb = Vehicles.filter(plate == vehicle.getPlate())
        let vehicleDelete = vehicleFromDb.delete()
        do {
            try ParkingDB.run(vehicleDelete)
        } catch {
            print(error)
        }
    }
}
