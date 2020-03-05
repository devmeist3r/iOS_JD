//
//  TarefasTableViewController.swift
//  Lista de Tarefa
//
//  Created by Lucas Inocencio on 08/08/17.
//  Copyright © 2017 Lucas Inocencio. All rights reserved.
//

import UIKit

class TarefasTableViewController: UITableViewController {
    
    var tarefas: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let tarefa = TarefaUserDefault()
        tarefas = tarefa.listar()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            let tarefa = TarefaUserDefault()
            tarefa.remover(indice: indexPath.row)
            atualizarListaDeTarefas()
        }
    }
    func atualizarListaDeTarefas() {
        let tarefa = TarefaUserDefault()
        tarefas = tarefa.listar()
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
       atualizarListaDeTarefas()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tarefas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)

        celula.textLabel?.text = tarefas[ indexPath.row ]

        return celula
    }
 
}
