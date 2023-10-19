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
    func configureFlowLayout() -> UICollectionViewFlowLayout
    func reloadCollectionView()
}


class PokemonViewController: UIViewController {

    private var collectionView: UICollectionView!
    
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
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureFlowLayout())
        collectionView.register(PokemonCell.self, forCellWithReuseIdentifier: PokemonCell.reuseId)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.pinToEdges(in: view)
        collectionView.delegate   = self
        collectionView.dataSource = self
    }
    
    func configureFlowLayout() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return layout
    }
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension PokemonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewmodel.pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCell.reuseId, for: indexPath) as! PokemonCell
        let pokemon = viewmodel.pokemons[indexPath.row].name
        cell.setCell(pokeName: pokemon ?? "weedle")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PokemonDetailController()
        let pokemon = viewmodel.pokemons[indexPath.row]
        vc.viewmodel.pokemon = pokemon
        navigationController?.pushViewController(vc, animated: true)
    }
}
