//
//  Deck.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/28.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

struct Deck {
    
    private var cards: [Card] = []
    
    init() {
        makeDeck()
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    mutating func reset() {
        makeDeck()
    }
    
    mutating func removeOne() -> Card? {
        cards.popLast()
    }
    
    private func makeSuit(suit: Card.Suit) -> [Card] {
        return (1...13).map {
            Card(suit: suit, rank: Card.Rank(rawValue: $0) ?? .one)
        }
    }
    
    private mutating func makeDeck() {
        Card.Suit.allCases.forEach {
            cards.append(contentsOf: makeSuit(suit: $0))
        }
        cards.shuffle()
    }
}
