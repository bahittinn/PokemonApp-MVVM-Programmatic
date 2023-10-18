//
//  NetworkManager.swift
//  PokemonApp
//
//  Created by Bahittin on 18.10.2023.
//

import Foundation

class NetworkManager {
    private let shared = NetworkManager()
    
    private init() {}
    
    private func FetchPokemons(with url: String) {
        guard let url = URL(string: url) else { return }
        
    }
}
