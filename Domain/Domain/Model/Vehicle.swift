//
//  Vehicle.swift
//  Domain
//
//  Created by Matt Leon on 10/12/20.
//

import Foundation

public class Vehicle {
    private var plate: String
    private var hourPrice: Int?
    private var dayPrice: Int?
    private var hourIn: Int
    private var dayIn: Int
    private var type: String
    private var cylinderCapacity: Int?

    public init(day: Int, hour: Int, plate: String, type: String) {
        dayIn = day
        hourIn = hour
        self.plate = plate
        self.type = type
        setPrices(type: type)
        validateAuthorizationByPlate()
    }
    // MARK: Plate
    public func getPlate() -> String {
        return plate
    }
    
    private func setPrices(type: String) {
        if type == "car" {
            self.setHourPrice(hourPrice: 1000)
            self.setDayPrice(dayPrice: 8000)
        } else {
            self.setHourPrice(hourPrice: 500)
            self.setDayPrice(dayPrice: 4000)
        }
    }
    
    // MARK: HourPrice
    public func getPriceByHour() -> Int? {
        return hourPrice!
    }

    private func setHourPrice(hourPrice: Int) {
        self.hourPrice = hourPrice
    }
    // MARK: DayPrice
    public func getPriceByDay() -> Int? {
        return self.dayPrice
    }

    private func setDayPrice(dayPrice: Int) {
        self.dayPrice = dayPrice
    }
    // MARK: CylinderCapacity
    public func getCylinderCapacity() -> Int {
        return cylinderCapacity!
    }

    public func setCylinderCapacity(cylinderCapacity: Int) {
        self.cylinderCapacity = cylinderCapacity
    }
    // MARK: Date in
    
    public func getDayIn() -> Int{
        return self.dayIn
    }
    
    public func getHourIn() -> Int{
        return self.hourIn
    }
    // MARK: type
    
    public func getType() -> String {
        return self.type
    }
    
   
    
    private func validateAuthorizationByPlate() -> Bool{
        if getDayOfWeek() == 4 {
            return false
        }
        return true
    }
    
    
    private func getDayOfWeek() -> Int{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let today = formatter.string(from: date)
        let todayDate = formatter.date(from: today)
        formatter.dateFormat = "e" // "eeee" -> Friday
        let weekDay = formatter.string(from: todayDate!)
        return Int(weekDay)!
    }
    
    
    
}
