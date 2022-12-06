//
//  Extensions.swift
//  PokemonSee
//
//  Created by Stacy on 01/12/2022.
//

import Foundation


//MARK: - PokemonsManagerDelegate

extension PokemonsTable: NetworkManagerDelegate {
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    func didUpdatePokemonCard(_ networkManager: NetworkManager, pokemonModel: PokemonModel) {
        return
    }
}

//MARK: - PokemonsManagerDelegate


extension PokemonCard: NetworkManagerDelegate {
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: - Int extension

extension Int {
    var stringHeight: String {
        return "\(self)"
    }
    var stringWeight: String {
        return "\(self)"
    }
}
