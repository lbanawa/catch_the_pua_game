//
//  ViewController.swift
//  CatchThePuaGame
//
//  Created by Lauren Banawa on 3/26/20.
//  Copyright © 2020 Lauren Banawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var score = 0
    
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
        
    }
    
    // action
    @objc func increaseScore() {
        // increase the score by 1
        score += 1
        // update score label with current score each time score increases
        scoreLabel.text = "Score: \(score)"
    }


}

