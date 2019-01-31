//
//  WebLoad.swift
//  AnimalPlanet
//
//  Created by Apple on 5/4/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class WebLoad: UIViewController {

    @IBOutlet weak var webVeiw: UIWebView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = URL(string: "www.google.ae")
        webVeiw.loadRequest(URLRequest(url: url!))
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
