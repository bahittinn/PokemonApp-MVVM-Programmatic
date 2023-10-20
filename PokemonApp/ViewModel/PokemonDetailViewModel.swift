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
        view?.configurePokemonImage()
        fetchDetail()
    }
    
    func fetchDetail() {
        guard let name = pokemon.name else { return }
        NetworkManager.shared.FetchPokemonDetail(with: name) { response in
            switch response {
            case .success(let details):
                print(details)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
