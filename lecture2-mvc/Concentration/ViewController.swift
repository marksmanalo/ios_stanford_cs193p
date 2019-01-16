//
//  ViewController.swift
//  Concentration
//
//  Created by Mark Manalo on 12/25/18.
//  Copyright © 2018 DealerSocket. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // We cant just use cardButtons.count because cardButtons is not available yet,
    // ViewController is still initializing itself and this includes initializing var game, var cardButtons etc...
    // We can use lazy to get arround this. Making a var lazy means it doesnt actually initialize until
    // someone needs to use it
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0
    {
        // this is called a property observer
        // it gets called everytime flipCount is set
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func TouchCard(_ sender: UIButton) {
        flipCount += 1
        // .index of returns int?, this means its of type 'optional'
        // if its set then it has an int value else its nil, like nullable
        // in c#
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else {
            print("chosen card was not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🎃", "👻", "👣", "👁", "🦷", "💄", "🎱", "💯", "🥦"];
    
    var emoji = Dictionary<Int, String>()
    
    func emoji(for card: Card ) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        if emoji[card.identifier] != nil {
            // the "!" is like .value in c# nullable types
            return emoji[card.identifier]!
        } else {
            return "?"
        }
    }
}

