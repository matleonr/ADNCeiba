//
//  BykeEntity+CoreDataProperties.swift
//  
//
//  Created by Mateo Léon Restrepo - Ceiba Software on 18/12/20.
//
//

import Foundation
import CoreData


extension BykeEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BykeEntity> {
        return NSFetchRequest<BykeEntity>(entityName: "BykeEntity")
    }

    @NSManaged public var cylinderCapacity: Int64
    @NSManaged public var dayIn: Int64
    @NSManaged public var hourIn: Int64
    @NSManaged public var plate: String?

}
