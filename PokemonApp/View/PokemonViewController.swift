//
//  PokemonViewController.swift
//  PokemonApp
//
//  Created by Bahittin on 16.10.2023.
//

import UIKit

class PokemonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Pokemons"
        fetchPokemons()
    }
    
    func fetchPokemons() {
        NetworkManager.shared.FetchPokemons(with: Constants.apiurl) { response in
            switch response {
            case .success(let pokemons):
                print(pokemons)
            case .failure(let error):
                print(error)
            }
        }
    }
}
