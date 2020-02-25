//
//  Dealer.swift
//  CardGameApp
//
//  Created by jinie on 2020/02/25.
//  Copyright © 2020 jinie. All rights reserved.
//

import Foundation

class Dealer: Playable {
    private var hands = [Card]()
    private var cards = CardDeck()
    
    func receive(_ hand: Card) {
        hands.append(hand)
    }
    
    func count() -> Int {
        return cards.count()
    }
    
    func shuffle() {
        cards.shuffle()
    }
    
    func card() -> Card {
        return cards.removeOne()
    }
    
    func reset() {
        cards.reset()
    }
}
