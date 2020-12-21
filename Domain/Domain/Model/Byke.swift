//
//  Byke.swift
//  Domain
//
//  Created by Mateo Léon Restrepo - Ceiba Software on 17/12/20.
//

import Foundation

public class Byke: Vehicle {
    
    private var cylinderCapacity: Int = 0

    public init(day: Int, hour: Int, plate: String, cylinderCapacity: Int) {
        
        super.init(day: day, hour: hour, plate: plate)
        self.cylinderCapacity = cylinderCapacity
        setPrices()
        
    }

    public func getCylinderCapacity() -> Int {
        
        return cylinderCapacity
        
    }

    public func cylinderCapacityOver500() -> Bool {
        
        return cylinderCapacity > 500
    
    }

    private func setPrices() {
        
        setHourPrice(hourPrice: 500)
        setDayPrice(dayPrice: 4000)
    
    }

}
