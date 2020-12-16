//
//  VehicleService.swift
//  Domain
//
//  Created by Matt Leon on 11/12/20.
//

import Foundation

public class VehicleService {
    private let vehicleRepository: VehicleRepository
    private let date = Date()
    private let formatter = DateFormatter()

    public init(vehicleRepository: VehicleRepository) {
        self.vehicleRepository = vehicleRepository
    }

    public func getTotalprice(plate:String) -> Int {
        var price: Int
        let vehicle = vehicleRepository.getVehicle(vehicleplate: plate)
        let days = getDay() - (vehicle?.getDayIn())!
        let hours = getHour() - (vehicle?.getHourIn())!//hours can go negative
        let priceHour = hours * (vehicle?.getPriceByHour())!
        let priceDay = days * (vehicle?.getPriceByDay())!
        price = priceHour + priceDay
        if vehicle!.cylinderCapacityOver500(){
            price = price + 2000
        }
        return price
    }

    public func saveVehicle(vehicle: Vehicle) -> Bool {
        if vehicle.validateAuthorizationByPlate() {
            if vehicleRepository.vehicleAlreadyExists(vehiclePlate: vehicle.getPlate()) {
                print("vehicle already exists")
                return false
            }else {
                if vehicleRepository.isThereCapacityByType(vehicleType: vehicle.getType()) {
                    print("vehicle saved")
                    return vehicleRepository.create(vehicle: vehicle)
                }else{
                    return false
                }
            }
        }
        print("vehicle not authorized to in")
        return false
    }
    
    public func getVehicles() -> [Vehicle] {
        return vehicleRepository.getVehicles()
    }
    
    public func deleteVehicle(plate: String) {
        return vehicleRepository.delete(vehiclePlate: plate)
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
