//
//  DetalhesFilmeViewController.swift
//  MeusFilmes
//
//  Created by Lucas Inocencio on 04/07/17.
//  Copyright © 2017 Lucas Inocencio. All rights reserved.
//

import UIKit

class DetalhesFilmeViewCotroller: UIViewController {
    
    @IBOutlet weak var filmeImaveView: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    
    var filme: Filme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmeImaveView.image = filme.imagem
        tituloLabel.text = filme.titulo
        descricaoLabel.text = filme.descricao
    }
    
}
