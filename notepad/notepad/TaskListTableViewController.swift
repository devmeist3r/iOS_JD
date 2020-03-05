//
//  TaskListTableViewController.swift
//  notepad
//
//  Created by Lucas Inocencio on 15/11/17.
//  Copyright © 2017 Lucas Inocencio. All rights reserved.
//

import UIKit
import CoreData

class TaskListTableViewController: UITableViewController {

    var context: NSManagedObjectContext!
    var anotations: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.recoveryAnotation()
        self.tableView.reloadData()
    }
    
    func recoveryAnotation() {
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Notepad")
        
        let orderBy = NSSortDescriptor(key:"date", ascending: false)
        
        requisicao.sortDescriptors = [orderBy]
        
        do {
           let recoveryAnotation = try context.fetch(requisicao)
            self.anotations = recoveryAnotation as! [NSManagedObject]
        } catch let erro {
            print("Erro ao recuperar anotaçoes: \(erro.localizedDescription)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.anotations.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let indice = indexPath.row
        let anotation = self.anotations[indice]
        self.performSegue(withIdentifier: "newDate", sender: anotation)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "newDate" {
            let navigationController = segue.destination as! TaskViewController
            navigationController.anotation = sender as? NSManagedObject
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
        
        let anotation = self.anotations[ indexPath.row ]
        let textRecovery = anotation.value(forKey: "text")
        let dateRecovery = anotation.value(forKey: "date")
        
        //Formatar data
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm"
        
        let newDate = dateFormatter.string(from: dateRecovery as! Date)
        
        cell.textLabel?.text = textRecovery as? String
        cell.detailTextLabel?.text = newDate

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            let indice = indexPath.row
            let anotation = self.anotations[indice]
            
            self.context.delete(anotation)
            self.anotations.remove(at: indice)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            do {
                try self.context.save()
            } catch let erro{
                print("Erro ao remover item \(erro)")
            }
            
            
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
