//
//  PokemonViewController.swift
//  PokemonApp
//
//  Created by Bahittin on 16.10.2023.
//

import UIKit

protocol PokemonViewControllerInterface: AnyObject {
    func configureVC()
    func configureCollectionView()
}

class PokemonViewController: UIViewController {

    private var  collectionView: UICollectionView!
    
    private let viewmodel = PokemonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewmodel.view = self
        viewmodel.viewDidLoad()
    }
}

extension PokemonViewController: PokemonViewControllerInterface {
    func configureVC() {
        view.backgroundColor = .systemBackground
        title = "Pokemons"
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.pinToEdges(in: view)
        collectionView.backgroundColor = .red
    }
}
