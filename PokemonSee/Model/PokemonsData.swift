//
//  PokemonsData.swift
//  PokemonSee
//
//  Created by Stacy on 18/11/2022.
//

import Foundation
import SwiftyJSON

struct PokemonsData: Codable {
    var next: String
    var previous: String?
    var results: [Pokemon]
}

struct Pokemon: Codable {
    var name: String
    var url: String
}

struct PokemonRoot: Codable {
    var pokemonData: [PokemonData]
}

struct PokemonData: Codable {
    
    var height: Int
    var id: Int
    var name: String
    var sprites: Sprites
    var types: [Types]
    var weight: Int
    
}

struct Types: Codable {
    var slot: Int
    var type: PAType
    
}

struct PAType: Codable {
    var name: String
}

struct Sprites: Codable {
    var front_default: String
}
