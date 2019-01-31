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
import SideMenu
class SignOUt:UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//        // Define the menus
//       // let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: ViewController)
//        // UISideMenuNavigationController is a subclass of UINavigationController, so do any additional configuration
//        // of it here like setting its viewControllers. If you're using storyboards, you'll want to do something like:
//         let MenuLeftNavigationController2 = storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as! UISideMenuNavigationController
//        SideMenuManager.default.menuLeftNavigationController = MenuLeftNavigationController2
//
////        let menuRightNavigationController = UISideMenuNavigationController(rootViewController: YourViewController)
////        // UISideMenuNavigationController is a subclass of UINavigationController, so do any additional configuration
////        // of it here like setting its viewControllers. If you're using storyboards, you'll want to do something like:
////        // let menuRightNavigationController = storyboard!.instantiateViewController(withIdentifier: "RightMenuNavigationController") as! UISideMenuNavigationController
////        SideMenuManager.default.menuRightNavigationController = menuRightNavigationController
//
//        // (Optional) Enable gestures. The left and/or right menus must be set up above for these to work.
//        // Note that these continue to work on the Navigation Controller independent of the view controller it displays!
//        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
//        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
//
//        // (Optional) Prevent status bar area from turning black when menu appears:
   SideMenuManager.default.menuFadeStatusBar = false
    }
    
    @IBAction func SignOut(_ sender: UIBarButtonItem) {
        
//        do {
//            try Auth.auth().signOut()
//
//        navigationController?.popoverPresentationController
//            SVProgressHUD.show()
//
//        }
//        catch {
//            print("error: there was a problem logging out")
//            let msg = UIAlertController(title: "Error Loging out", message: " \(error.localizedDescription) ", preferredStyle: .alert)
//
//            msg.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
//                NSLog("The \"OK\" alert occured.")
//
//            }))
//            self.present(msg, animated: true, completion: nil)
//            SVProgressHUD.dismiss()
//        }

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
    
    }//END
