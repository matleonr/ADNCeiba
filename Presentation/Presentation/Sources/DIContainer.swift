//
//  DIContainer.swift
//  Presentation
//
//  Created by Matt Leon on 11/12/20.
//


import Swinject
import Domain
import Persistence

public class DIContainer {
    
    private let container: Container = Container()
    
    func registerDependencies() {
        
        container.register(VehicleRepository.self) {
            _ in VehicleRepositoryRemote()
        }
        
        container.register(VehicleService.self) {
            repository in VehicleService(vehicleRepository: repository.resolve(VehicleRepository.self)!)
           
        }
    }
    
    func getContainer() -> Container {
        
        return container
    }
}
