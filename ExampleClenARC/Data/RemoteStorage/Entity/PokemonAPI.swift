//
//  Pokemon.swift
//  ExampleClenARC
//
//  Created by Miguel Barone - MBA on 13/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import Foundation

struct PokemonAPI: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [PokemonName]
}

struct PokemonName: Codable {
    let name: String
    let url: String
}

extension PokemonAPI {
    func map() -> [PokemonAPIName] {
        var list: [PokemonAPIName] = []
        self.results.forEach { (pokemon) in
            list.append(PokemonAPIName(name: pokemon.name, url: pokemon.url))
        }
        return list
    }
}

