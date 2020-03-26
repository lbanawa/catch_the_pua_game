//
//  ViewController.swift
//  CatchThePuaGame
//
//  Created by Lauren Banawa on 3/26/20.
//  Copyright © 2020 Lauren Banawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Variables
    var score = 0
    var timer = Timer()
    var counter = 0
    var puaArray = [UIImageView] ()
    var hideTimer = Timer()
    var highScore = 0
    
    // Views
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var pua1: UIImageView!
    @IBOutlet weak var pua2: UIImageView!
    @IBOutlet weak var pua3: UIImageView!
    @IBOutlet weak var pua4: UIImageView!
    @IBOutlet weak var pua5: UIImageView!
    @IBOutlet weak var pua6: UIImageView!
    @IBOutlet weak var pua7: UIImageView!
    @IBOutlet weak var pua8: UIImageView!
    @IBOutlet weak var pua9: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text =  "Score: \(score)"
        
        // check if high score exists -- if not, do not update
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "High Score: \(highScore)"
        }
        
        // update high score if it exists
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScoreLabel.text = "High Score: \(highScore)"
        }
        
        
        // enable the images to be interacted with/ tapped
        pua1.isUserInteractionEnabled = true
        pua2.isUserInteractionEnabled = true
        pua3.isUserInteractionEnabled = true
        pua4.isUserInteractionEnabled = true
        pua5.isUserInteractionEnabled = true
        pua6.isUserInteractionEnabled = true
        pua7.isUserInteractionEnabled = true
        pua8.isUserInteractionEnabled = true
        pua9.isUserInteractionEnabled = true
        
        // for each image, use increaseScore() as the action to take after the tap gesture is recognized
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        // connect the recognizers to the images
        pua1.addGestureRecognizer(recognizer1)
        pua2.addGestureRecognizer(recognizer2)
        pua3.addGestureRecognizer(recognizer3)
        pua4.addGestureRecognizer(recognizer4)
        pua5.addGestureRecognizer(recognizer5)
        pua6.addGestureRecognizer(recognizer6)
        pua7.addGestureRecognizer(recognizer7)
        pua8.addGestureRecognizer(recognizer8)
        pua9.addGestureRecognizer(recognizer9)
        
        puaArray = [pua1, pua2, pua3, pua4, pua5, pua6, pua7, pua8, pua9]
        
        // Timers
        counter = 10 // start the timer at 10
        timeLabel.text = String(counter) // replace the time label with a string of the updated value from the counter
        // change the time at one second intervals, use countDown() as the action, repeat until counter reaches 0
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        // change the visible image at 0.5 second intervals, use hidePua() as the action, repeat until counter reaches 0
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hidePua), userInfo: nil, repeats: true)
        
        hidePua()
        
    }
    
    
    
    // image action
    @objc func hidePua() {
        // make all images hidden initially
        for pua in puaArray {
            pua.isHidden = true
        }
        
        // randomly give a number between 0 and 8 because 8 is the highest index value in the puaArray -- convert to an integer
        let random = Int(arc4random_uniform(UInt32(puaArray.count - 1)))
        
        // choose one image, using the index value generated randomly, to make visible to the user
        puaArray[random].isHidden = false
        
    }
    
    // score action
    @objc func increaseScore() {
        // increase the score by 1
        score += 1
        // update score label with current score each time score increases
        scoreLabel.text = "Score: \(score)"
    }
    
    // timer action
    @objc func countDown() {
        // decrease counter by 1
        counter -= 1
        // update time label with current time each instance time decreases
        timeLabel.text = String(counter)
        
        // stop counting down and animating images once counter reaches 0
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            // hide all images once counter reaches 0
            for pua in puaArray {
                pua.isHidden = true
            }
            
            // high score update function
            if self.score > self.highScore {
                self.highScore = self.score // set high score equal to score if new score is higher than current high score
                highScoreLabel.text = "High Score: \(highScore)" // update high score label text with new high score
                UserDefaults.standard.set(self.highScore, forKey: "highscore") // store this value
            }
            
            
            
            // send user alert once timer reaches 0
            let alert = UIAlertController(title: "Time's Up", message: "Would you like to play again?", preferredStyle: UIAlertController.Style.alert)
            // create button for users to dismiss the alert
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            // create button to allow users to play again
            let replayButton = UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default) { (UIAlertAction) in
                // replay function
                self.score = 0 // reset score
                self.scoreLabel.text = "Score: \(self.score)" // reset score text label
                self.counter = 10 // reset timer
                self.timeLabel.text  = String(self.counter) // reset timer text label
                
                // call the timer functions again to allow replay
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hidePua), userInfo: nil, repeats: true)
                
                
            }
            
            // add the buttons to the alerts
            alert.addAction(okButton)
            alert.addAction(replayButton)
            // show the alert
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }


}

