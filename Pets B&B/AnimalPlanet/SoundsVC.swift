//
//  SoundsVC.swift
//  AnimalPlanet
//
//  Created by Apple on 3/14/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import AVFoundation

class SoundsVC: UIViewController,AVAudioPlayerDelegate {
var audioPlayerB:AVAudioPlayer?
    var audioPlayerC:AVAudioPlayer?
    var audioPlayerD:AVAudioPlayer?
    var audioPlayerH:AVAudioPlayer?
    var audioPlayerDog:AVAudioPlayer?
    
    
    @IBOutlet weak var Bird: UIButton!
    @IBOutlet weak var Horse: UIButton!
    @IBOutlet weak var Dohlpin: UIButton!
    @IBOutlet weak var Dog: UIButton!
    @IBOutlet weak var Cat: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 2){
            
            self.Bird.alpha = 1
            self.Horse.alpha = 1
            self.Dohlpin.alpha = 1
            self.Dog.alpha = 1
            self.Cat.alpha = 1
            
        }
        
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pause(_ sender: AnyObject) {
        audioPlayerB?.pause()
        audioPlayerC?.pause()
        audioPlayerD?.pause()
        audioPlayerH?.pause()
        audioPlayerDog?.pause()
    }

    @IBAction func bird(_ sender: Any) {
        
        UIView.transition(with:Bird, duration: 0.5, options:UIViewAnimationOptions.transitionCurlUp, animations: {
            
            //let newPos = CGRect(x: 50, y: 50, width: 200, height: 200)
           // self.Horse.frame = newPos
            
        }) {(true) in}
        
        
        
        
        var fileName = Bundle.main.path(forResource: "Beautiful-birds-song-in-the-morning", ofType: "mp3")
        var url = URL.init(fileURLWithPath: fileName!)
        
        do
        {
            try audioPlayerB = AVAudioPlayer(contentsOf: url)
            audioPlayerB?.play()
            
        }catch let error as NSError
        {
            print("error \(error.localizedDescription)")
        }
    }
    
    @IBAction func cat(_ sender: Any) {
        
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 10, options: [], animations:{
            
        }) { (true) in}
        
        
        var fileName = Bundle.main.path(forResource: "Cats-meowing", ofType: "mp3")
        var url = URL.init(fileURLWithPath: fileName!)
        
        do
        {
            try audioPlayerC = AVAudioPlayer(contentsOf: url)
            audioPlayerC?.play()
            
        }catch let error as NSError
        {
            print("error \(error.localizedDescription)")
        }    }
    
    @IBAction func dog(_ sender: Any) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 10, options: [], animations:{
            
        }) { (true) in}
        
        
        var fileName = Bundle.main.path(forResource: "Angry-dog-barking-constantly", ofType: "mp3")
       var url = URL.init(fileURLWithPath: fileName!)
        
        do
        {
            try audioPlayerDog = AVAudioPlayer(contentsOf: url)
            audioPlayerDog?.play()
            
        }catch let error as NSError
        {
            print("error \(error.localizedDescription)")
        }    }
    
    @IBAction func dholpin(_ sender: Any) {
        var fileName = Bundle.main.path(forResource: "Dolphin Chatter-SoundBible.com-808959219-2", ofType: "mp3")
        var url = URL.init(fileURLWithPath: fileName!)
        
        do
        {
            try audioPlayerD = AVAudioPlayer(contentsOf: url)
            audioPlayerD?.play()
            
        }catch let error as NSError
        {
            print("error \(error.localizedDescription)")
        }    }
    
    @IBAction func horse(_ sender: Any) {
        
        UIView.transition(with:Horse, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
            
           //let newPos = CGRect(x: 50, y: 50, width: 200, height: 200)
            //self.Horse.frame = newPos
            
        }) {(true) in}
        
        
        var fileName = Bundle.main.path(forResource: "Horse-nay", ofType: "mp3")
        var url = URL.init(fileURLWithPath: fileName!)
        
        do
        {
            try audioPlayerH = AVAudioPlayer(contentsOf: url)
            audioPlayerH?.play()
            
        }catch let error as NSError
        {
            print("error \(error.localizedDescription)")
        }    }
    
//
}
