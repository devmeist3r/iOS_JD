//
//  ViewController.swift
//  bitcoin
//
//  Created by Lucas Inocencio on 16/11/17.
//  Copyright © 2017 Lucas Inocencio. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var precolbl: UILabel!
    @IBOutlet weak var btnAtualizar: UIButton!
    @IBAction func btnUpdate(_ sender: Any) {
        self.recuperarPrecoBitcoin()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.recuperarPrecoBitcoin()
    }
    
    func formtarPreco(preco: NSNumber) -> String {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.locale = Locale(identifier: "pt_br")
        
        if let precoFinal = nf.string(from: preco) {
            return precoFinal
        }
        return "0,00"
    }
    
    func recuperarPrecoBitcoin() {
        self.btnAtualizar.setTitle("Atualizando...", for: .normal)
        if let url = URL(string: "https://blockchain.info/pt/ticker") {
            let tarefa = URLSession.shared.dataTask(with: url) { (dados, requisicao, erro) in
                if erro == nil {
                    if let dadosRetorno = dados {
                        do {
                            if let objetoJson = try JSONSerialization.jsonObject(with: dadosRetorno, options: []) as? [String: Any] {
                                if let brl = objetoJson["BRL"] as? [String: Any] {
                                    if let precoCompra = brl["buy"] as? Double {
                                        let precoFormatado = self.formtarPreco(preco: NSNumber(value: precoCompra ))
                                        DispatchQueue.main.async(execute: {
                                            self.precolbl.text = "R$ " + precoFormatado
                                            self.btnAtualizar.setTitle("Atualizar", for: .normal)
                                        })
                                    }
                                }
                            }
                        } catch {
                            print("Erro ao formatar o retorno")
                        }
                        
                    }
                } else {
                    print("Erro ao fazer a consulta do preço")
                }
            }
            tarefa.resume()
        }
    }

}

