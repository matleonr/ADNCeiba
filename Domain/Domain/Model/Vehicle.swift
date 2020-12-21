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

    public init(day: Int, hour: Int, plate: String) {
        self.dayIn = day
        self.hourIn = hour
        self.plate = plate
    }

    // MARK: Plate

    public func getPlate() -> String {
        return plate
    }

    // MARK: HourPrice

    public func getPriceByHour() -> Int? {
        return hourPrice!
    }

    func setHourPrice(hourPrice: Int) {
        self.hourPrice = hourPrice
    }

    // MARK: DayPrice
    public func getPriceByDay() -> Int? {
        return self.dayPrice
    }

    func setDayPrice(dayPrice: Int) {
        self.dayPrice = dayPrice
    }

    // MARK: Date in
    
    public func getDayIn() -> Int{
        return self.dayIn
    }
    
    public func getHourIn() -> Int{
        return self.hourIn
    }
    
    public func validateAuthorizationByPlate() -> Bool{
        if self.plate.prefix(1) == "A" {
            if getDayOfWeek() == 1 || getDayOfWeek() == 2 {
                return true
            }
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
