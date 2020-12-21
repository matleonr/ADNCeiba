//
//  VehicleTranslator.swift
//  Persistence
//
//  Created by Mateo Léon Restrepo - Ceiba Software on 18/12/20.
//

import Domain
import CoreData

public class VehicleTranslator {
    
    func fromBykeToBykeEntity(byke: Byke, context: NSManagedObjectContext) -> BykeEntity {
        
        let bykeEntity = BykeEntity(context: context)
        
        bykeEntity.cylinderCapacity = Int64(byke.getCylinderCapacity())
        bykeEntity.plate = byke.getPlate()
        bykeEntity.hourIn = Int64(byke.getHourIn())
        bykeEntity.dayIn = Int64(byke.getDayIn())
        
        return bykeEntity
    }
    
    func fromCarToCarEntity(car: Car, context: NSManagedObjectContext) -> CarEntity {
        
        let carEntity = CarEntity(context: context)
        
        carEntity.plate = car.getPlate()
        carEntity.dayIn = Int64(car.getDayIn())
        carEntity.hourIn = Int64(car.getHourIn())
        
        return carEntity
        
    }
    
    func fromBykeEntityToByke(bykeEntity: BykeEntity) -> Byke {
        
        let byke = Byke(day: Int(bykeEntity.dayIn), hour: Int(bykeEntity.hourIn), plate: bykeEntity.plate ?? "", cylinderCapacity: Int(bykeEntity.cylinderCapacity))
        return byke
    }
    
    func fromCarEntityToCar(carEntity: CarEntity) -> Car {
        
        let car = Car(day: Int(carEntity.dayIn), hour: Int(carEntity.hourIn), plate: carEntity.plate ?? "")
        return car
        
    }
    
}
