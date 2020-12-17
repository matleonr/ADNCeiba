//
//  CoreDataManager.swift
//  Persistence
//
//  Created by Mateo Léon Restrepo - Ceiba Software on 17/12/20.
//

import CoreData
import Foundation
import Domain

// 1.
public class CoreDataManager {
    // 2.
    public static let shared = CoreDataManager()

    // 3.
    let identifier: String = "mattdevs.Persistence" // Your framework bundle ID
    let model: String = "VehicleDataModel" // Model name

    // 4.
    lazy var persistentContainer: NSPersistentContainer = {
        // 5
        let messageKitBundle = Bundle(identifier: self.identifier)
        let modelURL = messageKitBundle!.url(forResource: self.model, withExtension: "momd")!
        let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL)

        // 6.
        let container = NSPersistentContainer(name: self.model, managedObjectModel: managedObjectModel!)
        container.loadPersistentStores { _, error in

            if let err = error {
                fatalError("❌ Loading of store failed:\(err)")
            }
        }

        return container
    }()

    public func createVehicle(plate: String, dayIn: Int64, hourIn: Int64, cylinderCapacity: Int64, type: String) {
        let context = persistentContainer.viewContext
        let vehicleToSave = NSEntityDescription.insertNewObject(forEntityName: "VehicleEntity", into: context) as! VehicleEntity

        vehicleToSave.plate = plate
        vehicleToSave.dayIn = dayIn
        vehicleToSave.hourIn = hourIn
        vehicleToSave.type = type
        vehicleToSave.cylinderCapacity = cylinderCapacity

        do {
            try context.save()
            print("✅ Vehicle saved succesfuly")

        } catch let error {
            print("❌ Failed to create Vehicle: \(error.localizedDescription)")
        }
    }

    public func fetch() -> [Vehicle]{
        let context = persistentContainer.viewContext
        var vehiclesGetted = [Vehicle]()
        let fetchRequest = NSFetchRequest<VehicleEntity>(entityName: "VehicleEntity")

        do {
            let vehicles = try context.fetch(fetchRequest)

            for vehicle in vehicles {
                print(vehicle.plate!)
                let vehicleGetted = Vehicle(day: Int(vehicle.dayIn), hour: Int(vehicle.hourIn), plate: vehicle.plate!, type: vehicle.type!, cylinderCapacity: Int(vehicle.cylinderCapacity))
                vehiclesGetted.append(vehicleGetted)
            }

        } catch let fetchErr {
            print("❌ Failed to fetch Vehicle:", fetchErr)
        }
        
        return vehiclesGetted
    }
    
    func deleteVehicleByPlate(plate: String) -> Bool {
        let context = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<VehicleEntity>(entityName: "VehicleEntity")
        let predicate = NSPredicate(format: "plate CONTAINS %@", plate)
        fetchRequest.predicate = predicate
        let vehiclesGetted = try! context.fetch(fetchRequest)
        for vehicle in vehiclesGetted {
            context.delete(vehicle)
            do{
                try context.save()
                return true
            }
            catch{
                return false
            }
        }
        return false
        
        
    }
    
    public func fetchByPlate(plate: String) -> Vehicle{
        
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<VehicleEntity>(entityName: "VehicleEntity")
        let predicate = NSPredicate(format: "plate CONTAINS %@", plate)
        fetchRequest.predicate = predicate
        let vehiclesGetted = try! context.fetch(fetchRequest)
        for VehvehicleGetted in vehiclesGetted {
            
            let vehicle = Vehicle(day: Int(VehvehicleGetted.dayIn), hour: Int(VehvehicleGetted.hourIn), plate: VehvehicleGetted.plate!, type: VehvehicleGetted.type!, cylinderCapacity: Int(VehvehicleGetted.cylinderCapacity))
            return vehicle
            
        }
        
        let vehicle = Vehicle(day: 0, hour: 0, plate: "", type: "", cylinderCapacity: 0)
        
        return vehicle
        
    }
    
    public func getVehiclesByType(type:String) -> [Vehicle]{
        
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<VehicleEntity>(entityName: "VehicleEntity")
        let predicate = NSPredicate(format: "type CONTAINS %@",type)
        fetchRequest.predicate = predicate
        var vehicles = [Vehicle]()
        let vehiclesGetted = try! context.fetch(fetchRequest)
        for vehicleGetted in vehiclesGetted {
            
            let vehicle = Vehicle(day: Int(vehicleGetted.dayIn), hour: Int(vehicleGetted.hourIn), plate: vehicleGetted.plate!, type: vehicleGetted.type!, cylinderCapacity: Int(vehicleGetted.cylinderCapacity))
            vehicles.append(vehicle)
            
        }
        
        return vehicles
        
    }

}
