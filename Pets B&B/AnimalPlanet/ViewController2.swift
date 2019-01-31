//
// ViewController2.swift
//  AnimalPlanet
//
//  Created by Apple on 3/19/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
   
    
    let imgs = ["horse.png","dog2.png","cat.png","bird2.png","dholpin2.png"]
    
    let questions = ["What is this animal?", "What is this animal?", "What is this animal?","What is this animal?","What is this animal?"]
    
    let answers = [["Horse", "Cat", "Bird"], ["Dog", "Cat", "Dolphin"], ["Cat", "Dog", "Horse"],["Bird","Dog","Dholphin"],["Dholphin","Horse","Bird"]]//the first one is the right answer
    
    //Variables
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var points = 0;
    var curretenIMG = 0
    

    
    //Label
    @IBOutlet weak var lbl: UILabel!
    
    @IBOutlet weak var images: UIImageView!
    //Button
    @IBAction func action(_ sender: AnyObject)
    {
        if (sender.tag == Int(rightAnswerPlacement))
        {
            print ("RIGHT!")
            points += 1
        }
        else
        {
            print ("WRONG!")
        }
        
        if (currentQuestion != questions.count)
        {
            newQuestion()
        }
        else
        {
            performSegue(withIdentifier: "showScore", sender: self)
        }
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        newQuestion()
    }
    
    //Function that displays new question
    func newQuestion()
    {
    
        
        lbl.text = questions[currentQuestion]
        
       images.image = UIImage(named: imgs[curretenIMG])
        curretenIMG += 1 // to go to the next img
        rightAnswerPlacement = arc4random_uniform(3)+1
        //Create a button
        var button:UIButton = UIButton()
        
        var x = 1
        
        for i in 1...3 // the range of butons
        {
            //Create a button
            button = view.viewWithTag(i) as! UIButton
            
            if (i == Int(rightAnswerPlacement))
            {
                button.setTitle(answers[currentQuestion][0], for: .normal)
            }
            else
            {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x = 2
            }
        }
        currentQuestion += 1
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showScore"//identifer y3ni asm al seque
        {
            let vc = segue.destination as! ScoreVC //destnation means where its going
            vc.Result = points
        }
        
    }}

