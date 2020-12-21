//
//  CarRepositoryRemote.swift
//  Persistence
//
//  Created by Mateo Léon Restrepo - Ceiba Software on 18/12/20.
//

import Domain

public class CarRepositoryRemote: CarRepository {
    
    public init() {
    }
    
    public func createCar(vehicle: Car) -> Bool {
        return CoreDataManager.shared.createCar(car: vehicle)
    }
    
    public func getCars() -> [Car] {
        return CoreDataManager.shared.fetchCars()
    }
    
    public func getCarByPlate(carPlate: String) -> Car? {
        return CoreDataManager.shared.fetchCarByPlate(plate: carPlate)
    }
    
    public func deleteCar(carPlate: String) -> Bool {
        return CoreDataManager.shared.deleteCarByPlate(plate: carPlate)
    }

}
