//
//  ViewController.swift
//  GasolinaOuAlcool
//
//  Created by Lucas Inocencio on 29/06/17.
//  Copyright © 2017 Lucas Inocencio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var precoAlcoolTextField: UITextField!
    @IBOutlet weak var precoGasolinaTextField: UITextField!
    
    @IBOutlet weak var resultadoLabel: UILabel!
    
    @IBAction func calcularCombustivel(_ sender: Any) {
        var precoAlcool: Double = 0
        var precoGasolina: Double = 0
        var resultadoPreco: Double = 0
        
        //Validacoes
        if let resultadoAlcool = precoAlcoolTextField.text {
            if resultadoAlcool != "" {
                if let resultadoNumero = Double(resultadoAlcool) {
                    precoAlcool = resultadoNumero
                }
            }
        }
        
        if let resultadoGasolina = precoGasolinaTextField.text {
            if resultadoGasolina != "" {
                if let resultadoNumero = Double(resultadoGasolina) {
                    precoGasolina = resultadoNumero
                }
            }
        }
        
        resultadoPreco = precoGasolina * 0.7
        if resultadoPreco > precoAlcool {
            resultadoLabel.text = "Melhor usar Alcool"
        } else {
            resultadoLabel.text = "Melhor usar Gasolina"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

