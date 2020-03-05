//: Playground - noun: a place where people can play

import UIKit
import Foundation

//let numero = "1.200,15"
//
//let nf = NumberFormatter()
//nf.numberStyle = .decimal
//nf.locale = Locale(identifier: "pt_BR")
//
//if let resultado = nf.number(from: numero){
//    let resultadoDouble = Double(resultado)
//    let total = Double(resultado) + 1
//}

let numero = NSNumber(value: 1000.20)

let nf = NumberFormatter()
nf.numberStyle = .decimal
//nf.groupingSeparator = "."
//nf.decimalSeparator = ","
nf.locale = Locale(identifier: "pt_BR")

if let resultado = nf.string(from: numero) {
    print(resultado)
}

