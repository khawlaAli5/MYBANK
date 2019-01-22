//
//  ViewController.swift
//  Pets B&B
//
//  Created by Khawla Alsharqi on 1/22/19.
//  Copyright © 2019 Khawla Alsharqi. All rights reserved.
//

import UIKit
import LFLoginController

class ViewController: UIViewController,LFLoginControllerDelegate {
    
    func loginDidFinish(email: String, password: String, type: LFLoginController.SendType) {
        
    }
    
    func forgotPasswordTapped(email: String) {
        
    }
    

    let LFcontroller = LFLoginController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      LFcontroller.delegate = self
        
        // Customizations
        LFcontroller.logo = UIImage(named: "AwesomeLabsLogoWhite")
        LFcontroller.isSignupSupported = false
        LFcontroller.backgroundColor = UIColor(red: 224 / 255, green: 68 / 255, blue: 98 / 255, alpha: 1)
        LFcontroller.videoURL = Bundle.main.url(forResource: "CD", withExtension: "mov")?.absoluteURL
        LFcontroller.loginButtonColor = UIColor.purple
        //        controller.setupOnePassword("YourAppName", appUrl: "YourAppURL")
        
        
    }
    
    @IBAction func butLoginTapped(_ sender: UIButton) {
        self.navigationController?.pushViewController(LFcontroller, animated: true)
    }
}


//extension ViewController: LFLoginControllerDelegate {
//
//    func loginDidFinish(email: String, password: String, type: LFLoginController.SendType) {
//
//        // Implement your server call here
//
//        print(email)
//        print(password)
//        print(type)
//
//        // Example
//        if type == .Login && password != "1234" {
//
//            controller.wrongInfoShake()
//        } else {
//
//            _ = navigationController?.popViewController(animated: true)
//        }
//    }
//
//    func forgotPasswordTapped(email: String) {
//        print("forgot password: \(email)")
//    }
//
//}

