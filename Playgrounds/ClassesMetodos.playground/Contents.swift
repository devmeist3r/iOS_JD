//: Playground - noun: a place where people can play

import UIKit

//class Casa {
//    //Atributos
//    var cor: String
//    
//    init( cor: String){
//        self.cor = cor
//    }
//    
//    //metodos
//    func getCor() -> String{
//        return self.cor
//    }
//}
//
////Criar o objeto
//
//var casa = Casa(cor: "azul")
//casa.getCor()
//
//var casa2 = Casa(cor: "roxo")
//casa2.getCor()

class Cachorro {
    var cor: String
    
    init (cor: String){
        self.cor = cor
    }
    
    func correr() -> String {
        return "correr"
    }
    
    func latir() -> String {
        return "latir"
    }
    
}

var cachorro = Cachorro(cor: "Marrom")
cachorro.correr()
cachorro.latir()