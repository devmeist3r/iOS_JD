//
//  CadastroTarefaViewController.swift
//  Lista de Tarefa
//
//  Created by Lucas Inocencio on 08/08/17.
//  Copyright © 2017 Lucas Inocencio. All rights reserved.
//

import UIKit

class CadastroTarefaViewController: UIViewController {
    @IBOutlet weak var tarefaCampo: UITextField!
    
    @IBAction func adicionarTarefa(_ sender: Any) {
        if let textoDigitado = tarefaCampo.text {
            let tarefa = TarefaUserDefault()
            tarefa.salvar(tarefa: textoDigitado)
            tarefaCampo.text = ""
            
            let dados = tarefa.listar()
            print(dados)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
