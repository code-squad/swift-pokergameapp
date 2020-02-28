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
    
    private func makeSuit(suit: Card.suit) -> [Card] {
        return (1...13).map {
            Card(suit: suit, rank: Card.rank(rawValue: $0)!)
        }
    }
    
    private mutating func makeDeck() {
        Card.suit.allCases.forEach {
            cards.append(contentsOf: makeSuit(suit: $0))
        }
        cards.shuffle()
    }
}
