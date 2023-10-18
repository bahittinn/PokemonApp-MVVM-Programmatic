//
//  PokemonDetailController.swift
//  PokemonApp
//
//  Created by Bahittin on 19.10.2023.
//

import UIKit

protocol PokemonDetailControllerInterface: AnyObject {
    func configure()
}

class PokemonDetailController: UIViewController {
    
    var viewmodel = PokemonDetailViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewmodel.view = self
        viewmodel.viewDidLoad()
    }
}

extension PokemonDetailController: PokemonDetailControllerInterface {
    func configure() {
        print("configure")
    }
}
