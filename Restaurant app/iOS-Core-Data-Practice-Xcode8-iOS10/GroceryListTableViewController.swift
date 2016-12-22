//
//  GroceryListTableViewController.swift
//  iOS-Core-Data-Practice-Xcode8-iOS10
//
//  Created by Odin on 2016-12-12.
//  Copyright © 2016 jonmercer. All rights reserved.
//

import UIKit
import CoreData

class GroceryListTableViewController: UITableViewController {
    
    //we are now storing NSMangedObjects which is a basic class that can go into core data
    var groceries = [NSManagedObject]()
    //managed the object space of the app
    var managedObjectContext: NSManagedObjectContext?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //we want acces to this so that we can get a hold of the persistence container
        managedObjectContext = appDelegate.persistentContainer.viewContext
        
        loadData() //helper function
    }
    
    //want to get the data from our grocery entity
    func loadData() {
        //fetch request selects and orders data from the database. In this case we want any entity of "grocery"
        let request: NSFetchRequest<NSManagedObject> = NSFetchRequest(entityName: "Grocery") //this is just a query. It's not been sent yet
        
        do {
            let results = try managedObjectContext?.fetch(request)
            groceries = results! //groceries is a list of NSMAnagedObject
            tableView.reloadData() //reloads all the cells in the table
        }
        catch {
            fatalError("Error in retrieving item")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addAction(_ sender: Any) {
        let alertController = UIAlertController(title: "The item", message: "What to buy?", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addTextField { (textField: UITextField) in
            
        }
        
        let addAction = UIAlertAction(title: "ADD", style: UIAlertActionStyle.default) { [weak self](action: UIAlertAction) in
            let textField = alertController.textFields?.first
            //self?.groceries.append(textField!.text!) //old
            
            //gets all entities in managedObjectContext
            let entity = NSEntityDescription.entity(forEntityName: "Grocery", in: (self?.managedObjectContext)!)
            
            // gets the grocery entity
            let grocery = NSManagedObject(entity: entity!, insertInto: self?.managedObjectContext)
            
            // saves an item string in grocery entity. It's assumed that item will be a list? How else could there be unique values for just one key?
            grocery.setValue(textField!.text!, forKey: "item")
            
            do {
                try self?.managedObjectContext?.save()
            }
            catch {
                fatalError("Error in storing data")
            }
            
            //reload the table. Seems inefficient
            self?.loadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil)
        
        
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        

    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groceries.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groceryCell", for: indexPath)
        
        //cell.textLabel?.text = self.groceries[indexPath.row]
        
        //how does it know the order? Based ont the fetchHandler query?
        let grocery = self.groceries[indexPath.row]
        
        //ohh, groceries holds a list of dictionaries (NSManagedObject) 
        cell.textLabel?.text = grocery.value(forKey: "item") as? String
        
        return cell
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
