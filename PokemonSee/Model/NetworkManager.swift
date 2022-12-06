//
//  PokemonsManager.swift
//  PokemonSee
//
//  Created by Stacy on 18/11/2022.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

protocol NetworkManagerDelegate {
    func didFailWithError(error: Error)
}


public class NetworkManager {
    
   private let urlPL = K.apiURL
   var delegate : NetworkManagerDelegate?
    
    
    func getPokemons(completion: @escaping (_ pokemonsModel: PokemonsModel) -> Void)  {
        
        AF.request(urlPL, method: .get)
            .validate()
            .validate(contentType: ["application/json"])
            .responseData { response in
                
                if response.error != nil {
                    //TODO: Add show error message to user
                    debugPrint(response.error as Any)
                    
                } else if let data = response.value {
                    do {
                        
                        let pokemonsData = try JSONDecoder().decode(PokemonsData.self, from: data)
                        let pokemonsModel = PokemonsModel(next: pokemonsData.next, previous: pokemonsData.previous ?? "", pokemons: pokemonsData.results)
                        
                        completion(pokemonsModel)
                    } catch let error {
                        debugPrint(error)
                    }
                }
                
            }
    }
    
    func getPokemonInfo(url: String, completion: @escaping (PokemonModel) -> Void) {
        
        AF.request(url, method: .get)
            .validate()
            .validate(contentType: ["application/json"])
            .responseData { response in

                if response.error != nil {
                    //TODO: Add show error message to user
                   
                    debugPrint(response.error as Any)
                    
                } else if let data = response.value {
                    do {
                        
                        let pokemonData = try JSONDecoder().decode(PokemonData.self, from: data)
                        let pokemonModel = PokemonModel(id: pokemonData.id, name: pokemonData.name, imageURL: pokemonData.sprites.front_default, height: pokemonData.height, weight: pokemonData.weight, types: pokemonData.types)
                        
                        completion(pokemonModel)
                    } catch let error {
                        debugPrint(error)
                    }
                }
            }
    }
    
}






