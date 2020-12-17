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
    func testGetVehiclesOK() {
        // arrange
        let fakeRepository: VehicleRepository = fakeSuccessfullVehicleRepository()
        let domainService = VehicleService(vehicleRepository: fakeRepository)
        let vehicleExpected = Vehicle(day: 2, hour: 12, plate: "ABC-123", type: "car", cylinderCapacity: 3000)

        // act

        // assert
        XCTAssert(vehicleExpected.getPlate() == domainService.getVehicles().first?.getPlate())
    }

    func test_SaveVehicle_CarTypeWithPlateStartinWithB_Success() {
        // arrange
        let fakeRepository: VehicleRepository = fakeSuccessfullVehicleRepository()
        let domainService = VehicleService(vehicleRepository: fakeRepository)

        let vehicle = Vehicle(day: 5, hour: 13, plate: "BBC-123", type: "car", cylinderCapacity: 2500)

        // act
        let result = domainService.saveVehicle(vehicle: vehicle)

        // assert
        XCTAssertEqual(true, result)
    }

    func testGetTotalPrice() {
        let fakeRepository: VehicleRepository = fakeSuccessfullVehicleRepository()
        let domainService = VehicleService(vehicleRepository: fakeRepository)

        XCTAssert(domainService.getTotalprice(plate: "ABC-123") == 47000)
    }
}
