//
//  ContactsTBV.swift
//  CoreDataSwift3
//
//  Created by Ali Farhat on 4/9/17.
//  Copyright © 2017 HCT. All rights reserved.
//

import UIKit
import CoreData
class ContactsTBV: UITableViewController {
    var  contacts   :  [NSManagedObject] = []
    var  contact    :  NSManagedObject!  //explanation mark means it maybe have a value or not
    
    
    // The Managed Object Context retrieved from the app delegate
    
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.gettAllRecords() // to see the recordes on the table
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
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            contacts.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        contact = contacts[indexPath.row]
        let firstName   =   contact.value(forKeyPath: "firstName") as! String
        let lastName    =   contact.value(forKeyPath: "lastName") as! String
        let phone       =   contact.value(forKeyPath: "phone") as! String
        let image       =   contact.value(forKeyPath: "image") as! Data
     // let petname     =  contact.value(forKeyPath: "petname") as! String
      // let petage      =   contact.value(forKeyPath: "petage") as! String
        // from the intitiy
        let img     =   UIImage(data: image)

        cell.textLabel?.text = "dear \(firstName) \(lastName) "
        
        cell.detailTextLabel?.text = "we will contact you On this number:\(phone) \nif we accepet your request "
        
        cell.imageView?.image = img
        

        return cell
    }
    /***********************************************************************
     *
     * This function gets all records from the database and returns
     * an array of ManagedObject
     *
     **********************************************************************/
    
    func gettAllRecords()
    {
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ContactEntity")
        
        do {
            contacts  = try managedContext.fetch(fetchRequest)
            
          /*
            for contact in contacts
            {
                // Do something with the data
            }
            */
            self.tableView.reloadData()//to relod all the recordes
        } catch let error as NSError {
            
            print("Could not fetch. \(error), \(error.userInfo)")
            
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        // 1 identify wich seque your clicked on
        if segue.identifier == "edit"
        {
            //2 - get the cell that is selected
            let indexPath =  tableView.indexPathForSelectedRow
            //3 - get the object from the arry and pass it to the view controler
            let vc = segue.destination as! ViewController
            
            //4- assign the contact attribute to the selected object
            let contact = contacts[(indexPath?.row)!]
            vc.contact = contact
            
        }
    }
    

    /*********************************************************************
     *
     * This function Display Action Controller to get a contact name
     *
     *********************************************************************/
    
    @IBAction func searchRecords(_ sender: AnyObject) {
        
        
        // create the alert controller
        
        let v = UIAlertController(title: "Search", message: "Enter  part of a contact name", preferredStyle: UIAlertControllerStyle.alert)
        
        
        // Add the text field
        
        v.addTextField { (storeName:UITextField!) -> Void in
            
            storeName.placeholder = "Contact Name"
            
        }
        
        
        // Create the button - Alert Action
        
        let okAc = UIAlertAction(title: "Search", style: UIAlertActionStyle.default)
        { (alert: UIAlertAction) in
            
            let contactName = v.textFields![0]
            
           // self.filterContacts(contactName.text!)
            
            v.dismiss(animated: true, completion: nil)
        }
        
        
        // Add it to the controller
        
        v.addAction(okAc)
        
        
        // only one cancel action style allowed
        
        let cancelAc = UIAlertAction(title: "cancel", style: UIAlertActionStyle.cancel) { (alert: UIAlertAction) in
            
            v.dismiss(animated: true, completion: nil)
            
        }
        
        v.addAction(cancelAc)
        
        present(v, animated: true , completion: nil)
        
    }

    
}
