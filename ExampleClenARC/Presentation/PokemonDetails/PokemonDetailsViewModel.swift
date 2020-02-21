//
//  PokemonDetailsViewModel.swift
//  ExampleClenARC
//
//  Created by Miguel Barone - MBA on 14/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol PokemonDetailsContract: class {
    var pokemonDetails: Driver<PokemonDetails?> { get }
    var pokemonImage: Driver<UIImage?>  { get }
    func getDetail()
}

class PokemonDetailsViewModel: PokemonDetailsContract {
    private let pokemonDetailsRelay:BehaviorRelay<PokemonDetails?> = BehaviorRelay(value: nil)
    private let pokemonImageRelay:BehaviorRelay<UIImage?> = BehaviorRelay(value: nil)
    
    var pokemonDetails: Driver<PokemonDetails?> { return pokemonDetailsRelay.asDriver() }
    var pokemonImage: Driver<UIImage?> { return pokemonImageRelay.asDriver() }
    
    var pokemon: PokemonAPIName
    let detailsUseCase: DetailsUseCase
    let disposeBag = DisposeBag()
    
    init(detailsUseCase: DetailsUseCase, pokemon: PokemonAPIName) {
        self.detailsUseCase = detailsUseCase
        self.pokemon = pokemon
    }
    
    func getDetail() {
        let pokemonComplexo = detailsUseCase.getPokemonList(url: URL(string: pokemon.url)!)
        pokemonComplexo.subscribe(onSuccess: { (poke) in
            self.pokemonDetailsRelay.accept(poke)
            let image = self.detailsUseCase.getPokemonImage(url: URL(string: poke.urlImage)!)
            image.subscribe(onSuccess: { (img) in
                self.pokemonImageRelay.accept(img)
            }).disposed(by: self.disposeBag)
        }).disposed(by: disposeBag)
    }
}
