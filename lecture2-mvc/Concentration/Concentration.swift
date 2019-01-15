  //
//  Concentration.swift
//  Concentration
//
//  Created by Mark Manalo on 1/5/19.
//  Copyright © 2019 DealerSocket. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    func chooseCard(at index: Int)
    {
         
    }
    
    init(numberOfPairsOfCards: Int)
    {
        for _ in 1...numberOfPairsOfCards
        {
            let card = Card()
            // since Card is a struct they are copied when you put them into the array
            cards += [card, card] // you can append to arrays with the + operator, so we are adding the card and the matching card
        }        
        
        // TODO: shuffle cardsa
    }
}
