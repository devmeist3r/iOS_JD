//
//  TaskViewController.swift
//  notepad
//
//  Created by Lucas Inocencio on 15/11/17.
//  Copyright © 2017 Lucas Inocencio. All rights reserved.
//

import UIKit
import CoreData

class TaskViewController: UIViewController {

    @IBOutlet weak var taskText: UITextView!
    var context: NSManagedObjectContext!
    var anotation: NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.taskText.becomeFirstResponder()
        
        if anotation != nil {
            if let recoveryText = anotation.value(forKey: "text") {
                self.taskText.text = String(describing: recoveryText)
            }
        } else {
            self.taskText.text = ""
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }

    @IBAction func saveAnotation(_ sender: Any) {
        
        if anotation != nil {
            self.updateAnotation()
        } else {
            self.saveAnotation()
        }
        
        //Retorna para a tela inicial
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func saveAnotation() {
        let newAnotation = NSEntityDescription.insertNewObject(forEntityName: "Notepad", into: context)
        newAnotation.setValue(self.taskText.text , forKey: "text")
        newAnotation.setValue( Date(), forKey: "date")
        
        do {
            //Criar alerta
            try context.save()
            print("Sucesso ao salvar anotacao")
        } catch let erro {
            print("Erro ao salvar anotacao: " + erro.localizedDescription)
        }
    }
    
    func updateAnotation() {
        anotation.setValue( self.taskText.text , forKey: "text")
        anotation.setValue( Date(), forKey: "date")
        
        do {
            //Criar alerta
            try context.save()
            print("Sucesso ao atualizar anotacao")
        } catch let erro {
            print("Erro ao atualizar anotacao: " + erro.localizedDescription)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
