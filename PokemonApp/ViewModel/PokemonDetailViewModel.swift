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
}

class PokemonDetailViewModel  {
    weak var view: PokemonDetailControllerInterface?
}

extension PokemonDetailViewModel: PokemonDetailViewModelInterFace {
    func viewDidLoad() {
        view?.configure()
    }
}
