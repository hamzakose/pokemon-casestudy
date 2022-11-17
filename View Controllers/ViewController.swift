//
//  ViewController.swift
//  pokemon-casestudy
//
//  Created by Hamza Köse on 15.11.2022.
//

import UIKit
import PokemonAPI

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var pokemons = [PKMPokemon]()
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set itself as the datasource and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        model.delegate = self
        
        model.getPokemons()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        let selectedPokemon = pokemons[tableView.indexPathForSelectedRow!.row]
        
        let detailVC = segue.destination as! DetailViewController
        
        detailVC.pokemon = selectedPokemon
        
        
    }
    
    //MARK: - Model Delegate Methods
    func pokemonsFetched(_ pokemons: [PKMPokemon]) {
        self.pokemons = pokemons
        tableView.reloadData()
        //print(pokemons)
    }
    
    
    
    //MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.POKEMONCELL_ID, for: indexPath) as! PokemonTableViewCell
        
        // Configure the cell with the data
        
        cell.setCell(self.pokemons[indexPath.row])
    
        
        // Return cell
        return cell
        
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}

