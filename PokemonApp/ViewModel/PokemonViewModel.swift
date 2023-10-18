//
//  PokemonViewModel.swift
//  PokemonApp
//
//  Created by Bahittin on 16.10.2023.
//

import Foundation

protocol PokemonViewModelInterface {
    var view: PokemonViewControllerInterface? { get set }
    
    func viewDidLoad()
    func fetchPokemons()
}

class PokemonViewModel {
    weak var view: PokemonViewControllerInterface?
    var pokemons: [Pokemons] = []
}

extension PokemonViewModel: PokemonViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
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
