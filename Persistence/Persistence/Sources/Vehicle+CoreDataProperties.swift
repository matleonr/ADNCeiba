//
//  Vehicle+CoreDataProperties.swift
//  Persistence
//
//  Created by Mateo Léon Restrepo - Ceiba Software on 17/12/20.
//
//

import Foundation
import CoreData


extension VehicleEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VehicleEntity> {
        return NSFetchRequest<VehicleEntity>(entityName: "VehicleEntity")
    }

    @NSManaged public var cylinderCapacity: Int64
    @NSManaged public var dayIn: Int64
    @NSManaged public var hourIn: Int64
    @NSManaged public var plate: String?
    @NSManaged public var type: String?

}

extension VehicleEntity : Identifiable {

}
