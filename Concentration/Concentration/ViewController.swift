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

    @IBOutlet var cardButtons: [UIButton]!
    
    let emojiChoices = ["🎃", "👻", "🎃", "👻"];
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func TouchCard(_ sender: UIButton) {
        flipCount += 1
        // .index of returns int?, this means its of type 'optional'
        // if its set then it has an int value else its nil, like nullable
        // in c#
        if let cardNumber = cardButtons.index(of: sender) {
            FlipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
        else {
            print("chosen card was not in cardButtons")
        }
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

