//
//  PokemonsModel.swift
//  PokemonSee
//
//  Created by Stacy on 18/11/2022.
//

import Foundation
import UIKit

struct PokemonsModel {
     var next: String = ""
     var previous: String = ""
     var pokemons: [Pokemon] = []
}

struct PokemonModel {

     var id: Int?
     var name: String = ""
     var imageURL: String = ""
     var image: UIImage?
     var height: Int?
     var weight: Int?
     var types: [Types] = []

}
