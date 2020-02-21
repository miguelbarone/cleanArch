//
//  DetailsUseCase.swift
//  ExampleClenARC
//
//  Created by Miguel Barone - MBA on 17/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import Foundation
import RxSwift

public class DetailsUseCase {
    let pokeRepository: PokemonRepository
    let disposeBag = DisposeBag()
    
    init(pokeRepository: PokemonRepository) {
        self.pokeRepository = pokeRepository
    }
    
    func getPokemonList(url: URL) -> Single<PokemonDetails> {
        return pokeRepository.getPokemonDetail(url: url)
    }
    
    func getPokemonImage(url: URL) -> Single<UIImage?> {
        return pokeRepository.getPokeImage(url: url)
    }
}
