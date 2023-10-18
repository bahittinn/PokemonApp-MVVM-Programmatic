//
//  PokemonCell.swift
//  PokemonApp
//
//  Created by Bahittin on 18.10.2023.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    static let reuseId = "PokemonCell"
    
    private let ImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .lightGray
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    private let PokemonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(pokeName: String) {
        PokemonLabel.text = pokeName
    }
    
    func configureLayout() {
        addSubview(ImageView)
        addSubview(PokemonLabel)
        
        NSLayoutConstraint.activate([
            ImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            ImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            ImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            ImageView.heightAnchor.constraint(equalTo: ImageView.widthAnchor),
            
            PokemonLabel.topAnchor.constraint(equalTo: ImageView.bottomAnchor, constant: 10),
            PokemonLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        
        ])
    }
}
