//
//  EmailUseCase.swift
//  ExampleCleanARC
//
//  Created by Miguel Barone - MBA on 13/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import Foundation
import RxSwift

public class EmailUseCase {
    let cacheRepository: CacheRepository
    let pokeRepository: PokemonRepository
    let disposeBag = DisposeBag()
    
    init(cacheRepository: CacheRepository, pokeRepository: PokemonRepository) {
        self.cacheRepository = cacheRepository
        self.pokeRepository = pokeRepository
        
    }
    
    public func getEmail(forKey: String) -> String {
        let user: UserAPIResponse? = cacheRepository.retrieve(fromKey: forKey)
        return user!.map().email
    }
    
    func getPokemonList() -> Single<[PokemonAPIName]> {
        return pokeRepository.getPokemonList()
    }
}
