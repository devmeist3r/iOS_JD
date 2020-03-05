//
//  ViewController.swift
//  Minhas anotações
//
//  Created by Lucas Inocencio on 07/08/17.
//  Copyright © 2017 Lucas Inocencio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textoCampo: UITextView!
    let chave = "minhaAnotacao"
    
    @IBAction func salvarTexto(_ sender: Any) {
        if let texto = textoCampo.text{
            UserDefaults.standard.set(texto, forKey: chave)
        }
    }
    
    func recuperarAnotacoes() -> String {
        if let textoRecuperado = UserDefaults.standard.object(forKey: chave) {
            return textoRecuperado as! String
        }
        return ""
    }
    
    //remover barra de status
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //Metodo para esconder teclado
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("Usuario pressionou a tela")
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textoCampo.text = recuperarAnotacoes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

