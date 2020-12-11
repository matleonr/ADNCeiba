//
//  Byke.swift
//  Domain
//
//  Created by Matt Leon on 10/12/20.
//

import Foundation

public class Byke: Vehicle {
    
    private var cylinderCapacity: Int
    
    public init() {
        self.setHourPrice(hourPrice: 500)
        self.setDayPrice(dayPrice: 4000)
    }
    
    public func getCylinderCapacity() -> String {
        return cylinderCapacity
    }
    
    public func setCylinderCapacity(cylinderCapacity: Int) {
        self.cylinderCapacity = cylinderCapacity
    }
}
