//
//  BykeRepositoryRemote.swift
//  Persistence
//
//  Created by Mateo Léon Restrepo - Ceiba Software on 17/12/20.
//

import Domain

public class BykeRepositoryRemote: BykeRepository {
    
    public init() {
    }
    
    public func createByke(byke: Byke) -> Bool {
        return CoreDataManager.shared.createByke(byke: byke)
    }
    
    public func getBykes() -> [Byke] {
        return CoreDataManager.shared.fetchBykes()
    }
    
    public func getBykeByPlate(bykePlate: String) -> Byke? {
        return CoreDataManager.shared.fetchBykeByPlate(plate: bykePlate)
    }
    
    public func deleteByke(bykePlate: String) -> Bool {
        return CoreDataManager.shared.deleteBykeByPlate(plate: bykePlate)
    }

}
