//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/16.
//

import Foundation

struct CardDeck {
    
    private var cards: [Card] = []
    
    init() {
        reset()
    }
    
    func count() -> Int {
        return cards.count
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    mutating func removeOne() -> Card? {
        if let lastCard = cards.popLast() { return lastCard }
        return nil
    }
    
    mutating func reset() {
        cards = Card.Suit.allCases.flatMap { suit in
            Card.Rank.allCases.map { rank in
                Card(suit: suit, rank: rank)
            }
        }
    }
}
