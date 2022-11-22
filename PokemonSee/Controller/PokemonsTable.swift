//
//  ViewController.swift
//  PokemonSee
//
//  Created by Stacy on 17/11/2022.
//

import Foundation
import UIKit
import SwiftLoader

class PokemonsTable: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var pokemonsTable: UITableView!
    
    
    var pokemonsModel: PokemonsModel = PokemonsModel()
    var networkManager = NetworkManager()
    var selectedPokemon : Pokemon!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonsTable.delegate = self
        pokemonsTable.dataSource = self
        networkManager.delegate = self
        
//      Load pokemons & reload table
        networkManager.getPokemons(completion: { (data) in
            self.pokemonsModel = data
            self.pokemonsTable.reloadData()
        })

    }  
    
    // MARK: - UITableViewDataSourse methods
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pokemonsModel.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let pokemon = pokemonsModel.pokemons[indexPath.row]
        let cell = pokemonsTable.dequeueReusableCell(withIdentifier: "pCell", for: indexPath) as! PokemonCell
        cell.pName.text = pokemon.name
        return cell
    }
    
    // MARK: - UITableViewDelegate method
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedPokemon = pokemonsModel.pokemons[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "goToPokemon", sender: selectedPokemon.url)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToPokemon" {
            let destinationVC = segue.destination as! PokemonCard
            destinationVC.pokemonURL = sender as! String
        }
    }
    
}


//MARK: - PokemonsManagerDelegate


extension PokemonsTable: NetworkManagerDelegate {
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    func didUpdatePokemonCard(_ networkManager: NetworkManager, pokemonModel: PokemonModel) {
        return
    }
}


