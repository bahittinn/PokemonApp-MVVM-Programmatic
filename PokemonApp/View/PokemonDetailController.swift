//
//  PokemonDetailController.swift
//  PokemonApp
//
//  Created by Bahittin on 19.10.2023.
//

import UIKit

protocol PokemonDetailControllerInterface: AnyObject {
    func configure()
    func configurePokemonImage()
}

class PokemonDetailController: UIViewController {
    
    var viewmodel = PokemonDetailViewModel()
    let PokemonImage = PokemonCustomImage(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewmodel.view = self
        viewmodel.viewDidLoad()
    }
}

extension PokemonDetailController: PokemonDetailControllerInterface {
    func configure() {
        view.backgroundColor = .systemBackground
    }
    
    func configurePokemonImage() {
        view.addSubview(PokemonImage)

        NSLayoutConstraint.activate([
            PokemonImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            PokemonImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            PokemonImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            PokemonImage.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
