//
//  ViewController.swift
//  Sujka The Game
//
//  Created by McPusz on 08/05/16.
//  Copyright © 2016 McPusz. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    
    var buttonBeep: AVAudioPlayer?
    var secondBeep : AVAudioPlayer?
    var backgroundMusic : AVAudioPlayer?
    
    var beepPlayer: AVAudioPlayer?
    
    var count = 0
    var seconds = 0
    var timer = NSTimer()
    
    @IBAction func buttonPressed(){ /* pressing a button */
        
        count += 1
    
        
        scoreLabel.text = "Score \n\(count)"
        NSLog("Button Pressed")
        buttonBeep?.play()
        
    }
    
    func subtractTime(){    /* decrement seconds, update timeLabel, alert pop-up */
        
        seconds -= 1
        timerLabel.text = "Time: \(seconds)"
        
        secondBeep?.play()
        
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
        
        backgroundMusic?.volume = 0.3
        backgroundMusic?.play()
        
    }
   
    func playSoundFile(){
        if let myAssetSound = NSDataAsset(name:"buttonBeep"){
            let soundFile = myAssetSound.data
            
            do{
                try beepPlayer = AVAudioPlayer (data: soundFile)
            } catch{
                print("NO AUDIO PLAYER")
            }
            beepPlayer!.play()
        }
    }
    
    
    
//    func setupAudioPlayerWithFile(file: NSString, type: NSString)-> AVAudioPlayer? {
//        
//        //1
//        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
//        let url = NSURL.fileURLWithPath(path!)
//        
//        //2
//        var audioPlayer: AVAudioPlayer?
//        
//        //3
//        do{
//            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
//        }catch{
//            print("Player not available")
//        }
//        
//        return audioPlayer
//        
//    }

    override func viewDidLoad() {
        
//        if let buttonBeep = self.setupAudioPlayerWithFile("ButtonTap", type: "wav"){
//            self.buttonBeep = buttonBeep
//        }
//        
//        if let secondBeep = self.setupAudioPlayerWithFile("SecondBeep", type: "wav"){
//            self.secondBeep = secondBeep
//        }
//        
//        if let backgroundMusic = self.setupAudioPlayerWithFile("BackgroundMusic", type: "wav"){
//            self.backgroundMusic = backgroundMusic
//        }
        
        
        
        super.viewDidLoad()
        setupGame()
        
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_1.png")!)
        
        scoreLabel.backgroundColor = UIColor( patternImage: UIImage(named: "field_score.png")!)
        
        timerLabel.backgroundColor = UIColor (patternImage: UIImage(named: "field_time.png")!)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
}

