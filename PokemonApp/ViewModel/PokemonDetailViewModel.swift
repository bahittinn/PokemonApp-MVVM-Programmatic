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
    var detailInfo: PokemonDetail!
}

extension PokemonDetailViewModel: PokemonDetailViewModelInterFace {
    func viewDidLoad() {
        fetchDetail()
        view?.configure()
    }
    
    func fetchDetail() {
        guard let name = pokemon.name else { return }
        NetworkManager.shared.FetchPokemonDetail(with: name) { response in
            switch response {
            case .success(let details):
                self.detailInfo = details
                self.view?.fillText()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
