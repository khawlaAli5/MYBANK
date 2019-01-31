//
//  ViewController.swift
//  CoreDataSwift3
//
//  Created by Ali Farhat on 4/5/17.
//  Copyright © 2017 HCT. All rights reserved.
//

import UIKit
import CoreData  //important to save data 



class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    //@IBOutlet weak var imgContacImage: UIImageView!
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var PetAge: UITextField!
    @IBOutlet weak var txtPetName: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func chooseImageFromPhotoLibrary(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary //the only diffrence
        present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]/* the string gives you the img name */) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        /*dismiss to make the screen dispere*/ dismiss(animated: true, completion: nil)
    }
    
    
    // 1 - Define attributes
    
    var  lastName   :   String!
    var  firstName  :   String!
    var  image      :   Data!
    var  email      :   String!
    var  phone      :   String!
   //var petName     :   String!
   //var petage      :   String!
    
    
    // 2 - Define Core Data elements
    
    var  contacts   :  [NSManagedObject] = []
    var  contact    :  NSManagedObject!  //explanation mark means it maybe have a value or not
    
    
    // The Managed Object Context retrieved from the app delegate
    
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext  //this from appdelegate
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if contact != nil
        {
        getData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func savve(_ sender: Any) {
        
        // 1 - Get inputs from the screen
        
        lastName   = txtLastName.text
        firstName  = txtFirstName.text
        email      = txtEmail.text
        phone      = txtMobile.text
      // petName = txtPetName.text
      // petage = PetAge.text
        
        let img    = imageView.image //this will show the image only without saving and converting
        image = UIImageJPEGRepresentation(img!, 1) //its take the image and converted to binary data  (we can save the image between 0 and 1 , 1 means the orignal image)
        
        // 2 - Validate information
        // 3 - Get refrence to the managed object context
        // 4 - Get the description of the entity
        // 5 - Update attributes in entity with input fields
        // 6 - Use the managed object context to issue a save command
        
        if  saveNew() == true
        {
            
            let alert = UIAlertView(title: "Success", message: "contact is Saved", delegate: self, cancelButtonTitle: "Ok") //alert box
            alert.show()
            
        }
        else {
            
            let alert = UIAlertView(title: "Error", message: "contact was NOT Saved", delegate: self, cancelButtonTitle: "Cancel") //alert box
            alert.show()
        }
        
        // 7 - Display confirmation
        
    }
    /***********************************************************************
     *
     * This function save a new record to the databasea and returns
     * true if the record is saved and false if not.
     *
     **********************************************************************/
    
    func saveNew() -> Bool {
        
        
        if contact == nil {
            //Gets the entity description
            let entity = NSEntityDescription.entity(forEntityName: "ContactEntity", in: managedContext)!
            
            //create a managed object
            contact = NSManagedObject(entity: entity, insertInto: managedContext)
        }
        //puttingthe input values in the attributes of the entity
        self.putData()
        
        // Save Context
        do {
            try managedContext.save()  //trying to save data
            return true
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            return false
            
        }
    }
    /***********************************************************************
     *
     * This function update a mamange object with values from variables
     *
     **********************************************************************/
    
    func putData()
    {
        
        //contact is an object
        //put the value in firstName in the attribute called "firstName"
        contact.setValue(firstName, forKeyPath: "firstName")
        contact.setValue(lastName, forKeyPath: "lastName")
        contact.setValue(email, forKeyPath: "email")
        contact.setValue(image, forKeyPath: "image")
        contact.setValue(phone, forKeyPath: "phone")
        //contact.setValue(petage, forKeyPath: "petage")
        //contact.setValue(petName, forKeyPath: "petname")
        
    }
    func getData()
    {
        
        
        firstName   =   contact.value(forKeyPath: "firstName") as! String
        lastName    =   contact.value(forKeyPath: "lastName") as! String
        email       =   contact.value(forKeyPath: "email") as! String
        image       =   contact.value(forKeyPath: "image") as! Data
        phone       =   contact.value(forKeyPath: "phone") as! String
       // petName     =   contact.value(forKeyPath: "petname") as! String
        //petage      =   contact.value(forKeyPath: "petage") as! String
        let img     =   UIImage(data: image)
        
        txtMobile.text = phone
        txtEmail.text = email
        txtFirstName.text = firstName
        txtLastName.text = lastName
        imageView.image = img
     // txtPetName.text = petName
       // PetAge.text = petage
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtEmail.resignFirstResponder()
        txtMobile.resignFirstResponder()
        txtLastName.resignFirstResponder()
        txtFirstName.resignFirstResponder()
}
}


