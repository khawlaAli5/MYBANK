//
//  QuizVC.swift
//  AnimalPlanet
//
//  Created by Apple on 3/14/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import AVFoundation

class QuizVC: UIViewController,AVAudioPlayerDelegate{

   
    
    var audioPlayerB:AVAudioPlayer?

    @IBAction func sound(_ sender: Any) {
        
        let fileName = Bundle.main.path(forResource: "Cats-meowing", ofType: "mp3")
        let url = URL.init(fileURLWithPath: fileName!)
        
        do
        {
            try audioPlayerB = AVAudioPlayer(contentsOf: url)
            audioPlayerB?.play()
            
        }catch let error as NSError
        {
            print("error \(error.localizedDescription)")
        }
    }

   
        @IBAction func RightA(_ sender: Any) {
       
            audioPlayerB?.pause()
            let msg = UIAlertView(title: "Congratulation", message: "Your right!", delegate: self, cancelButtonTitle: "OK")//message box
            msg.show()
    }
    
    @IBAction func Worng1(_ sender: Any) {
        let msg = UIAlertView(title: "=(", message: "try again", delegate: self, cancelButtonTitle: "OK")//message box
        msg.show()
        
    }
    @IBAction func Wrong2(_ sender: Any) {
        let msg = UIAlertView(title: "=(", message: "try again", delegate: self, cancelButtonTitle: "OK")//message box
        msg.show()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
