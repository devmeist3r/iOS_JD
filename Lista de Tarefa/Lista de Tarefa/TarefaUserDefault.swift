//
//  TarefaUserDefault.swift
//  Lista de Tarefa
//
//  Created by Lucas Inocencio on 08/08/17.
//  Copyright © 2017 Lucas Inocencio. All rights reserved.
//

import UIKit

class TarefaUserDefault {
    
    let chave = "listaTarefas"
    var tarefas: [String] = []
    
    func remover(indice: Int){
        tarefas = listar()
        tarefas.remove(at: indice)
        UserDefaults.standard.set( tarefas, forKey: chave)
    }
    
    func salvar (tarefa: String) {
        tarefas = listar()
        
        tarefas.append(tarefa)
        UserDefaults.standard.set(tarefas, forKey: chave)
    }
    
    func listar() -> Array<String> {
        
        let dados = UserDefaults.standard.object(forKey: chave)
        
        if dados != nil {
            return dados as! Array<String>
        } else {
            return []
        }
    }
    
}
