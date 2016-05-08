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
    var seconds = 0
    var timer = NSTimer()
    
    @IBAction func buttonPressed(){ /* pressing a button */
        
        count += 1
    
        
        scoreLabel.text = "Score \n\(count)"
        NSLog("Button Pressed")
        
    }
    
    func subtractTime(){    /* decrement seconds, update timeLabel, alert pop-up */
        
        seconds -= 1
        timerLabel.text = "Time: \(seconds)"
        
        if (seconds == 0) {
            
            timer.invalidate()  /* koniec pomiaru sekund */
            
            let alert = UIAlertController(title: "Time's up!", message: "You scored \(count) points", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: {
                    action in self.setupGame()
            }))
            
            presentViewController(alert, animated: true, completion: nil)
            
        } /* if */
        
    }
    
    func setupGame(){   /* set time/score */
        
        seconds = 30
        count = 0
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
        
        timerLabel.text = "Time: \(seconds)"
        scoreLabel.text = "Score: \(count)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGame()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
}

