//
//  PokemonDetail.swift
//  PokemonApp
//
//  Created by Bahittin on 20.10.2023.
//

import Foundation

struct PokemonDetail: Codable {
    let abilities: [AbilityElement]?
    let weight: Int?
}

// MARK: - AbilityElement
struct AbilityElement: Codable {
    let ability: AbilityAbility?
    let isHidden: Bool?
    let slot: Int?

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

// MARK: - AbilityAbility
struct AbilityAbility: Codable {
    let name: String?
    let url: String?
}
