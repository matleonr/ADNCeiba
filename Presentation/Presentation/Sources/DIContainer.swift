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
        
        container.register(BykeRepository.self) {
            _ in BykeRepositoryRemote()
        }
        
        container.register(CarRepository.self) {
            _ in CarRepositoryRemote()
        }
        
        container.register(VehicleService.self) {
            repository in VehicleService(carRepository: repository.resolve(CarRepository.self)!, bykeRepository: repository.resolve(BykeRepository.self)!)
            
           
        }
    }
    
    func getContainer() -> Container {
        
        return container
    }
}
