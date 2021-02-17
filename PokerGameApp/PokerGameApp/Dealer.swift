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
    
    init(cardDeck: CardDeck, hand: Hand) {
        self.cardDeck = cardDeck
        self.hand = hand
    }
    
    var handInfo: Hand {
        return self.hand
    }
    
    var nameInfo: String {
        return self.name
    }
    
    var remainCards: CardDeck {
        return cardDeck
    }
    
    func handOut(_ numberOfCards: Int) -> [Card] {
        var cards: [Card] = []
        self.cardDeck.shuffle()
        
        for _ in 0..<numberOfCards {
            cards.append(self.cardDeck.removeOne())
        }
        
        return cards
    }
}
