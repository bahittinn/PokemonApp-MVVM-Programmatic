//
//  PokemonDetailViewModel.swift
//  PokemonApp
//
//  Created by Bahittin on 19.10.2023.
//

import Foundation

protocol PokemonDetailViewModelInterFace {
    var view: PokemonDetailControllerInterface? { get set }
    func viewDidLoad()
    func fetchDetail()
}



class PokemonDetailViewModel  {
    weak var view: PokemonDetailControllerInterface?
    
    var pokemon: Pokemons!
}

extension PokemonDetailViewModel: PokemonDetailViewModelInterFace {
    func viewDidLoad() {
        view?.configure()
        fetchDetail()
    }
    
    func fetchDetail() {
        print(pokemon.name!)
    }
}
