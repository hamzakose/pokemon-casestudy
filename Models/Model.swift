//
//  Model.swift
//  pokemon-casestudy
//
//  Created by Hamza Köse on 17.11.2022.
//

import Foundation
import PokemonAPI

protocol ModelDelegate {
    func pokemonsFetched(_ pokemons: [PKMPokemon])

}

class Model {
    
    var delegate: ModelDelegate?
    var pokemons: [PKMPokemon]?

    
    func getPokemons(){
        var pokemonList = [PKMPokemon]()
        for i in 20...50{
            PokemonAPI().pokemonService.fetchPokemon(i) { result in
                switch result {
                case .success(let pokemon):
                    pokemonList.append(pokemon)
                    if i==50{
                        DispatchQueue.main.async {
                            self.delegate?.pokemonsFetched(pokemonList)
                        }
                        
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
