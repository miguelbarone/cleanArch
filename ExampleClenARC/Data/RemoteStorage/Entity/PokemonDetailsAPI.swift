//
//  PokemonDetailsAPI.swift
//  ExampleClenARC
//
//  Created by Miguel Barone - MBA on 14/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import Foundation

struct PokemonDetailsAPI: Codable {
    let name: String
    let height: Int
    let weight: Int
    let sprites: SpritesAPIResponse
}

struct SpritesAPIResponse: Codable {
    let front_default: String
}

extension PokemonDetailsAPI {
    func map()  -> PokemonDetails{
        let pokemon = PokemonDetails(name: self.name, height: self.height, weight: self.weight, urlImage: self.sprites.front_default)
        return pokemon
    }
}
