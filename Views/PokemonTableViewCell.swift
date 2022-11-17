//
//  PokemonTableViewCell.swift
//  pokemon-casestudy
//
//  Created by Hamza Köse on 17.11.2022.
//

import UIKit
import PokemonAPI

class PokemonTableViewCell: UITableViewCell {
    
    var pokemon: PKMPokemon?
    
    @IBOutlet weak var spriteImageView: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ pokemon:PKMPokemon){
        
        self.pokemon = pokemon
        
        guard self.pokemon != nil else{
            return
        }
        let url = URL(string: (self.pokemon?.sprites?.frontShiny)!)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!){data, response, error in
            
            if error == nil && data != nil {
                
                if url!.absoluteString != self.pokemon?.sprites?.frontShiny {
                    return
                }
                
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.spriteImageView.image = image
                }
                
            }
            
        }
        dataTask.resume()
        
        self.nameLabel.text = pokemon.name
    }

}
