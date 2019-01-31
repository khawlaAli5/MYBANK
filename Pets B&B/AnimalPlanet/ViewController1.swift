//
//  ViewController.swift
//  AnimalPlanet
//
//  Created by Apple on 3/12/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit


class ViewController1: UIViewController {
    
    
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var age: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LearnTest"//identifer y3ni asm al seque
        {
            let vc = segue.destination as! Options //destnation means where its going
            vc.Uname = name.text!
        }
        
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        var Uage:Int = Int(age.text!)!
        var user:String = String(name.text!)!
        
        
            if user == ""
            {
                let msg = UIAlertView(title: "Error", message: "Please enter your name", delegate: self, cancelButtonTitle: "OK")//message box
                msg.show()
                return false
            }
        else if Uage >= 4 && user != nil
        {
            return true
            
        }
        else
        {
            let msg = UIAlertView(title: "Error", message: "Sorry \(user) this app is for 4 years and above =(", delegate: self, cancelButtonTitle: "OK")//message box
            msg.show()
            return false
          
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        name.resignFirstResponder()
        age.resignFirstResponder()
    }//
    
}
