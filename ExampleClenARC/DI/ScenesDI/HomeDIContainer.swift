//
//  HomeDIContainer.swift
//  ExampleClenARC
//
//  Created by Miguel Barone - MBA on 21/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import Foundation

class HomeDIContainer {
    let pokeRepo: PokemonRepositoryImpl
    let repo: CacheRepositoryImpl
    let emailUseCase: EmailUseCase
    let vm: EmailViewModel
    let vc: EmailViewController
    
    init(pokeRepo: PokemonRepositoryImpl, repo: CacheRepositoryImpl, emailUseCase: EmailUseCase, vm: EmailViewModel, vc: EmailViewController) {
        self.pokeRepo = pokeRepo
        self.repo = repo
        self.emailUseCase = emailUseCase
        self.vm = vm
        self.vc = vc
    }
    
    public func makeHomeViewController() -> HomeViewController {
        return HomeViewController.create()
    }
}

//
//let pokeRepo = PokemonRepositoryImpl()
//let repo = CacheRepositoryImpl()
//let emailUseCase = EmailUseCase(cacheRepository: repo, pokeRepository: pokeRepo)
//let vm = EmailViewModel(emailUseCase: emailUseCase)
//let vc = EmailViewController.instantiate(viewModel: vm)
//vc.modalPresentationStyle = .fullScreen
//self.present(vc, animated: true, completion: nil)
