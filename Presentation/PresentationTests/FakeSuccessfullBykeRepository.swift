//
//  FakeSuccessfullBykeRepository.swift
//  PresentationTests
//
//  Created by Mateo Léon Restrepo - Ceiba Software on 28/12/20.
//

import Foundation
import Domain

class FakeSuccessfullBykeRepository: BykeRepository {
    
    func createByke(byke: Byke) -> Bool {
        
        if byke.getPlate().isEmpty {
            
            return false
        
        }
        
        if byke.getHourIn() != 0 {
            
            return false
            
        }
        
        if byke.getDayIn() != 0 {
            
            return false
            
        }
        
        if byke.getCylinderCapacity() != 0 {
            
            return false
            
        }
        
        return true
        
    }
    
    func getBykes() -> [Byke] {
        
        var bykes = [Byke]()
        
        let byke1 = Byke(day: 23, hour: 15, plate: "RMU-68E", cylinderCapacity: 150)
        let byke2 = Byke(day: 32, hour: 14, plate: "GHE-462", cylinderCapacity: 500)
        
        bykes.append(byke1)
        bykes.append(byke2)
        
        return bykes
        
    }
    
    func getBykeByPlate(bykePlate: String) -> Byke? {
        
        let byke1 = Byke(day: 23, hour: 15, plate: bykePlate, cylinderCapacity: 150)
    
        return byke1
    
    }
    
    func deleteByke(bykePlate: String) -> Bool {
        
        return true
    
    }
    
}
