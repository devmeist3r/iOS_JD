//
//  ViewController.swift
//  Core Data Aula
//
//  Created by Lucas Inocencio on 14/11/17.
//  Copyright © 2017 Lucas Inocencio. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        /* Criar entidade */
        let usuario = NSEntityDescription.insertNewObject(forEntityName: "Usuario", into: context)
        
        //Configurar objeto
//        usuario.setValue("Jose Vitor", forKey: "nome")
//        usuario.setValue(18, forKey: "idade")
//        usuario.setValue("josevitor@gmail.com", forKey: "email")
//        usuario.setValue("123456", forKey: "senha")
        
        //Ordenar de A-Z ou Z-A
        
        let ordenacaoAZ = NSSortDescriptor(key: "nome", ascending: true)
        let idade = NSSortDescriptor(key: "idade", ascending: true)
        
        //Criar requisicao
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuario")
        
        let teste = "Lucas"
        let email = "luksinocencio@gmail.com"
        
        //Aplicar filtros
        //let predicate = NSPredicate(format: "nome == %@", "Lucas Inocencio")
        //let predicate = NSPredicate(format: "nome contains [c] %@", teste)
        //let predicate = NSPredicate(format: "nome beginswith [c] %@", teste)
        //print(predicate)
        
//        let filtroNome = NSPredicate(format: "nome contains [c] %@", teste)
//        let filtroIdade = NSPredicate(format: "email contains [c] %@", email)
      //  let combinacaoFiltro = NSCompoundPredicate(andPredicateWithSubpredicates: [filtroNome, filtroIdade])
        
        //Aplicar filtro
        requisicao.sortDescriptors = [ordenacaoAZ]
        //requisicao.predicate = predicate
        //requisicao.predicate = combinacaoFiltro
        
        do {
            let usuarios = try context.fetch(requisicao)
            if usuarios.count <= 0 {
                print("Nenhum item")
            } else {
                for usuario in usuarios as! [NSManagedObject] {
                    if let nomeUsuario = usuario.value(forKey: "nome") {
                        print(nomeUsuario)
                    }
                }
            }
        } catch  {
            print("Nao foi possivel resgatar os dados")
        }
        
        //Salvar
        do {
            try context.save()
            print("Sucesso ao salvar dados")
        } catch {
            print("Erro ao salvar dados")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

