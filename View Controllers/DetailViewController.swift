//
//  DetailViewController.swift
//  pokemon-casestudy
//
//  Created by Hamza Köse on 17.11.2022.
//

import UIKit
import PokemonAPI

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var detailLabel1: UILabel!
    
    @IBOutlet weak var detailLabel2: UILabel!
    
    
    @IBOutlet weak var abilityTextView: UITextView!
    
    
    @IBOutlet weak var spriteImageView: UIImageView!
    
    
    var pokemon: PKMPokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        guard pokemon != nil else {
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
        
        nameLabel.text = "Name: " + pokemon!.name!
        
        detailLabel1.text = "Height: " + String(pokemon!.height!)
        
        detailLabel2.text = "Weight: " + String(pokemon!.weight!)
        
        
        abilityTextView.text = "Abilities: \n"
        for ability in pokemon!.abilities! {
            
            abilityTextView.text += " - " + ability.ability!.name! + "\n"
        }
        
        
        
    }
    
    
}
