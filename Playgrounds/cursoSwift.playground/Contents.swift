////: Playground - noun: a place where people can play
//
//import UIKit
//
////String
//var nomeUsuario: String = ""
//
//nomeUsuario = "Lucas"
//nomeUsuario = "curso"
//
////Numero inteiro
//var numeroInteiro: Int = 10
//numeroInteiro = numeroInteiro + 5
//numeroInteiro = numeroInteiro * 2
//numeroInteiro = 0
//
////Double
//var numeroDecimal: Double
//numeroDecimal = 9.4
//
////float
//var numeroFloat: Float
//numeroFloat = 3.189878
//
////Exibir
//print("O valor é \(numeroInteiro) \n" + "Double: \(numeroDecimal)\n" + "Float: " + String(numeroFloat))
//
////Arrays
//var nomes = ["Lucas", "Jose", "Joao"]
//print(nomes)
//print(nomes[0])
//
//nomes.append("Pedro")
//print(nomes)
//
////Array numerico
//var numeros:[Int] = []
//numeros.append(300)
//numeros.append(400)
//numeros.append(500)
//
//print(numeros)
//
////Uso do Set
//
//var lista = Set<String>()
//lista.insert("Pizza")
//lista.insert("Suco")
//print(lista)
//
////Dictionary chave + valor
//var animais = [String: String]()
//animais["urso"] = "Animal branco que hiberna"
//animais["cachorro"] = "Melhor amigo do homem"
//print(animais["urso"]!)
//
////Dictionary mes
//
//var mesDoAno = [Int: String]()
//mesDoAno[1] = "Janeiro"
//mesDoAno[2] = "Fevereiro"
//
//print(mesDoAno[1]!)
//
//// Loop For 
//
//for var i in 0..<5 {
//    print(i)
//}
//
//
//for var j in 1..<6{
//    print("Numero: " + String(j) )
//}

//var comentarios: [String] = []
//comentarios.append("Gostei da foto.... muito legal!!!")
//comentarios.append("Ficou muito bonita nessa foto!!!")
//comentarios.append("Que legal a sua viagem!!!")
//
//for var comentario in comentarios {
//    print(comentario)
//}


//var contador: Int = 5
//
//while contador < 6{
//    print(contador)
//    contador += 1
//}

//repeat{
//    print(contador)
//    contador += 1
//} while contador < 0


//Funcoes
//func multiplicar( numero1: Int, numero2: Int) -> Int {
//    return numero1 * numero2
//}
//
//var resultado: Int = multiplicar(numero1: 3, numero2: 3)
//
//resultado = resultado + 2
//
//print(resultado)
//
//
//func idade(anoNascimento: Int, anoAtual: Int) -> Int{
//    return anoAtual - anoNascimento
//}
//
//var id: Int = idade(anoNascimento: 1993, anoAtual: 2017)
//print("Minha idade atual é : \(id)")

//opciconal é a formda de definir se a variavel tera valor ou nao 
var valor1: Int
var valor2: Int?
var total: Int

valor1 = 10
valor2 = 1

total = valor1 + valor2!
