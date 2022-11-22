//
//  PokemonCard.swift
//  PokemonSee
//
//  Created by Stacy on 17/11/2022.
//

import Foundation
import UIKit


class PokemonCard: UIViewController {
    
    @IBOutlet weak var pokemonIMG: UIImageView!
    @IBOutlet weak var pName: UILabel!
    @IBOutlet weak var pType: UILabel!
    @IBOutlet weak var pWeight: UILabel!
    @IBOutlet weak var pHeight: UILabel!
    
    var pokemonModel: PokemonModel = PokemonModel()
    var networkManager = NetworkManager()
    var pokemonURL: String = ""
    
    override func viewDidLoad() {
        
        networkManager.delegate = self
        loadPokemon()
        
    }
    
    @objc func loadPokemon() {
        
        networkManager.getPokemonInfo(url: self.pokemonURL, completion: { [self] (data) in
            self.pokemonModel = data
            
            pName.text = "Name: \(pokemonModel.name)"
            pType.text = "Type: \(pokemonModel.types.map{$0.type.name}.formatted())"
            pHeight.text = pokemonModel.height?.stringHeight
            pWeight.text = pokemonModel.weight?.stringWeight
            
            DispatchQueue.main.async {
                let url = NSURL(string: self.pokemonModel.imageURL)
                let imagedata = NSData.init(contentsOf: url! as URL)
                if imagedata != nil {
                    self.pokemonIMG.image = UIImage(data: imagedata! as Data)
                }
            }
        })
    }
}


//MARK: - Extensions

extension Int {
    var stringHeight: String {
        return "Height: \(self)"
    }
    var stringWeight: String {
        return "Weight: \(self)"
    }
}

//MARK: - PokemonsManagerDelegate


extension PokemonCard: NetworkManagerDelegate {
    
    func didFailWithError(error: Error) {
        print(error)
    }
}


