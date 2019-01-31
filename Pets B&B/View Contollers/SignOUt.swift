//
//  SignOUt.swift
//  Pets B&B
//
//  Created by Khawla Alsharqi on 1/28/19.
//  Copyright © 2019 Khawla Alsharqi. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
class SignOUt: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignOut(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            
        navigationController?.popoverPresentationController
            SVProgressHUD.show()
            
        }
        catch {
            print("error: there was a problem logging out")
            let msg = UIAlertController(title: "Error Loging out", message: " \(error.localizedDescription) ", preferredStyle: .alert)
            
            msg.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                
            }))
            self.present(msg, animated: true, completion: nil)
            SVProgressHUD.dismiss()
        }

            }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override var prefersStatusBarHidden: Bool {
        return false
        
    }
    }
