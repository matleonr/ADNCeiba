//
//  Vehicle.swift
//  Domain
//
//  Created by Matt Leon on 10/12/20.
//

import Foundation

public class Vehicle {
    
    private var plate: String
    private var hourPrice: Int
    private var dayPrice: Int
    private var hourIn: Int
    private var dayIn: Int
    
    public init(day: Int, hour: Int, plate: String) {
        self.dayIn = day
        self.hourIn = hour
        self.plate = plate
    }
    
    public func getPlate() -> String {
        return plate
    }
    
    public func getPriceByHour(hours: Int) -> String? {
        return hourPrice * hours
        //TODO Hacer calculo de horas en el parqueadero
    }
    
    public func setHourPrice(hourPrice: Int) {
        self.hourPrice = hourPrice
    }
    
    public func getPriceByDay(days: Int) -> String? {
        return dayPrice * days
        //TODO Hacer calculo de horas en el parqueadero
    }
    
    public func setDayPrice(dayPrice: Int) {
        self.dayPrice = dayPrice
    }
    
}
