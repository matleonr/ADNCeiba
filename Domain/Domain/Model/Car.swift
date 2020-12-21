//
//  Car.swift
//  Domain
//
//  Created by Mateo Léon Restrepo - Ceiba Software on 17/12/20.
//

import Foundation

public class Car: Vehicle {
    
    public override init(day: Int, hour: Int, plate: String) {
        super.init(day: day, hour: hour, plate: plate)
        self.setPrices()
    }
    
    private func setPrices() {
        setHourPrice(hourPrice: 1000)
        setDayPrice(dayPrice: 8000)
    }
}
