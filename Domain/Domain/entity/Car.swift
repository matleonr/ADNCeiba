//
//  Car.swift
//  Domain
//
//  Created by Matt Leon on 10/12/20.
//

import Foundation

public class Car: Vehicle {
    
    public init() {
        self.setHourPrice(hourPrice: 1000)
        self.setDayPrice(dayPrice: 8000)
    }
}
