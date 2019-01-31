//
//  Quiz2VC.swift
//  AnimalPlanet
//
//  Created by Apple on 3/16/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import AVFoundation
class Quiz2VC: UIViewController,AVAudioPlayerDelegate {
    

    
    var audioPlayerB:AVAudioPlayer?
   
    
    @IBAction func Wrong1(_ sender: Any) {
        let msg = UIAlertView(title: "=(", message: "try again", delegate: self, cancelButtonTitle: "OK")//message box
        msg.show()
    }
    
   
    @IBAction func Wrong2(_ sender: Any) {
        let msg = UIAlertView(title: "=(", message: "try again", delegate: self, cancelButtonTitle: "OK")//message box
        msg.show()
            }
    
    @IBAction func Right(_ sender: Any) {
        audioPlayerB?.pause()
        let msg = UIAlertView(title: "Congratulations", message: "Your right!", delegate: self, cancelButtonTitle: "OK")//message box
        msg.show()
        
    }
    
   
    @IBAction func TheSoud(_ sender: Any) {
        
        let fileName = Bundle.main.path(forResource: "Horse-nay", ofType: "mp3")
        let url = URL.init(fileURLWithPath: fileName!)
        
        do
        {
            try audioPlayerB = AVAudioPlayer(contentsOf: url)
            audioPlayerB?.play()
            
        }catch let error as NSError
        {
            print("error \(error.localizedDescription)")
        }    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
