//
//  PokemonDetailsViewController.swift
//  ExampleClenARC
//
//  Created by Miguel Barone - MBA on 14/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PokemonDetailsViewController: UIViewController {
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonHeightLabel: UILabel!
    @IBOutlet weak var pokemonWeightLabel: UILabel!
    
    var viewModel: PokemonDetailsContract!
    var pokemon: PokemonDetails?
    var disposeBag = DisposeBag()
    
    
    public class func instantiate(viewModel: PokemonDetailsViewModel) -> PokemonDetailsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "PokemonDetailsViewController") as! PokemonDetailsViewController
        view.viewModel = viewModel
        return view
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getDetail()
        bind()
    }
    
    func bind() {
        viewModel.pokemonDetails.drive(onNext: { (poke) in
            self.pokemon = poke
            self.setup()
        }).disposed(by: disposeBag)
        
    }
    
    func setup() {
        guard let pokemon = pokemon  else { return }
        
        viewModel.pokemonImage.drive(pokemonImageView.rx.image).disposed(by: disposeBag)
        pokemonNameLabel.text = pokemon.name
        let height = pokemon.height
        pokemonHeightLabel.text = String(height)
        let weight = pokemon.weight
        pokemonWeightLabel.text = String("\(weight) kg")
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
