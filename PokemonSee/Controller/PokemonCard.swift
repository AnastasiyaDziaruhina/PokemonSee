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
    
    private var pokemonModel: PokemonModel = PokemonModel()
    private var networkManager = NetworkManager()
    public var pokemonURL = K.pokemonURL
    
    override func viewDidLoad() {
        
        networkManager.delegate = self
        loadPokemon()
        
    }
    
    @objc private func loadPokemon() {
        
        networkManager.getPokemonInfo(url: self.pokemonURL, completion: { [self] (data) in
            self.pokemonModel = data
            
            //NSLocalizedString("", comment: "")
             
            pName.text = "\(NSLocalizedString("name", comment: "")): \(pokemonModel.name)"
            pType.text = "\(NSLocalizedString("type", comment: "")): \(pokemonModel.types.map{$0.type.name}.formatted())"
            pWeight.text = "\(NSLocalizedString("weight", comment: "")): \(pokemonModel.weight?.stringWeight ?? "" )"
            pHeight.text = "\(NSLocalizedString("height", comment: "")): \(pokemonModel.height?.stringHeight ?? "" )"
            
            if let url = NSURL(string: self.pokemonModel.imageURL) {
                URLSession.shared.dataTask(with: url as URL) { (data, response, error) in
                    // Error handling...
                    guard let imageData = data else { return }
                    DispatchQueue.main.async {
                        let image = UIImage(data: imageData)
                        self.pokemonIMG.image = UIImage(data: imageData)
                    }
                }.resume()
            }
        })
    }
    
}

