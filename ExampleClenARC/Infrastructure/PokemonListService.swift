//
//  MoyaService.swift
//  ExampleClenARC
//
//  Created by Miguel Barone - MBA on 13/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//
import Foundation

class PokemonListService: MoyaService {
    override var baseURL: URL {
        return URL(string: "https://pokeapi.co/api/v2/")!
    }
    
    override var path: String {
        return "pokemon"
    }
}
