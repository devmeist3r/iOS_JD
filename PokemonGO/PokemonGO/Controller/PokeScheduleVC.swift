//
//  PokeScheduleVC.swift
//  PokemonGO
//
//  Created by Lucas Inocencio on 05/07/18.
//  Copyright © 2018 Lucas Inocencio. All rights reserved.
//

import UIKit

class PokeScheduleVC: UIViewController {
    
    var pokemonsCapturados: [Pokemon] = []
    var pokemonNaoCapturados: [Pokemon] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let coreDataP = CoreDataPokemon()
        
        self.pokemonsCapturados = coreDataP.recuperarPokemonsCapturados(capturado: true)
        self.pokemonNaoCapturados = coreDataP.recuperarPokemonsCapturados(capturado: false)
        
        print(String(self.pokemonNaoCapturados.count))
    }

    @IBAction func closedPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension PokeScheduleVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.pokemonsCapturados.count
        } else {
            return self.pokemonNaoCapturados.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Capturados"
        } else {
            return "Não capturados"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        let pokemon: Pokemon
        
        if indexPath.section == 0 {
            pokemon = self.pokemonsCapturados[indexPath.row]
        } else {
            pokemon = self.pokemonNaoCapturados[indexPath.row]
        }
        
        cell.textLabel?.text = pokemon.nome
        cell.imageView?.image = UIImage(named: pokemon.nomeImagem!)
        
        return cell
    }
}
