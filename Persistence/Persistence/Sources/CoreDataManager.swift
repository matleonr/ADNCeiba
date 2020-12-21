//
//  CoreDataManager.swift
//  Persistence
//
//  Created by Mateo Léon Restrepo - Ceiba Software on 17/12/20.
//

import CoreData
import Domain
import Foundation

// 1.
public class CoreDataManager {
    // 2.
    public static let shared = CoreDataManager()
    let translator = VehicleTranslator()

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

    public func createByke(byke: Byke) -> Bool {
        let context = persistentContainer.viewContext

        translator.fromBykeToBykeEntity(byke: byke, context: context)

        do {
            try context.save()
            print("✅ Vehicle saved succesfuly")
            return true

        } catch let error {
            print("❌ Failed to create Vehicle: \(error.localizedDescription)")
            return false
        }
    }

    public func createCar(car: Car) -> Bool {
        let context = persistentContainer.viewContext

        translator.fromCarToCarEntity(car: car, context: context)

        do {
            try context.save()
            print("✅ Vehicle saved succesfuly")
            return true

        } catch let error {
            print("❌ Failed to create Vehicle: \(error.localizedDescription)")
            return false
        }
    }

    public func fetchBykes() -> [Byke] {
        let context = persistentContainer.viewContext
        var bykesGetted = [Byke]()
        let fetchRequest = NSFetchRequest<BykeEntity>(entityName: "BykeEntity")

        do {
            let bykes = try context.fetch(fetchRequest)

            for byke in bykes {
                bykesGetted.append(translator.fromBykeEntityToByke(bykeEntity: byke))
            }

        } catch let fetchErr {
            print("❌ Failed to fetch Vehicle:", fetchErr)
        }

        return bykesGetted
    }

    public func fetchCars() -> [Car] {
        let context = persistentContainer.viewContext
        var carsGetted = [Car]()
        let fetchRequest = NSFetchRequest<CarEntity>(entityName: "CarEntity")

        do {
            let cars = try context.fetch(fetchRequest)

            for car in cars {
                carsGetted.append(translator.fromCarEntityToCar(carEntity: car))
            }

        } catch let fetchErr {
            print("❌ Failed to fetch Vehicle:", fetchErr)
        }

        return carsGetted
    }

    public func deleteBykeByPlate(plate: String) -> Bool {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<BykeEntity>(entityName: "BykeEntity")
        let predicate = NSPredicate(format: "plate CONTAINS %@", plate)

        fetchRequest.predicate = predicate

        let bykesGetted = try! context.fetch(fetchRequest)
        for byke in bykesGetted {
            context.delete(byke)
            do {
                try context.save()
                return true
            } catch {
                return false
            }
        }
        return false
    }
    
    public func deleteCarByPlate(plate: String) -> Bool {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CarEntity>(entityName: "BykeEntity")
        let predicate = NSPredicate(format: "plate CONTAINS %@", plate)

        fetchRequest.predicate = predicate

        let carsGetted = try! context.fetch(fetchRequest)
        for car in carsGetted {
            context.delete(car)
            do {
                try context.save()
                return true
            } catch {
                return false
            }
        }
        return false
    }

    public func fetchCarByPlate(plate: String) -> Car {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CarEntity>(entityName: "CarEntity")
        let predicate = NSPredicate(format: "plate CONTAINS %@", plate)

        fetchRequest.predicate = predicate

        let carsGetted = try! context.fetch(fetchRequest)
        for car in carsGetted {
            return translator.fromCarEntityToCar(carEntity: car)
        }

        let car = Car(day: 0, hour: 0, plate: "")

        return car
    }

    public func fetchBykeByPlate(plate: String) -> Byke {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<BykeEntity>(entityName: "BykeEntity")
        let predicate = NSPredicate(format: "plate CONTAINS %@", plate)

        fetchRequest.predicate = predicate

        let bykesGetted = try! context.fetch(fetchRequest)
        for byke in bykesGetted {
            return translator.fromBykeEntityToByke(bykeEntity: byke)
        }

        let byke = Byke(day: 0, hour: 0, plate: "", cylinderCapacity: 0)

        return byke
    }

}
