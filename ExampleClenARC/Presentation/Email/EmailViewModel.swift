//
//  EmailViewModel.swift
//  ExampleClenARC
//
//  Created by Miguel Barone - MBA on 13/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol EmailViewModelContract {
    var pokemonList: Driver<[PokemonAPIName]?> { get }
    func showEmail() -> String
    func showList()
    func showDetails(at index: Int) -> PokemonAPIName?
}

class EmailViewModel: EmailViewModelContract {
    private let pokemonStateRelay:BehaviorRelay<[PokemonAPIName]?> = BehaviorRelay(value: nil)
    public var pokemonList: Driver<[PokemonAPIName]?> { return pokemonStateRelay.asDriver() }

    let emailUseCase: EmailUseCase
    let disposeBag = DisposeBag()
    
    init(emailUseCase: EmailUseCase) {
        self.emailUseCase = emailUseCase
    }
    
    func showDetails(at index: Int) -> PokemonAPIName? {
        guard let pokemon = pokemonStateRelay.value else { return nil }
        return pokemon[index]
    }
    
    
    func showEmail() -> String {
        return emailUseCase.getEmail(forKey: "user_key")
    }
    
    func showList() {
        
        emailUseCase.getPokemonList().subscribe(onSuccess: { (pokemons) in
            self.pokemonStateRelay.accept(pokemons)
            }).disposed(by: disposeBag)
    }
    
}
