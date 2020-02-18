//
//  Dealer.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/08.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Dealer: Player {
    private var deck = Deck()
    var deckCount: Int {
        deck.count
    }
    
    func drawCard() -> Card? {
        return deck.removeOne()
    }
    
    func shuffle() {
        deck.shuffle()
    }
    
    func resetDeck() {
        deck.reset()
    }
}
