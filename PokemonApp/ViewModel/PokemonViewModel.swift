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
        view?.configureCollectionView()
        fetchPokemons()
    }
    
    func fetchPokemons() {
        NetworkManager.shared.FetchPokemons(with: Constants.apiurl) { [weak self] response in
            guard let self = self else  { return }
            
            switch response {
            case .success(let pokemons):
                self.pokemons = pokemons.results ?? []
                DispatchQueue.main.async {
                    self.view?.reloadCollectionView()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
