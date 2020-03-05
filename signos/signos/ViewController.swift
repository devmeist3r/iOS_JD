//
//  ViewController.swift
//  signos
//
//  Created by Lucas Inocencio on 02/07/17.
//  Copyright © 2017 Lucas Inocencio. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var signos:[String] = []
    var significadosSignos:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        //Lista de signos
        signos.append("Áries")
        signos.append("Touro")
        signos.append("Gêmeos")
        signos.append("Cancêr")
        signos.append("Leão")
        signos.append("Virgem")
        signos.append("Libra")
        signos.append("Escorpião")
        signos.append("Sargitário")
        signos.append("Capricórnio")
        signos.append("Aquário")
        signos.append("Peixes")
        
        //Lista significados signos
        significadosSignos.append("Como o primeiro signo do zodíaco, a presença de Áries quase sempre marca o início de algo enérgico e turbulento. Estas pessoas estão continuamente à procura de dinâmica, velocidade e competição.")
        significadosSignos.append("Poderoso e confiável, Touro é o primeiro quando se trata de colher os frutos do seu trabalho. Eles adoram tudo o que é bom e belo, e eles vivem muitas vezes cercados por prazeres materiais.")
        significadosSignos.append("Expressivo e de raciocínio rápido, Gêmeos representa dois lados diferentes da mesma personalidade e você nunca vai ter certeza de com quem você está falando. Gêmeos pode ser sociável, comunicativo e pronto para se divertir, entretanto, por outro lado, pode ser muito sério, pensativo, inquieto e indeciso.")
        significadosSignos.append("Profundamente intuitivo e sentimental, o canceriano pode ser um dos signos do zodíaco mais desafiadores para entender. Câncer é muito emocional e sensível, e se preocupa com a família e a casa. É simpático e muito apegado às pessoas que o cercam.")
        significadosSignos.append("As pessoas nascidas sob o signo de Leão são líderes natos. Eles são dramáticos, criativos, autoconfiantes, dominantes e extremamente difíceis de resistir. Eles podem conseguir qualquer coisa que queiram, seja no trabalho ou no tempo gasto com a família e amigos.")
        significadosSignos.append("Os virginianos estão sempre prestando atenção nos menores detalhes e seu profundo senso de humanidade faz com que seja um dos signos mais cuidadosos do zodíaco. Sua abordagem metódica de vida garante que nada é deixado ao acaso.")
        significadosSignos.append("As pessoas nascidas sob o signo de Libra são pacíficas e justas, e odeiam ficar sozinhas. A parceria é muito importante para os librianos, e com a sua mentalidade vitoriosa e cooperação, eles não conseguem ficar sozinhos.")
        significadosSignos.append("Os nascidos em Escorpião são pessoas apaixonadas e assertivas. Eles são determinados e decisivos, e pesquisam até encontrar a verdade. O Escorpião é um grande líder, sempre consciente das situações e também se destaca na engenhosidade.")
        significadosSignos.append("Sagitário é extrovertido, otimista e entusiasta, e gosta de mudanças. Os nascidos em Sagitário são capazes de transformar seus pensamentos em ações concretas e fazem qualquer coisa para atingir seus objetivos.")
        significadosSignos.append(" Capricórnio é prático e é considerado como o signo mais sério do zodíaco, possuindo uma independência que permite progressos significativos tanto no nível pessoal quanto nos negócios.")
        significadosSignos.append("Os aquarianos são tímidos e quietos, mas por outro lado eles podem ser excêntricos e energéticos. No entanto, em ambos os casos, eles são profundos pensadores e pessoas altamente intelectuais que gostam de ajudar os outros.")
        significadosSignos.append("Piscianos são muito simpáticos, então eles muitas vezes se encontram na companhia de pessoas muito diferentes.")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        celula.textLabel?.text = signos[indexPath.row]
        
        return celula
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alertaController = UIAlertController(title: "Significados dos signos", message: significadosSignos[indexPath.row], preferredStyle: .alert)
        let acaoConfirmar = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertaController.addAction(acaoConfirmar)
        present(alertaController, animated: true, completion: nil)
        //print(significadosSignos[ indexPath.row ])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

