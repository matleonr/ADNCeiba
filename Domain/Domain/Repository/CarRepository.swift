//
//  CarRepository.swift
//  Domain
//
//  Created by Matt Leon on 11/12/20.
//

import Foundation

public protocol CarRepository {
    
    func createCar(vehicle: Car) -> Bool
    
    func getCars() -> [Car]
    
    func getCarByPlate(carPlate: String) -> Car?
    
    func deleteCar(carPlate: String) -> Bool

}
