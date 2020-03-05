//: Playground - noun: a place where people can play

import UIKit

class Animal {
    var cor = "marron"
    
    func dormir() -> String{
        return "dormir"
    }
}

class Cachorro: Animal {
    func latir() -> String {
        return "latir"
    }
}

class Passaro: Animal {
    func voar() -> String {
        return "voar"
    }
}

class Papagaio: Passaro {
    func repetir() -> String{
        return "repetir"
    }
}

//criar objeto
var cachorro = Cachorro()
cachorro.cor
cachorro.latir()

var passaro = Passaro()
passaro.cor
passaro.voar()