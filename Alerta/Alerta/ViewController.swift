//
//  ViewController.swift
//  Alerta
//
//  Created by Lucas Inocencio on 02/07/17.
//  Copyright © 2017 Lucas Inocencio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func abrirAlerta(_ sender: Any) {
        //criar alerta
        let alertaController = UIAlertController(title: "Messagem", message: "Deseja apagar esta mensagem ?", preferredStyle: .actionSheet)
        present(alertaController, animated: true, completion: nil)
        let acaoConfirmar = UIAlertAction(title:"Confirmar", style: .default, handler: nil)
        let acaoCancelar = UIAlertAction(title:"Cancelar", style: .cancel, handler: nil)
        
        alertaController.addAction(acaoConfirmar)
        alertaController.addAction(acaoCancelar)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

