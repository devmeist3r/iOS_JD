//
//  ViewController.swift
//  Frases do dia
//
//  Created by Lucas Inocencio on 27/06/17.
//  Copyright © 2017 Lucas Inocencio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var legendaResultado: UILabel!
    
    @IBAction func novaFrase(_ sender: Any) {
        var frases: [String] = []
        let numeroAleatorio = arc4random_uniform(4)
        
        frases.append("Eu não saio por aí procurando encrenca. Em geral as encrencas é que vêm ao meu encontro.  by Harry Potter")
        frases.append("Porque eu tenho algo pelo qual vale a pena viver. by Harry Potter")
        frases.append("Hogwarts não existe sem você, Hagrid.  by Harry Potter")
        frases.append("Se eu caisse duro toda vez que ela diz que vou cair eu seria um milagre da medicina.")
        frases.append("Você não matará mais ninguém esta noite.  by Harry Potter")
        
        legendaResultado.text = frases[Int(numeroAleatorio)]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

