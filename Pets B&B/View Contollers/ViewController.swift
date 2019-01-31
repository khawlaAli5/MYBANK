//
//  ViewController.swift
//  Pets B&B
//
//  Created by Khawla Alsharqi on 1/22/19.
//  Copyright © 2019 Khawla Alsharqi. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase
import SVProgressHUD
import ChameleonFramework

enum AMLoginSignupViewMode {
    case login
    case signup
}

class ViewController: UIViewController,UITextFieldDelegate {
  
   //Know with bank you want
    var ButtonTag: Int = 0
    //SIGNIN PAGE
    
    let animationDuration = 0.25
    var mode:AMLoginSignupViewMode = .signup
    
    
    @IBOutlet weak var EIcircle: UIImageView!
    
    @IBOutlet weak var ENBDcircle: UIImageView!
    /// URL of the background video
    public var videoURL: URL? {
        didSet {
            setupVideoBackgrond()
            
        }
    }
    //MARK: - background image constraints
    @IBOutlet weak var backImageLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var backImageBottomConstraint: NSLayoutConstraint!
    
    //MARK: - login views and constrains
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var loginContentView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginButtonVerticalCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginButtonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginWidthConstraint: NSLayoutConstraint!
    
    
    //MARK: - signup views and constrains
    @IBOutlet weak var signupView: UIView!
    @IBOutlet weak var signupContentView: UIView!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var signupButtonVerticalCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var signupButtonTopConstraint: NSLayoutConstraint!
    
    
    //MARK: - logo and constrains
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var Logo: UIImageView!
    @IBOutlet weak var logoTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var logoHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var logoBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var logoButtomInSingupConstraint: NSLayoutConstraint!
    @IBOutlet weak var logoCenterConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var ForgetLoginPassword: UIButton!
    
    @IBOutlet weak var forgotPassTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var socialsView: UIView!
    
    
    //MARK: - input views
    @IBOutlet weak var loginEmailInputView: AMInputView!
    @IBOutlet weak var loginPasswordInputView: AMInputView!
    @IBOutlet weak var signupEmailInputView: AMInputView!
    @IBOutlet weak var signupPasswordInputView: AMInputView!
    @IBOutlet weak var signupPasswordConfirmInputView: AMInputView!
    
    

    
    @objc func playerItemDidReachEnd(notification: NSNotification) {
        
        if let p = notification.object as? AVPlayerItem {
            p.seek(to: CMTime.zero, completionHandler: nil)
        }
    }

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
      //Background Video
        view.backgroundColor = UIColor(red: 224 / 255, green: 68 / 255, blue: 98 / 255, alpha: 1)
      
       // videoURL = Bundle.main.url(forResource: "CD", withExtension: "mov")?.absoluteURL
        ButtonTag = 1
        //LOGIN
        // set view to login mode
        toggleViewMode(animated: false)
        
        //add keyboard notification
        NotificationCenter.default.addObserver(self, selector: #selector(keyboarFrameChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification , object: nil)
      
        signupButton.layer.cornerRadius = 10
        
        signupButton.clipsToBounds = true
        
        loginButton.layer.cornerRadius = 10
        
        loginButton.clipsToBounds = true
        Logo.image = UIImage(named: "ENBDLOGO")
        
    }
    //MARK:Changing Color
    
    @IBAction func EIButton(_ sender: Any) {
        signupView.backgroundColor = UIColor.flatPurple()
//signupContentView.backgroundColor = UIColor.flatPurpleColorDark()
        loginView.backgroundColor = UIColor.flatWhite()
        loginButton.titleLabel?.textColor = UIColor.flatPurpleColorDark()
        loginEmailInputView.textFieldView.textColor = UIColor.flatBlack()
        loginPasswordInputView.textFieldView.textColor = UIColor.flatBlack()
        loginPasswordInputView.labelView.textColor = UIColor.flatBlack()
        loginPasswordInputView.backWhiteView.backgroundColor = UIColor.lightGray
        loginEmailInputView.labelView.textColor = UIColor.flatBlack()
        loginEmailInputView.backWhiteView.backgroundColor = UIColor.flatGray()
        ForgetLoginPassword.titleLabel?.textColor = UIColor.flatPurpleColorDark()
        EIcircle.image = UIImage(named: "FullCircle")
        ENBDcircle.image = UIImage(named: "BlankCircle")
        
        Logo.image = UIImage(named: "EILogo")
        ButtonTag = 2
    }
    
    @IBAction func ENBDbutton(_ sender: Any) {
        
        signupView.backgroundColor = UIColor.flatYellowColorDark()
        //signupContentView.backgroundColor = UIColor.flatPurpleColorDark()
        loginView.backgroundColor = UIColor.flatBlueColorDark()
        loginButton.titleLabel?.textColor = UIColor.flatWhite()
        loginEmailInputView.textFieldView.textColor = UIColor.flatWhite()
       // loginPasswordInputView.textFieldView.textColor = UIColor.flatBlack()
       // loginPasswordInputView.labelView.textColor = UIColor.flatBlack()
       // loginPasswordInputView.backWhiteView.backgroundColor = UIColor.lightGray
        //loginEmailInputView.labelView.textColor = UIColor.flatBlack()
        //loginEmailInputView.backWhiteView.backgroundColor = UIColor.flatGray()
        ForgetLoginPassword.titleLabel?.textColor = UIColor.flatWhite()
        EIcircle.image = UIImage(named: "BlankCircle")
        ENBDcircle.image = UIImage(named: "FullCircle")
        
        Logo.image = UIImage(named: "ENBDLOGO")
        ButtonTag = 1
    }
    
    
    //MARK:Functions

    func setupVideoBackgrond() {
        
        if let url = videoURL {
            
            let shade = UITableViewCell(frame: self.view.frame)
            shade.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
            view.addSubview(shade)
            view.sendSubviewToBack(shade)
            
            var avPlayer = AVPlayer()
            avPlayer = AVPlayer(url: url)
            let avPlayerLayer = AVPlayerLayer(player: avPlayer)
            avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            avPlayer.volume = 0
            avPlayer.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
            
            avPlayerLayer.frame = view.layer.bounds
            
            let layer = UITableViewCell(frame: self.view.frame)
            view.backgroundColor = UIColor.clear
            view.layer.insertSublayer(avPlayerLayer, at: 0)
            view.addSubview(layer)
            view.sendSubviewToBack(layer)
            
            NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: avPlayer.currentItem)
            
            avPlayer.play()
        }
    }
    
    //MARK: - button actions
    @IBAction func loginButtonTouchUpInside(_ sender: AnyObject) {
        let Email:String? = loginEmailInputView.textFieldView.text!
        var Password:String? = loginPasswordInputView.textFieldView.text!
        if mode == .signup {
            toggleViewMode(animated: true)
            
        }
        if Email == "" || Password == ""
        {
            //message box
            let msg = UIAlertController(title: "Error", message: "Please enter your Email & Password ", preferredStyle: .alert)
            msg.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(msg, animated: true, completion: nil)
            
        }
        else if Email != nil && Password != nil
        {
            //TODO: login by this data
            SVProgressHUD.show()
            
            Auth.auth().signIn(withEmail: loginEmailInputView.textFieldView.text!, password: loginPasswordInputView.textFieldView.text!) { (user, error) in
                
                if error != nil {
                    let msg = UIAlertController(title: "Error", message: "\(error!.localizedDescription) ", preferredStyle: .alert)
                    msg.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                        NSLog("The \"OK\" alert occured.")
                        
                    }))
                    self.present(msg, animated: true, completion: nil)
                    Password = ""
                    SVProgressHUD.dismiss()
                } else {
                    print("Log in successful!")
                    
                    SVProgressHUD.dismiss()
                    
                    self.performSegue(withIdentifier: "GoToHome", sender: self)
                    
                }
            }
        }else
        {
            let msg = UIAlertController(title: "Error", message: "Please enter your Email & Password ", preferredStyle: .alert)
            msg.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(msg, animated: true, completion: nil)
            Password = ""
        }
        
        
        
    }
    
    
 
    
    @IBAction func signupButtonTouchUpInside(_ sender: AnyObject) {
        let Email:String? = signupEmailInputView.textFieldView.text!
        var Password:String? = signupPasswordInputView.textFieldView.text!
        var confirmPassword:String? = signupPasswordConfirmInputView.textFieldView.text!
    
        if mode == .login {
            toggleViewMode(animated: true)
        } else if Email != nil && Password != nil && confirmPassword != nil {
            
            //TODO: signup by this data
            SVProgressHUD.show()
            
            //Set up a new user on our Firebase database
            if Password == confirmPassword {
                
                Auth.auth().createUser(withEmail:signupEmailInputView.textFieldView.text!, password: signupPasswordInputView.textFieldView.text!) { (user, error) in
                    
                    if error != nil && Password!.count <= 6 {
                        let msg = UIAlertController(title: "Error", message: " \(error!.localizedDescription) ", preferredStyle: .alert)
                        
                        msg.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                            NSLog("The \"OK\" alert occured.")
                            
                        }))
                        self.present(msg, animated: true, completion: nil)
                        SVProgressHUD.dismiss()
                        Password = ""
                        confirmPassword = ""

                    }
                    else
                    {
                        print("Registration Successful!")
                        
                        SVProgressHUD.dismiss()
                        
                        self.performSegue(withIdentifier: "GoToHome", sender: self)
                    }
                }
            }
                }
         if Password != confirmPassword {
                let msg = UIAlertController(title: "Error", message: "Passwords Does'nt Match ", preferredStyle: .alert)
                msg.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                    
                }))
                self.present(msg, animated: true, completion: nil)
                SVProgressHUD.dismiss()

            Password = ""
            confirmPassword = ""
          

                }
            }
    
    
    
    
    //MARK: - toggle view
    func toggleViewMode(animated:Bool){
        
        // toggle mode
        mode = mode == .login ? .signup:.login
        videoURL = Bundle.main.url(forResource: "CD", withExtension: "mp4")?.absoluteURL
        // set constraints changes
 backImageLeftConstraint.constant = mode == .login ? 0:-self.view.frame.size.width
        
        
       loginWidthConstraint.isActive = mode == .signup ? true:false
        logoCenterConstraint.constant = (mode == .login ? -1:1) * (loginWidthConstraint.multiplier * self.view.frame.size.width)/2
       loginButtonVerticalCenterConstraint.priority = UILayoutPriority(rawValue: (mode == .login ? 900:900))
        signupButtonVerticalCenterConstraint.priority = UILayoutPriority(rawValue: (mode == .signup ?900:900))
        
        
        //animate
        self.view.endEditing(true)
        
        UIView.animate(withDuration:animated ? animationDuration:0) {
            
            //animate constraints
            self.view.layoutIfNeeded()
            
            //hide or show views
            self.loginContentView.alpha = self.mode == .login ? 1:0
            self.signupContentView.alpha = self.mode == .signup ? 1:0
            
            
            // rotate and scale login button
            let scaleLogin:CGFloat = self.mode == .login ? 1:0.4
           // let rotateAngleLogin:CGFloat = self.mode == .login ? 0:CGFloat(-M_PI_2)
            let rotateAngleLogin:CGFloat = self.mode == .login ? 0:CGFloat(Double.pi/2)
            
            var transformLogin = CGAffineTransform(scaleX: scaleLogin, y: scaleLogin)
            transformLogin = transformLogin.rotated(by: rotateAngleLogin)
            self.loginButton.transform = transformLogin
            
            
            // rotate and scale signup button
            let scaleSignup:CGFloat = self.mode == .signup ? 1:0.4
            let rotateAngleSignup:CGFloat = self.mode == .signup ? 0:CGFloat(Double.pi/2)
            
            var transformSignup = CGAffineTransform(scaleX: scaleSignup, y: scaleSignup)
            transformSignup = transformSignup.rotated(by: rotateAngleSignup)
            self.signupButton.transform = transformSignup
        }
        
    }
    
    
    //MARK: - keyboard
    @objc func keyboarFrameChange(notification:NSNotification){
        
        let userInfo = notification.userInfo as! [String:AnyObject]
        
        // get top of keyboard in view
        let topOfKetboard = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue .origin.y
        
        
        // get animation curve for animate view like keyboard animation
        var animationDuration:TimeInterval = 0.25
        var animationCurve:UIView.AnimationCurve = .easeOut
        if let animDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber {
            animationDuration = animDuration.doubleValue
        }
        
        if let animCurve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber {
            animationCurve =  UIView.AnimationCurve.init(rawValue: animCurve.intValue)!
        }
        
        
        // check keyboard is showing
        let keyboardShow = topOfKetboard != self.view.frame.size.height
        
        
        //hide logo in little devices
        let hideLogo = self.view.frame.size.height < 667
        
        // set constraints
   backImageBottomConstraint.constant = self.view.frame.size.height - topOfKetboard
        
        logoTopConstraint.constant = keyboardShow ? (hideLogo ? 0:20):50
        logoHeightConstraint.constant = keyboardShow ? (hideLogo ? 0:40):60
        logoBottomConstraint.constant = keyboardShow ? 20:32
        logoButtomInSingupConstraint.constant = keyboardShow ? 20:32
        
        // forgotPassTopConstraint.constant = keyboardShow ? 30:45
        
        loginButtonTopConstraint.constant = keyboardShow ? 25:30
        signupButtonTopConstraint.constant = keyboardShow ? 23:35
        
        loginButton.alpha = keyboardShow ? 1:0.7
        signupButton.alpha = keyboardShow ? 1:0.7
        
        
        
        // animate constraints changes
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(animationDuration)
        UIView.setAnimationCurve(animationCurve)
        
        self.view.layoutIfNeeded()
        
        UIView.commitAnimations()
        
    }
    
    //MARK: - hide status bar in swift3
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    
//    @IBAction func Logout(_ sender: UIBarButtonItem) {
//        
//        do {
//            try Auth.auth().signOut()
//            
//            navigationController?.popToRootViewController(animated: true)
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
//
//    }
    
}//END





