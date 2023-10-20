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
        contentMode        = .scaleAspectFit
        image              = UIImage(systemName: "bell")
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(with pokename: String){
        guard let url = URL(string: "\(Constants.pictureURL)\(pokename).png") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data , _ , error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
        task.resume()
    }
}
