//
//  Pokemon.swift
//  PokemonApp
//
//  Created by Bahittin on 16.10.2023.
//

import Foundation

// MARK: - Pokemon
struct Pokemon: Codable { 
    let results: [Pokemons]?
}

// MARK: - Result
struct Pokemons: Codable {
    let name: String?
    let url: String?
}

