//
//  EmailViewController.swift
//  ExampleClenARC
//
//  Created by Miguel Barone - MBA on 13/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import UIKit
import RxSwift

class EmailViewController: UIViewController {
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: EmailViewModelContract!
    var pokemons: [PokemonAPIName] = []
    
    let disposeBag = DisposeBag()
    
    
    public class func instantiate(viewModel: EmailViewModel) -> EmailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "EmailViewController") as! EmailViewController
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLabel.text = viewModel.showEmail()
        viewModel.showList()
        bind()
    }
    
    private func bind() {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        
        viewModel.pokemonList.map{ $0 ?? [] }.drive(tableView.rx.items(cellIdentifier: "cell")) { index, model, cell in
            
            cell.textLabel?.text = model.name
            cell.selectionStyle = .none
            
        }.disposed(by: disposeBag)
        
        
        
        tableView.rx.itemSelected.bind { selectedIndex in
            
            guard let selectedPokemon = self.viewModel.showDetails(at: selectedIndex.row) else { return }
            let pokeRepo = PokemonRepositoryImpl()
            let pokemonUseCase = DetailsUseCase(pokeRepository: pokeRepo)
            let vm = PokemonDetailsViewModel(detailsUseCase: pokemonUseCase, pokemon: selectedPokemon)
            let vc = PokemonDetailsViewController.instantiate(viewModel: vm)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }.disposed(by: disposeBag)
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
