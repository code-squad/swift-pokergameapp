//
//  Dealer.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/17.
//

import Foundation

class Dealer {
    private var cardDeck: CardDeck
    private let hand: Hand
    private let name = "딜러"

    init(cardDeck: CardDeck) {
        self.cardDeck = cardDeck
        self.hand = Hand(cards: [])
    }
    
    func handOut(_ numberOfCards: Int) -> [Card] {
        var cards: [Card] = []
        
        for _ in 0..<numberOfCards {
            cards.append(self.cardDeck.removeOne())
        }
        
        return cards
    }
}
