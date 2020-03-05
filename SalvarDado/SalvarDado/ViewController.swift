//
//  ViewController.swift
//  SalvarDado
//
//  Created by Lucas Inocencio on 07/08/17.
//  Copyright © 2017 Lucas Inocencio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UserDefaults.standard.set("azul", forKey: "corFundo")
//        let texto = UserDefaults.standard.object(forKey: "corFundo")
//        print(texto)
        
//        var comidas: [String] = ["Lasanha", "Pizza", "Torta"]
//        UserDefaults.standard.set(comidas, forKey: "comidas")
        
        //UserDefaults.standard.removeObject(forKey: "corFundo")
        
        let retorno = UserDefaults.standard.object(forKey: "comidas")
        print(retorno)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

