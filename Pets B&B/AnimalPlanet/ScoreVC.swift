//
//  ScoreVC.swift
//  AnimalPlanet
//
//  Created by Apple on 3/19/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class ScoreVC: UIViewController {

  
    @IBOutlet weak var score: UILabel!
    var Result:Int = 0
    override func viewDidLoad() {
        
        if Result == 1 || Result == 2 || Result == 0
        {
        score.text = "Your score is \(Result)/5 dont be sad, visit the learning page so you could score more <3  "
        }
        else if Result == 3 || Result == 4
        {
            score.text = "Your score is \(Result)/5 very good ! but you can even do even better"
        }
        else
        {
            score.text = "Your score is \(Result)/5 Congratulations you got all the Questions Right !"
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
