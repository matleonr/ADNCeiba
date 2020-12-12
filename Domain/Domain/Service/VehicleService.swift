//
//  VehicleService.swift
//  Domain
//
//  Created by Matt Leon on 11/12/20.
//

import Foundation

public class VehicleService {
    
    private let vehicleRepository: VehicleRepository
    
    public init(vehicleRepository: VehicleRepository) {
        self.vehicleRepository = vehicleRepository
    }
    
    public func getTotalprice(){
        
    }
//    public func savePerson(person: Person) throws {
//        
//        if personRepository.personExists(id: person.getId()) {
//            throw BusinessError.PersonAlreadyExists()
//        }
//        else {
//            personRepository.savePerson(person: person)
//        }
//    }
}
