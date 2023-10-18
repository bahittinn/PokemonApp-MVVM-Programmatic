//
//  PokemonViewController.swift
//  PokemonApp
//
//  Created by Bahittin on 16.10.2023.
//

import UIKit

protocol PokemonViewControllerInterface: AnyObject {
    func configureVC()
}

class PokemonViewController: UIViewController {

    private let viewmodel = PokemonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}

extension PokemonViewController: PokemonViewControllerInterface {
    func configureVC() {
        view.backgroundColor = .systemBackground
        title = "Pokemons"
    }
}
