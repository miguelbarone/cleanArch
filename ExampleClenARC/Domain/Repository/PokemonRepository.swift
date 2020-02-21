//
//  PokemonRepository.swift
//  ExampleClenARC
//
//  Created by Miguel Barone - MBA on 14/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol PokemonRepository {
    func getPokemonList() -> Single<[PokemonAPIName]>
    func getPokemonDetail(url: URL) -> Single<PokemonDetails>
    func getPokeImage(url: URL) -> Single<UIImage?>
}
