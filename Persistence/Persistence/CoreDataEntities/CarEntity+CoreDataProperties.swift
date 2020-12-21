//
//  CarEntity+CoreDataProperties.swift
//  
//
//  Created by Mateo Léon Restrepo - Ceiba Software on 18/12/20.
//
//

import Foundation
import CoreData


extension CarEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CarEntity> {
        return NSFetchRequest<CarEntity>(entityName: "CarEntity")
    }

    @NSManaged public var plate: String?
    @NSManaged public var dayIn: Int64
    @NSManaged public var hourIn: Int64

}
