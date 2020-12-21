//
//  BykeRepository.swift
//  Domain
//
//  Created by Mateo Léon Restrepo - Ceiba Software on 18/12/20.
//

import Foundation

public protocol BykeRepository {
    
    func createByke(byke: Byke) -> Bool
    
    func getBykes() -> [Byke]
    
    func getBykeByPlate(bykePlate: String) -> Byke?
    
    func deleteByke(bykePlate: String) -> Bool

}
