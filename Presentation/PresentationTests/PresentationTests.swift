//
//  PresentationTests.swift
//  PresentationTests
//
//  Created by Matt Leon on 11/12/20.
//

import Domain
@testable import Presentation
import XCTest

class PresentationTests: XCTestCase {
    
    func test_GetAllVehiclesOK() {
        // arrange
        let fakeRepository: CarRepository = fakeSuccessfullVehicleRepository()
        let domainService = VehicleService(vehicleRepository: fakeRepository)
        let vehicleExpected = Vehicle(day: 2, hour: 12, plate: "ABC-123", type: "car", cylinderCapacity: 3000)

        // act
        let plateExpected = vehicleExpected.getPlate()
        let plateGetted = domainService.getVehicles().first?.getPlate()
        // assert
        XCTAssert(plateExpected == plateGetted)
    }

    func test_SaveVehicle_CarTypeWithPlateStartinWithB_Success() {
        // arrange
        let fakeRepository: CarRepository = fakeSuccessfullVehicleRepository()
        let domainService = VehicleService(vehicleRepository: fakeRepository)
        

        let vehicle = Vehicle(day: getDay(), hour: getHour()-3, plate: "BBC-123", type: "car", cylinderCapacity: 2500)

        // act
        let result = domainService.saveVehicle(vehicle: vehicle)

        // assert
        XCTAssertEqual(true, result)
    }

    func test_GetTotalPrice_3HourAnd1DayCar_returns11000() {
        //arragne
        let fakeRepository: CarRepository = fakeSuccessfullVehicleRepository()
        let domainService = VehicleService(vehicleRepository: fakeRepository)
        
        //act
        let price = domainService.getTotalprice(plate: "BBC-123")
        let priceExpected = 11000
        
        //assert
        XCTAssertEqual(price, priceExpected)
    }
    
    func test_DeleteCarWithPlateBAC123_Successful() {
        //arrange
        let fakeRepository: CarRepository = fakeSuccessfullVehicleRepository()
        let domainService = VehicleService(vehicleRepository: fakeRepository)
        
        //act
        let result = domainService.deleteVehicle(plate: "BAC-123")
        
        //Assert
        XCTAssertEqual(true, result)
    }
    
    func getDay() -> Int {
        let date = Date()
        let formatter = DateFormatter()
        var day: Int = 0
        formatter.dateFormat = "d"
        day = Int(formatter.string(from: date))!
        formatter.dateFormat = "MM"
        day = day + Int(formatter.string(from: date))!
        return day
    }
    
    func getHour() -> Int {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        return Int(formatter.string(from: date))!
    }
}
