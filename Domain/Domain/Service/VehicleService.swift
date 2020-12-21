//
//  VehicleService.swift
//  Domain
//
//  Created by Matt Leon on 11/12/20.
//

import Foundation

public class VehicleService {
    private let carRepository: CarRepository
    private let bykeRepository: BykeRepository
    private let date = Date()
    private let formatter = DateFormatter()

    public init(carRepository: CarRepository, bykeRepository: BykeRepository) {
        self.carRepository = carRepository
        self.bykeRepository = bykeRepository
    }
    
    public func getTotalPriceCar(plate: String) -> Int {
        var price = 0
        let car = carRepository.getCarByPlate(carPlate: plate)
        let days = getTotalDays(vehicleHourIn: (car?.getHourIn())!, vehicleDayIn: (car?.getDayIn())!)
        let hours = getTotalHours(vehicleHourIn: (car?.getHourIn())!)
        let priceHour = hours * (car?.getPriceByHour())!
        let priceDay = days * (car?.getPriceByDay())!
        price = priceHour + priceDay
        return price
    }
    
    public func getTotalPriceByke(plate: String) -> Int{
        var price = 0
        let byke = bykeRepository.getBykeByPlate(bykePlate: plate)
        let days = getTotalDays(vehicleHourIn: (byke?.getHourIn())!, vehicleDayIn: (byke?.getDayIn())!)
        let hours = getTotalHours(vehicleHourIn: (byke?.getHourIn())!)
        let priceHour = hours * (byke?.getPriceByHour())!
        let priceDay = days * (byke?.getPriceByDay())!
        price = priceHour + priceDay
        if byke!.cylinderCapacityOver500(){
            price = price + 2000
        }
        return price
    }
    
    private func getTotalDays(vehicleHourIn: Int, vehicleDayIn: Int) -> Int{
        var days = getDay() - vehicleDayIn
        if (getHour()-vehicleHourIn) >= 9 {
            days = days + 1
        }
        return days
    }
    
    private func getTotalHours(vehicleHourIn: Int) -> Int{
        var hours = 0
        if getHour()-vehicleHourIn < 0 {
            hours = getHour()-vehicleHourIn
        }
        return hours
    }
    
    public func carAlreadyExits(plate: String) -> Bool {
        if (carRepository.getCarByPlate(carPlate: plate)?.getDayIn())! > 0 {
            return true
        }
        return false
    }
    
    public func bykeAlreadyExists(plate: String) -> Bool {
        if (bykeRepository.getBykeByPlate(bykePlate: plate)?.getDayIn())! > 0 {
            return true
        }
        return false
    }
    public func saveCar(car: Car) -> Bool {
        if car.validateAuthorizationByPlate(){
            if carAlreadyExits(plate: car.getPlate()) {
                print("vehicle already exists")
                return false
            }else {
                if isThereCapacityForCars() {
                    print("vehicle saved")
                    return carRepository.createCar(vehicle: car)
                }else{
                    return false
                }
            }
        }
        print("vehicle not authorized to in")
        return false
    }
    
    public func saveByke(byke: Byke) -> Bool {
        if byke.validateAuthorizationByPlate(){
            if  bykeAlreadyExists(plate: byke.getPlate()){
                print("vehicle already exists")
                return false
            }else {
                if isThereCapacityForCars() {
                    print("vehicle saved")
                    return bykeRepository.createByke(byke: byke)
                }else{
                    return false
                }
            }
        }
        print("vehicle not authorized to in")
        return false
    }
    
    private func isThereCapacityForCars() -> Bool{
        if carRepository.getCars().count >= 20 {
            return false
        }
        return true
    }
    
    
    private func isThereCapacityForBykes() -> Bool{
        if bykeRepository.getBykes().count >= 10 {
            return false
        }
        return true
    }
    
    
    public func deleteCar(plate: String) -> Bool {
        return carRepository.deleteCar(carPlate: plate)
    }
    
    public func deleteByke(plate: String) -> Bool {
        return bykeRepository.deleteByke(bykePlate: plate)
    }
    
    public func getVehicles() -> [Vehicle] {
        var vehicles = [Vehicle]()
        vehicles.append(contentsOf: getCars())
        vehicles.append(contentsOf: getBykes())
        return vehicles
    }
    
    public func getCars() -> [Car]{
        return carRepository.getCars()
    }
    
    public func getBykes() -> [Byke]{
        return bykeRepository.getBykes()
    }
    
    private func getDay() -> Int {
        var day:Int = 0
        formatter.dateFormat = "d"
        day = Int(formatter.string(from: date))!
        formatter.dateFormat = "MM"
        day = day + Int(formatter.string(from: date))!
        return day
        
    }
    
    private func getHour() -> Int {
        formatter.dateFormat = "HH"
        return Int(formatter.string(from: date))!
    }

}
