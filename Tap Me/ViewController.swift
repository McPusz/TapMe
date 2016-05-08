//
//  ViewController.swift
//  Tap Me
//
//  Created by McPusz on 08/05/16.
//  Copyright © 2016 McPusz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    
    var count = 0
    
    @IBAction func buttonPressed(){ /* pressing a button */
        
        count++
    
        
        scoreLabel.text = "Score \n\(count)"
        NSLog("Button Pressed")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
}

