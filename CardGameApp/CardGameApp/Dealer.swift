//
//  Dealer.swift
//  CardGameApp
//
//  Created by jinie on 2020/02/25.
//  Copyright © 2020 jinie. All rights reserved.
//

import Foundation

class Dealer: Playable {
    private var cards = [Card]()
    private var deck = CardDeck()
    
    func receive(_ card: Card) {
        cards.append(card)
    }
    
    func count() -> Int {
        return deck.count()
    }
    
    func shuffle() {
        deck.shuffle()
    }
    
    func card() -> Card {
        return deck.removeOne()
    }
    
    func reset() {
        deck.reset()
    }
    
    func canContinue(stud: Poker.Stud, numberOfPlayers: Poker.NumberOfPlayers) -> Bool {
        return count() > (stud.rawValue * (numberOfPlayers.rawValue + 1))
    }
    
    func allCards() -> [Card] {
        return cards
    }
}
