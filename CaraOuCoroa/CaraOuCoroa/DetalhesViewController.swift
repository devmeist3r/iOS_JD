//
//  DetalhesViewController.swift
//  CaraOuCoroa
//
//  Created by Lucas Inocencio on 02/07/17.
//  Copyright © 2017 Lucas Inocencio. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController {
    
    @IBOutlet weak var moedaImageView: UIImageView!
    var numeroRandomicoRecebido: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if numeroRandomicoRecebido == 0{
            //Exibir cara
            moedaImageView.image = #imageLiteral(resourceName: "moeda_cara")
        } else {
            //Exibir coroa
            moedaImageView.image = #imageLiteral(resourceName: "moeda_coroa")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
