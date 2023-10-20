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
    
    var viewmodel           = PokemonDetailViewModel()
    let PokemonImage        = PokemonCustomImage(frame: .zero)
    let weightLabel         = PokemonTitleLabel(textAligment: .left, fontSize: 20)
    let titleLabel          = PokemonTitleLabel(textAligment: .left, fontSize: 15)
    let heightLabel         = PokemonTitleLabel(textAligment: .left, fontSize: 20)
    let heightTitleLabel    = PokemonTitleLabel(textAligment: .left, fontSize: 15)
    
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
        configureHeightLabel()
        configureHeightTitleLabel()
    }
    
    func configurePokemonImage() {
        view.addSubview(PokemonImage)
        
        NSLayoutConstraint.activate([
            PokemonImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            PokemonImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            PokemonImage.widthAnchor.constraint(equalToConstant: 150),
            PokemonImage.heightAnchor.constraint(equalToConstant: 150)
        ])
        PokemonImage.downloadImage(with: viewmodel.pokemon.name ?? "N/A")
    }
    
    func configureWeightLabel() {
        view.addSubview(weightLabel)
        weightLabel.text = "Weight"
        NSLayoutConstraint.activate([
            weightLabel.centerYAnchor.constraint(equalTo: PokemonImage.centerYAnchor),
            weightLabel.leadingAnchor.constraint(equalTo: PokemonImage.trailingAnchor, constant: 10),
            weightLabel.widthAnchor.constraint(equalToConstant: 100),
            weightLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    func configureTitleLabel() {
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: PokemonImage.trailingAnchor, constant: 10),
            titleLabel.widthAnchor.constraint(equalToConstant: 100),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configureHeightLabel() {
        view.addSubview(heightLabel)
        heightLabel.text = "Height"
        NSLayoutConstraint.activate([
            heightLabel.centerYAnchor.constraint(equalTo: weightLabel.centerYAnchor),
            heightLabel.leadingAnchor.constraint(equalTo: weightLabel.trailingAnchor, constant: 10),
            heightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            heightLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    func configureHeightTitleLabel() {
        view.addSubview(heightTitleLabel)
        NSLayoutConstraint.activate([
            heightTitleLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor),
            heightTitleLabel.leadingAnchor.constraint(equalTo: weightLabel.trailingAnchor, constant: 10),
            heightTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            heightTitleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func fillText() {
        DispatchQueue.main.async {
            self.titleLabel.text = "\(self.viewmodel.detailInfo.weight ?? 0) KG"
            self.heightTitleLabel.text = "\(self.viewmodel.detailInfo.height ?? 0) FT"
        }
    }
}
