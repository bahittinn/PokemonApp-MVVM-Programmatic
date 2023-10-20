//
//  PokemonMockHomeView.swift
//  PokemonAppTests
//
//  Created by Bahittin on 20.10.2023.
//

import UIKit
@testable import PokemonApp

class PokemonMockHomeView: PokemonViewControllerInterface {
    
    var invokeConfigureVC = false
    var invokeConfigureVCCount = 0
    
    func configureVC() {
        invokeConfigureVC = true
        invokeConfigureVCCount += 1
    }
    
    func configureCollectionView() {
        
    }
    
    func configureFlowLayout() -> UICollectionViewFlowLayout {
        return UICollectionViewFlowLayout()
    }
    
    func reloadCollectionView() {
        
    }
}
