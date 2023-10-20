//
//  PokemonCustomImage.swift
//  PokemonApp
//
//  Created by Bahittin on 20.10.2023.
//

import UIKit

class PokemonCustomImage: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds      = true
        image              = UIImage(systemName: "bell")
        translatesAutoresizingMaskIntoConstraints = false
    }
}
