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
    func fillText()
}

class PokemonDetailController: UIViewController {
    
    var viewmodel    = PokemonDetailViewModel()
    let PokemonImage = PokemonCustomImage(frame: .zero)
    let weightLabel   = PokemonTitleLabel(textAligment: .left, fontSize: 20)
    let titleLabel   = PokemonTitleLabel(textAligment: .left, fontSize: 15)
    
    
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
        configurePokemonImage()
        configureWeightLabel()
        configureTitleLabel()
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
    
    func configureWeightLabel() {
        view.addSubview(weightLabel)
        weightLabel.text = "Weight"
        NSLayoutConstraint.activate([
            weightLabel.centerYAnchor.constraint(equalTo: PokemonImage.centerYAnchor),
            weightLabel.leadingAnchor.constraint(equalTo: PokemonImage.trailingAnchor, constant: 10),
            weightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            weightLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    func configureTitleLabel() {
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: PokemonImage.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func fillText() {
        DispatchQueue.main.async {
            self.titleLabel.text = "\(self.viewmodel.detailInfo.weight ?? 0) KG"
        }
    }
}
