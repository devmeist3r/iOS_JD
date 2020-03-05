//
//  LocaisViagensTableViewController.swift
//  MinhasViagens
//
//  Created by Lucas Inocencio on 19/09/17.
//  Copyright © 2017 Lucas Inocencio. All rights reserved.
//

import UIKit

class LocaisViagensTableViewController: UITableViewController {

    var locaisViagens: [Dictionary<String, String>] = []
    var controleNavegacao = "adicionar"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        controleNavegacao = "adicionar"
        atualizarViagens()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viagem = locaisViagens[indexPath.row]["local"]
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaReuso", for: indexPath)
        celula.textLabel?.text = viagem
        return celula
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            ArmazenamentDados().removerViagem(indice: indexPath.row)
            atualizarViagens()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.controleNavegacao = "listar"
        performSegue(withIdentifier: "verLocal", sender: indexPath.row)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verLocal" {
            let viewControllerDestino = segue.destination as! ViewController
            if self.controleNavegacao == "listar"{
                if let indiceRecuperado = sender {
                    let indice = indiceRecuperado as! Int
                    viewControllerDestino.viagem = locaisViagens[indice]
                    viewControllerDestino.indiceSelecionado = indice
                }
            } else {
                viewControllerDestino.viagem = [:]
                viewControllerDestino.indiceSelecionado = -1
            }
        }
    }
    
    func atualizarViagens(){
        locaisViagens = ArmazenamentDados().listarViagens()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locaisViagens.count
    }

}
