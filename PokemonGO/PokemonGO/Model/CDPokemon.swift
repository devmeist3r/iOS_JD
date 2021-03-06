//
//  CDPokemon.swift
//  PokemonGO
//
//  Created by Lucas Inocencio on 04/07/18.
//  Copyright © 2018 Lucas Inocencio. All rights reserved.
//

import UIKit
import CoreData

class CoreDataPokemon {
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        return context!
    }
    
    func addAllPokemons() {
        self.criarPokemon(nome: "Pikachu", nomeImagem: "pikachu-2", capturado: true )
        self.criarPokemon(nome: "Squirtle", nomeImagem: "squirtle", capturado: false  )
        self.criarPokemon(nome: "Charmander", nomeImagem: "charmander", capturado: false  )
        self.criarPokemon(nome: "Caterpie", nomeImagem: "caterpie", capturado: false  )
        self.criarPokemon(nome: "Bullbasaur", nomeImagem: "bullbasaur", capturado: false  )
        self.criarPokemon(nome: "Bellsprout", nomeImagem: "bellsprout", capturado: false  )
        self.criarPokemon(nome: "Psyduck", nomeImagem: "psyduck", capturado: false  )
        self.criarPokemon(nome: "Rattata", nomeImagem: "rattata", capturado: false  )
        self.criarPokemon(nome: "Meowth", nomeImagem: "meowth", capturado: false  )
        self.criarPokemon(nome: "Snorlax", nomeImagem: "snorlax", capturado: false  )
        self.criarPokemon(nome: "Zubat", nomeImagem: "zubat", capturado: false  )
        
        let context = getContext()
        
        do{
            try context.save()
        }catch{}
    }
    
    func criarPokemon(nome: String, nomeImagem: String, capturado: Bool) {
        let context = self.getContext()
        let pokemon = Pokemon(context: context)
        pokemon.nome = nome
        pokemon.nomeImagem = nomeImagem
        pokemon.capturado = capturado
    }
    
    func recuperarTodosPokemons() -> [Pokemon] {
        let context = self.getContext()
        do {
            let pokemons = try context.fetch(Pokemon.fetchRequest()) as! [Pokemon]
            
            if pokemons.count == 0 {
                self.addAllPokemons()
                return self.recuperarTodosPokemons()
            }
            return pokemons
        } catch {
            
        }
        return []
    }
    
    func recuperarPokemonsCapturados(capturado: Bool) -> [Pokemon] {
        let context = self.getContext()
        
        let request = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
        request.predicate = NSPredicate(format: "catched = %@", capturado as CVarArg)
        
        do {
            let pokemons = try context.fetch(request) as [Pokemon]
            return pokemons
        } catch   {
            debugPrint(error)
        }
        
        return []
    }
    
}
