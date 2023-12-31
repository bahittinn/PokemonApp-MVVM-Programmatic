//
//  NetworkManager.swift
//  PokemonApp
//
//  Created by Bahittin on 18.10.2023.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    
    
    func FetchPokemons(with url: String, completion: @escaping (Result<Pokemon, Error>) -> ()) {
        guard let url = URL(string: url) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _ , error in
            
            guard let data = data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode(Pokemon.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
    
    func FetchPokemonDetail(with name: String, completion: @escaping (Result<PokemonDetail, Error>) -> ()) {
        guard let url = URL(string: "\(Constants.detailApiUrl)/\(name)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data , _ , error in
            guard error == nil else { return }
            guard let data = data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode(PokemonDetail.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume() 
    }
}
