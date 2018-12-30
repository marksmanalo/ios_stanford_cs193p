//
//  ViewController.swift
//  Concentration
//
//  Created by Mark Manalo on 12/25/18.
//  Copyright © 2018 DealerSocket. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0
    {
        // this is called a property observer
        // it gets called everytime flipCount is set
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func TouchCard(_ sender: UIButton) {
        flipCount += 1
        FlipCard(withEmoji: "👻", on: sender)
    }
    
    @IBAction func TouchSecondCard(_ sender: UIButton) {
        flipCount += 1
        FlipCard(withEmoji: "🎃", on: sender)
    }
    
    func FlipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
        else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

