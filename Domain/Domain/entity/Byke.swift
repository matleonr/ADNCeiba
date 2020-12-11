//
//  Byke.swift
//  Domain
//
//  Created by Matt Leon on 10/12/20.
//

import Foundation

public class Byke: Vehicle {
    
    private var cylinderCapacity: Int
    
    public func getCylinderCapacity() -> String {
        return cylinderCapacity
    }
    
    public func setCylinderCapacity(cylinderCapacity: Int) {
        self.cylinderCapacity = cylinderCapacity
    }
}
