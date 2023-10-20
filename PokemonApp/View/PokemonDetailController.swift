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
    func configureTitleLabel()
}

class PokemonDetailController: UIViewController {
    
    var viewmodel    = PokemonDetailViewModel()
    let PokemonImage = PokemonCustomImage(frame: .zero)
    let titleLabel   = PokemonTitleLabel(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewmodel.view = self
        viewmodel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

extension PokemonDetailController: PokemonDetailControllerInterface {
    func configure() {
        view.backgroundColor = .systemBackground
        title = viewmodel.pokemon.name ?? "N/A"
    }
    
    func configurePokemonImage() {
        view.addSubview(PokemonImage)
        
        NSLayoutConstraint.activate([
            PokemonImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            PokemonImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            PokemonImage.widthAnchor.constraint(equalToConstant: 200),
            PokemonImage.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        PokemonImage.downloadImage(with: viewmodel.pokemon.name ?? "N/A")
    }
    
    func configureTitleLabel() {
        view.addSubview(titleLabel)
        
    }
}
