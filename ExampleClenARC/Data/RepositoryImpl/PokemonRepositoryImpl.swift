//
//  PokemonRepositoryImpl.swift
//  ExampleClenARC
//
//  Created by Miguel Barone - MBA on 14/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import Foundation
import RxSwift

public class PokemonRepositoryImpl: PokemonRepository {
    
    private let listService = PokemonListService()
    private var detailsService: PokemonDetailsService?
    
    func getPokemonList() -> Single<[PokemonAPIName]> {
        let list: Single<PokemonAPI> = listService.getDecodedResponse()
        return list.map { (pokemonList) in
            return pokemonList.map()
        }
    }
    
    func getPokemonDetail(url: URL) -> Single<PokemonDetails> {
        self.detailsService = PokemonDetailsService(pokemonUrl: url)
        let poke: Single<PokemonDetailsAPI> = detailsService!.getDecodedResponse()
        return poke.map { (poke) in
            return poke.map()
        }
    }
    
    func getPokeImage(url: URL) -> Single<UIImage?> {
        self.detailsService = PokemonDetailsService(pokemonUrl: url)
        let pokeData: Single<Data> = detailsService!.getDataResponse()
        return pokeData.map{ UIImage(data: $0) }
    }
}
