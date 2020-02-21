//
//  PokemonDetailsService.swift
//  ExampleClenARC
//
//  Created by Miguel Barone - MBA on 17/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import Foundation
class PokemonDetailsService: MoyaService {
    let pokemonUrl: URL
    
    override var baseURL: URL {
        return pokemonUrl
    }
    
    init(pokemonUrl: URL) {
        self.pokemonUrl = pokemonUrl
    }
}
