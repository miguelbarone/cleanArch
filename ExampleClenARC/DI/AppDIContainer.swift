//
//  AppDIContainer.swift
//  ExampleClenARC
//
//  Created by Miguel Barone - MBA on 21/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import Foundation

class AppDIContainer {
    func makeHomeDI() -> HomeDIContainer {
        return HomeDIContainer(pokeRepo: pokeRepo, repo: repo, emailUseCase: emailUseCase, vm: vm, vc: vc)
    }
    
    public func makeHomeViewController() -> HomeViewController {
        return HomeViewController.create()
    }
    
    var pokeRepo: PokemonRepositoryImpl {
        return PokemonRepositoryImpl()
    }
    
    var repo: CacheRepositoryImpl {
        return CacheRepositoryImpl()
    }
    
    var emailUseCase: EmailUseCase {
        return EmailUseCase(cacheRepository: repo, pokeRepository: pokeRepo)
    }
  
    var vm: EmailViewModel {
        return EmailViewModel(emailUseCase: emailUseCase)
    }
    
    var vc: EmailViewController {
        return EmailViewController()
    }
}
