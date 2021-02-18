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
    
    init(cardDeck: CardDeck, hand: Hand) {
        self.cardDeck = cardDeck
        self.hand = hand
    }
    
    convenience init(cardDeck: CardDeck) {
        self.init(cardDeck: cardDeck, hand: Hand(cards: []))
    }
    
    func getHandInfo() -> Hand {
        return self.hand
    }
    
    func getNameInfo() -> String {
        return self.name
    }
    
    func takeRemainCards() -> CardDeck {
        return cardDeck
    }
    
    func handOut(_ numberOfCards: Int) -> [Card] {
        var cards: [Card] = []
        self.cardDeck.shuffle()
        
        for _ in 0..<numberOfCards {
            guard self.cardDeck.count() > 0 else {
                continue
            }
            cards.append(self.cardDeck.removeOne())
        }
        
        return cards
    }
}
