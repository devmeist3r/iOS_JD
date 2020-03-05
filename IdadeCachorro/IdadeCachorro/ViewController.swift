//
//  ViewController.swift
//  IdadeCachorro
//
//  Created by Lucas Inocencio on 27/06/17.
//  Copyright © 2017 Lucas Inocencio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var campoIdadeCachorro: UITextField!

    @IBOutlet weak var legendaResultado: UILabel!
    
    @IBAction func descobrirIdade(_ sender: Any) {
        var idadeCachorro = Int( campoIdadeCachorro.text! )!
        
        idadeCachorro = idadeCachorro * 7
        
        legendaResultado.text = "A idade do cachorro é \(idadeCachorro)"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

