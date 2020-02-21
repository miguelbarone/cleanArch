//
//  HomeViewController.swift
//  ExampleCleanARC
//
//  Created by Miguel Barone - MBA on 13/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func callEmailScreen(_ sender: Any) {
        let pokeRepo = PokemonRepositoryImpl()
        let repo = CacheRepositoryImpl()
        let emailUseCase = EmailUseCase(cacheRepository: repo, pokeRepository: pokeRepo)
        let vm = EmailViewModel(emailUseCase: emailUseCase)
        let vc = EmailViewController.instantiate(viewModel: vm)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}
