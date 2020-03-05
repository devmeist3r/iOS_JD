//
//  Filme.swift
//  MeusFilmes
//
//  Created by Lucas Inocencio on 03/07/17.
//  Copyright © 2017 Lucas Inocencio. All rights reserved.
//

import UIKit

class Filme{
    var titulo: String!
    var descricao: String!
    var imagem: UIImage!
    
    init(titulo: String, descricao: String, imagem: UIImage){
        self.titulo = titulo
        self.descricao = descricao
        self.imagem = imagem
    }

}
